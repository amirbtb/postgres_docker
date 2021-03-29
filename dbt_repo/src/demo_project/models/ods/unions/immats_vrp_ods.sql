with source_immats as (

    select * from {{ ref('immats_ods') }}

),

source_vrp as (

    select * from {{ ref('vrp_ods') }}

),

table_union as (

    select
        i.index as index,
        i.date_1 as date_1,
        i.genre_moto as genre_moto,
        i.marque as marque,
        i.modele as modele,
        i.carrosserie as carrosserie,
        i.cylindree as cylindree,
        i.code_departement as code_departement,
        v.departements as departement,
        v.commerciaux as commerciaux,
        i.date_arrete as date_arrete,
        i.volume as volume,
        i.jo as jo

    from source_immats i
    join source_vrp v 
    on i.code_departement = v.code_departements

)

select * from table_union
