{% macro margin_percent(revenue, purchase_cost) %}
    ROUND(SAFE_DIVIDE(SUM({{revenue}} - {{purchase_cost}}),{{revenue }}),2)
{% endmacro %}