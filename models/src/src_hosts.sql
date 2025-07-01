with all_hosts as (select * from airbnb.raw.raw_hosts)
select 
    id as host_id, 
    name as host_name, 
    is_superhost, 
    created_at, 
    updated_at
from all_hosts
