{% macro check_nulls(table_name, column_name) %}

    SELECT *
    FROM {{ table_name }}
    WHERE {{ column_name }} IS NULL

{% endmacro %}