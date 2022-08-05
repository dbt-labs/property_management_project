with source as (
    select * from {{ source('property_management', 'leases') }}
),

staged as (
    select
        -- ids
        id as lease_id,
        unit_id,
        rental_application_id,

        -- descriptions
        completed as is_completed,
        start_date,
        end_date,

        -- timestamps
        created_at,
        uploaded_at

    from source
)

select * from staged