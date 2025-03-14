{% macro change_nulls(column) %}
    coalesce({{ column }}, 0)
{% endmacro %}
