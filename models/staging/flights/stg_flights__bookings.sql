{{
  config(
    materialized = 'table',
    tags = ['bookings']
  )
}}
SELECT
    book_ref,
    book_date,
    total_amount    
FROM
  {{ source('demo_src', 'bookings') }}
{{ limit_data_dev('book_date', 3000)}}