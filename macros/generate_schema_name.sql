{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if target.name in ['prod', 'dev'] and custom_schema_name is not none -%}

        {{ custom_schema_name | trim }}

    {%- else -%}
    
        {%- if custom_schema_name is none -%}

            {{ default_schema }}
        
        {%- elif custom_schema_name == 'erp_banvic' -%}

            {{ custom_schema_name | trim }}

        {%- else -%}

            {{ default_schema }}_{{ custom_schema_name | trim }}

        {%- endif -%}
    
    {%- endif -%}

{%- endmacro %}