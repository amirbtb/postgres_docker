with source as (

    select * from {{ source('stg', 'immats_2018') }}

),

renamed as (

    select
        index,
        date,
        genre_moto,
        marque,
        modele,
        carrosserie,
        cylindree,
        code_departement,
        departement,
        volume,
        jo

    from source

)

select * from renamed