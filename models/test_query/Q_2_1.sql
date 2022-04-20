{{
    config (
      engine='MergeTree()'
    )
}}


SELECT
    sum(LO_REVENUE) as total_sum,
    toYear(LO_ORDERDATE) AS year,
    P_BRAND
FROM {{ ref('lineorder_flat') }}
WHERE P_CATEGORY = 'MFGR#12' AND S_REGION = 'AMERICA'
GROUP BY
    year,
    P_BRAND
ORDER BY
    year,
    P_BRAND