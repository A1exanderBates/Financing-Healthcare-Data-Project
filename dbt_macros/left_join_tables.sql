{% macro left_join_tables(primary_table, join_tables) %}
FROM {{ primary_table }} base
{% for table in join_tables %}
    LEFT JOIN {{ table }} 
    ON base.code = {{ table }}.code AND base.year = {{ table }}.year
{% endfor %}
{% endmacro %}
