select
    rent
from {{ ref('stg_units') }}
group by 1
having not(rent >= 0)
