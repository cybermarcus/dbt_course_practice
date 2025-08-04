{% snapshot snap__city_region %}

{{
   config(
       target_schema='snapshots',
       unique_key='city',

       strategy='timestamp',
       updated_at='updated_at',
       dbt_valid_to_current="'9999-01-01'::date",

       hard_deletes='invalidate'
   )
}}

SELECT 
    city,
    region,
    updated_at
FROM 
    {{ ref('city_region') }}

{% endsnapshot %}