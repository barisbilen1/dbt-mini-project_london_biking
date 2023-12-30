with table1 as (

SELECT
  *
FROM
  {{ ref('stg_cycle_hires')}}
)

select * from table1