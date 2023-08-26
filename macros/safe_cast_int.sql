{% macro safe_cast_int(column_name) %}
    CASE
        WHEN {{ column_name }} = '..' THEN NULL
        ELSE TRY_CAST({{ column_name }} AS INT)
    END
{% endmacro %}
