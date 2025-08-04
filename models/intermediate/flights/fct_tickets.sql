{{
  config(
    materialized = 'table',
    )
}}

SELECT
  ticket_no,
  book_ref,
  passenger_id,
  passenger_name,
  contact_data

FROM
  {{ ref('stg_flights__tickets') }} t

WHERE NOT EXISTS (
  SELECT 1
  FROM {{ ref('str_dict__employees') }} e
  WHERE e.passenger_id = t.passenger_id
)