{% macro random_macro() %}
    
    {% set query %}

    select distinct token_address from {{ref('stg_token_transfers')}} limit 10

    {% endset  %}

    {% if execute %}

    {% set result = run_query(query)%}

    {% set result_list=result.columns[0].values()%}

    {% else %}

    {% set result_list=[] %}

    {% endif %}
  
{% set sql_list = []%}


{% for i in result_list %}

{% do sql_list.append("'"~i~"'")%}

{% endfor%}

  {{ log(sql_list|join(', ')) }}

  {{return(sql_list|join(', '))}}

{% endmacro %}