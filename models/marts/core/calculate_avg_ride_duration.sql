with cycle_hires as (

SELECT
  *
FROM
  {{ ref('stg_cycle_hires') }}
)

select * from cycle_hires