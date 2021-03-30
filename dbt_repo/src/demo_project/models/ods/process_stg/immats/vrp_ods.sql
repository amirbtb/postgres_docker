with source as (

    select * from {{ source('stg', 'vrp') }}

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