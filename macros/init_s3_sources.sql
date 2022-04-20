{% macro init_s3_sources() -%}

    {% set sql_src_customer %}

        CREATE TABLE IF NOT EXISTS dbt.src_customer
        (
                C_CUSTKEY       UInt32,
                C_NAME          String,
                C_ADDRESS       String,
                C_CITY          LowCardinality(String),
                C_NATION        LowCardinality(String),
                C_REGION        LowCardinality(String),
                C_PHONE         String,
                C_MKTSEGMENT    LowCardinality(String)
        )
        ENGINE = S3('https://storage.yandexcloud.net/clickhouse-files/tables/customer.tbl', 'CSV')

    {% endset %}

    {% set sql_src_lineorder %}

        CREATE TABLE IF NOT EXISTS dbt.src_lineorder
        (
            LO_ORDERKEY             UInt32,
            LO_LINENUMBER           UInt8,
            LO_CUSTKEY              UInt32,
            LO_PARTKEY              UInt32,
            LO_SUPPKEY              UInt32,
            LO_ORDERDATE            Date,
            LO_ORDERPRIORITY        LowCardinality(String),
            LO_SHIPPRIORITY         UInt8,
            LO_QUANTITY             UInt8,
            LO_EXTENDEDPRICE        UInt32,
            LO_ORDTOTALPRICE        UInt32,
            LO_DISCOUNT             UInt8,
            LO_REVENUE              UInt32,
            LO_SUPPLYCOST           UInt32,
            LO_TAX                  UInt8,
            LO_COMMITDATE           Date,
            LO_SHIPMODE             LowCardinality(String)
        )
        ENGINE = S3('https://storage.yandexcloud.net/clickhouse-files/tables/lineorder.tbl', 'CSV')
    
    {% endset %}

    {% set sql_src_part %}

        CREATE TABLE IF NOT EXISTS dbt.src_part
        (
                P_PARTKEY       UInt32,
                P_NAME          String,
                P_MFGR          LowCardinality(String),
                P_CATEGORY      LowCardinality(String),
                P_BRAND         LowCardinality(String),
                P_COLOR         LowCardinality(String),
                P_TYPE          LowCardinality(String),
                P_SIZE          UInt8,
                P_CONTAINER     LowCardinality(String)
        )
        ENGINE = S3('https://storage.yandexcloud.net/clickhouse-files/tables//part.tbl', 'CSV')

    {% endset %}

    {% set sql_src_supplier %}

        CREATE TABLE IF NOT EXISTS dbt.src_supplier
        (
                S_SUPPKEY       UInt32,
                S_NAME          String,
                S_ADDRESS       String,
                S_CITY          LowCardinality(String),
                S_NATION        LowCardinality(String),
                S_REGION        LowCardinality(String),
                S_PHONE         String
        )
        ENGINE = S3('https://storage.yandexcloud.net/clickhouse-files/tables/supplier.tbl', 'CSV')

    {% endset %}

        {% for query in [sql_src_customer, sql_src_lineorder, sql_src_part, sql_src_supplier] %}
            {% set table = run_query(query) %}
        {% endfor %}
    

{%- endmacro %}