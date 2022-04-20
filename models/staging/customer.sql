{{
    config (
      engine='MergeTree()',
      partition_by=('C_REGION')
    )
}}

select 

  {{ dbt_utils.star(source('dbgen', 'customer')) }}

from {{ source('dbgen', 'customer') }}