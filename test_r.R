tell <- getQuery("SELECT 
told.user_id `学员id`,
told.start_time `最近一次接通时间`,
t6.call_num `本月外呼次数`,
t6.tell_num `本月接通次数`
FROM 
dm_bi.dm_user_fact_clever_crm_ss_detail_new t1
LEFT JOIN dwd.v_dwd_staff_dim_staff_base_wh t3 ON t1.ss_id = t3.id -- 匹配ss_name
LEFT JOIN
( -- 查询最近一次接通时间
SELECT t1.user_id,
t1.start_time,
ROW_NUMBER() OVER(PARTITION BY t1.user_id ORDER BY t1.start_time DESC) tell_num
FROM 
    (
    SELECT
    t1.u_id,
    t1.u_name,
    t1.user_id,
    t1.bridge_duration,
    t1.start_time
    FROM
    ods_crmnew.v_user_call_detail t1
    INNER JOIN
    (
    SELECT id FROM 
    dwd.v_dwd_staff_dim_staff_base_wh
    WHERE group_name NOT LIKE '%CC%'
    ) t2
    ON t1.u_id = t2.id
    WHERE user_id != 0 AND t1.bridge_duration>=20
    ) t1
) told ON t1.user_id = told.user_id
 LEFT JOIN
 (
    -- 查询学员累计外呼及接通次数
    SELECT 
    t1.user_id,
    COUNT(t1.user_id) AS call_num,
    SUM(CASE WHEN t1.bridge_duration >= 20 THEN 1 ELSE 0 END) AS tell_num
    FROM 
    (
    SELECT
    u_id,
    u_name,
    user_id,
    bridge_duration,
    start_time
    FROM
    ods_crmnew.v_user_call_detail
    WHERE user_id != 0
    ) t1
    INNER JOIN
    (
    SELECT id FROM 
    dwd.v_dwd_staff_dim_staff_base_wh
    WHERE group_name NOT LIKE '%CC%'
    ) t2
    ON t1.u_id = t2.id
    WHERE t1.start_time LIKE '2020-06%'
    GROUP BY 
    t1.user_id
    --查询累计外呼及接通次数结束
    ) t6
 ON t1.user_id = t6.user_id
WHERE 
t1.dt='202006' 
AND told.tell_num = 1 
")