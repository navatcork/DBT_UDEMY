--{{codegen.generate_source(schema_name='eth_schema',database_name='eth',generate_columns='True', include_data_types=False)}}

--{{codegen.generate_model_yaml(model_names=['stg_contracts','stg_token_transfers','stg_transactions'],upstream_descriptions=True)}}

select
{{dbt_utils.star(from=ref('stg_transactions_enriched'),except=['input'],quote_identifiers=False)}}
from {{ref('stg_transactions_enriched')}}