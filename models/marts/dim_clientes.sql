with
    stg_clientes as(
        select *
        from {{ ref('stg_erp__clientes') }}
    )
    , criar_chave as(
        select
            row_number() over(order by id_cliente ) as pk_cliente
            , id_cliente
            , empresa_cliente
            , nome_cliente
            , endereco_cliente
            , cidade_cliente
            , regiao_cliente
            , cep_cliente
            , pais_cliente
        from stg_clientes
    )

select *
from criar_chave