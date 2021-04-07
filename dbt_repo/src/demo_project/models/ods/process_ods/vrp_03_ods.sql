with source as (

    select * from {{ source('stg', 'vrp_03_21') }}

),

renamed as (

    select
        index,
        code_departements,
        departements,
        commerciaux

    from source

)

select * from renamed