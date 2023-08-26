import os
import boto3
import zipfile
from prefect import task, flow, get_run_logger
from kaggle.api.kaggle_api_extended import KaggleApi

@task
def authenticate():
    api = KaggleApi()
    api.set_config_value('username', os.environ['KAGGLE_USERNAME'])
    api.set_config_value('key', os.environ['KAGGLE_KEY'])
    api.authenticate()
    return api

@task
def download_dataset(api):
    dataset = 'programmerrdai/financing-healthcare'
    api.dataset_download_files(dataset)

@task
def unzip_files():
    extracted_files = []
    for filename in os.listdir():
        if filename.endswith(".zip"):
            with zipfile.ZipFile(filename, 'r') as zip_ref:
                zip_ref.extractall()
            os.remove(filename)
            extracted_files.extend(zip_ref.namelist())
    return extracted_files

@task
def upload_to_s3(files):
    bucket_name = 'financinghealthcarebucket'
    s3 = boto3.client('s3')
    for file in files:
        if file.endswith(".csv"):
            s3.upload_file(file, bucket_name, file)

@flow()
def Fitbit_Data_Pipeline():
    logger = get_run_logger()
    api = authenticate()
    download_dataset(api)
    extracted_files = unzip_files()
    upload_to_s3(extracted_files)
    logger.info("Script completed")

if __name__ == "__main__":
    Fitbit_Data_Pipeline()
