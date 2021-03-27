# postgres_docker
Local setup of Postgres on Docker Compose

### Run Metabase Configurator
1. Run `docker exec dbt python metabase_setup.py`

### Run dbt
1. Run `docker exec dbt bash run_dbt.sh`

### Run dbt-docs website
1. Run `docker exec -d dbt bash serve_dbt_docs.sh`
You can then access the docs website on http://localhost:4444

## codegen dbt
toutes ces commandes sont a lancer depuis la baleine postgres dbt attach shell.
une fois dans le contenaire, `cd demo_project`
### generate source yml pour stg 
`dbt run-operation generate_source --args 'schema_name: stg'`
### generate script sql d'une table  
`dbt run-operation generate_base_model --args '{"source_name": "stg", "table_name": "immats_2021_02"}'`
### generate yml d'une table
`dbt run-operation generate_model_yaml --args '{"model_name": "immats_2021_02"}'`