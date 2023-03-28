create or replace package PG2_LBB370 is

  
  -- Author  : WENGPING
  -- Created : 2013-04-26 14:14:38
  -- Purpose : 二炼钢连铸车间综合报表

  type v_cur is ref cursor;
  procedure REPROT1(P_DAY in varchar2, p_cur out v_cur); 



end PG2_LBB370;

 
/
create or replace package body PG2_LBB370 is

/*
20131031  xyz LKB522要调用本包体结果,修改成 搜索结果插入临时表中 以方便后继取值 
*/

  procedure REPROT1(P_DAY in varchar2, p_cur out v_cur) AS
     V_MON_WGT NUMBER(14,3); 
  BEGIN
  SELECT SUM(T.钢坯量) INTO V_MON_WGT FROM ELGZGLG.TB2_REPORT_LZ T WHERE T.生产日期 BETWEEN (SUBSTR(P_DAY, 1, 6) || '01') AND P_DAY; 
  
  delete tb2_lkb590 t   ;	
	
	--增加每列列名
	
  insert into tb2_lkb590
  ( id, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50 )
  (select 0, 
	'排序', '生产班', '生产班组', '连铸机座', '炉数', '月累计炉数', '钢坯量', '月累计钢坯量', '钢水量', '月累计钢水量', '连铸收得率', '月累计连铸收得率', '班数', '平均班产', '月累计中包个数', '中包个数', '中包龄', '月累计溢漏次数', '溢漏次数', '万吨溢漏次数', '质量废品量', '冶废量', '合格率', '粗轧', '中轧', '精轧', '废坯量', '回归收得率', '月累计对接次数', '对接次数', '月累计组数', '组数', '连浇炉数', '开机对接失败次数', '开浇对接总次数', '开机对接成功率', '铸机断流次数', '非计划停机', '回炉数', '回炉吨数' from dual ) ;
 
 --将原搜索结果存入临时表中
  insert into tb2_lkb590
  ( id, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50 )
  (select 1,
  tt.排序, tt.生产班, tt.生产班组, tt.连铸机座, tt.炉数, tt.月累计炉数, tt.钢坯量, tt.月累计钢坯量, tt.钢水量, tt.月累计钢水量, tt.连铸收得率, tt.月累计连铸收得率, tt.班数, tt.平均班产, tt.月累计中包个数, tt.中包个数, tt.中包龄, tt.月累计溢漏次数, tt.溢漏次数, tt.万吨溢漏次数, tt.质量废品量, tt.冶废量, tt.合格率, tt.粗轧, tt.中轧, tt.精轧, tt.废坯量, tt.回归收得率, tt.月累计对接次数, tt.对接次数, tt.月累计组数, tt.组数, tt.连浇炉数, tt.开机对接失败次数, tt.开浇对接总次数, tt.开机对接成功率, tt.铸机断流次数, tt.非计划停机, tt.回炉数, tt.回炉吨数   from 
  (
  SELECT LZ1.排序 AS 排序,
           LZ1.生产班,
           LZ1.生产班组 AS 生产班组,
           LZ1.连铸机座 AS 连铸机座,
           LZ2.炉数 AS 炉数,
           LZ1.炉数 AS 月累计炉数,
           LZ2.钢坯量 AS 钢坯量,
           LZ1.钢坯量 AS 月累计钢坯量,
           LZ2.钢水量 AS 钢水量,
           LZ1.钢水量 AS 月累计钢水量,
           LZ2.连铸收得率 AS 连铸收得率,
           LZ1.连铸收得率 AS 月累计连铸收得率,
           LZ1.班数   AS 班数,
           LZ1.平均班产 AS 平均班产,
           LZ1.中包个数 AS 月累计中包个数,
           LZ2.中包个数 AS 中包个数,
           LZ1.中包龄   AS 中包龄,
           LZ1.溢漏次数 AS 月累计溢漏次数,
           LZ2.溢漏次数 AS 溢漏次数,
           round(LZ1.溢漏次数*10000/LZ1.钢坯量,2) AS 万吨溢漏次数,
           LZ1.质量废品量 AS 质量废品量,
           LZ1.冶废量 AS 冶废量,
           round((LZ1.钢坯量 - nvl(LZ1.质量废品量,0))/LZ1.钢坯量*100,2)  AS 合格率,
           LZ1.粗轧  AS 粗轧,
           LZ1.中轧  AS 中轧,
           LZ1.精轧  AS 精轧,
           LZ1.废坯量 AS 废坯量,
           round(LZ1.钢坯量/(nvl(LZ1.废坯量,0)+LZ1.钢坯量+nvl(LZ1.冶废量,0))*100,2) AS 回归收得率,
           LZ1.对接次数 AS 月累计对接次数,
           LZ2.对接次数 AS 对接次数,
           LZ1.中包个数 - nvl(LZ1.对接次数,0) AS 月累计组数,
           LZ2.中包个数 - nvl(LZ2.对接次数,0) AS 组数,
           ROUND(LZ1.炉数/(LZ1.中包个数 - nvl(LZ1.对接次数,0)),2) AS 连浇炉数,
           LZ1.开浇对接失败 AS 开机对接失败次数,
           nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0) AS 开浇对接总次数,
           ROUND(nvl(LZ1.开浇对接成功,0)/decode((nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0)),'0','9999999999',(nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0)))*100,2)  AS 开机对接成功率,
           LZ1.铸机断流次数 AS 铸机断流次数,
           LZ1.非计划停机 AS 非计划停机,
           LZ1.回炉数 AS 回炉数,
           LZ1.回炉吨数 AS 回炉吨数
     FROM (SELECT 1 AS 排序,SGLGZB.GF_COMMNAMEFIND('G0004',生产班组, '2') AS 生产班组,SGLGZB.GF_COMMNAMEFIND('Q0177',连铸机座, '2') AS 连铸机座,生产班组 AS 生产班,
           COUNT(1) AS 炉数,
           TRIM(TO_CHAR(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON),'999999990.000')) AS 钢坯量,
           TRIM(TO_CHAR(SUM(钢水量),'999999990.000')) AS 钢水量,
           TRIM(TO_CHAR(ROUND((SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON))/SUM(钢水量)*100,2),'999999990.00')) AS 连铸收得率,
           COUNT(DISTINCT 生产日期) 班数,
           TRIM(TO_CHAR(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/COUNT(DISTINCT 生产日期),'999999990.000')) 平均班产,
           round(sum(1 / ZB.MAX_TD_AGE), 2) 中包个数,
           round(count(1) / sum(1 / ZB.MAX_TD_AGE), 2) 中包龄,
           SUM(LZ65.B) 溢漏次数,
           SUM(LB21.ZLKH_WGT) 质量废品量,
           SUM(LB22.A) 冶废量,
           sum(case when LB22.类型 = '粗轧' then '1' end) 粗轧,
           sum(case when LB22.类型 = '中轧' then '1' end) 中轧,
           sum(case when LB22.类型 = '精轧' then '1' end) 精轧,
           MAX(LB31.废坯量) 废坯量,
           MAX(LB31.对接次数) 对接次数,
           MAX(LB31.开浇对接成功) 开浇对接成功,
           MAX(LB31.开浇对接失败) 开浇对接失败,
           MAX(LB31.铸机断流次数) 铸机断流次数,
           MAX(LB31.非计划停机) 非计划停机,
           MAX(LB31.回炉数) 回炉数,
           MAX(LB31.回炉吨数) 回炉吨数
      FROM TB2_REPORT_LZ
      LEFT JOIN SGLGZB.TB2_REPORT_SAVE LG2WGT ON LG2WGT.SMS_DATE = P_DAY AND LG2WGT.FAC = 'LG2'
      LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.冶炼编号
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "中包寿命"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.炉号               
     LEFT JOIN (select * from TB2_LBB210 t where t.zlkh_type = '3' and t.zlkh_lz like 'LG2H%') LB21 ON LB21.L2_CH_NO = TB2_REPORT_LZ.炉号
      LEFT JOIN (select distinct t.l2_ch_no,max(t.zlkh_reason) 类型,round(sum(q.slab_wgt_total)/sum(q.slab_amount)*max(t.zlkh_wgt),2) AS "A" from TB2_LBB210 t left join elgzgzl.tb2_qc230 q on q.l2_ch_no = t.l2_ch_no
      where t.zlkh_type = '4' and t.zlkh_lz like 'LG2H%'
      group by t.l2_ch_no) LB22 ON LB22.L2_CH_NO = TB2_REPORT_LZ.炉号 
      LEFT JOIN (SELECT t.bof_no,group_cd,
sum(case when t.project = '废坯量' then num end) "废坯量",
sum(case when t.project = '对接次数' then num end) "对接次数",
sum(case when t.project = '开浇对接成功' then num end) "开浇对接成功",
sum(case when t.project = '开浇对接失败' then num end) "开浇对接失败",
sum(case when t.project = '铸机断流次数' then num end) "铸机断流次数",
sum(case when t.project = '非计划停机' then num end) "非计划停机",
sum(case when t.project = '回炉数' then num end) "回炉数",
sum(case when t.project = '回炉吨数' then num end) "回炉吨数",
sum(case when t.project = '铜管支数' then num end) "铜管支数"
FROM TB2_LBB311 t WHERE t.kh_type = '综合报表' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
group by bof_no,group_cd) LB31   ON LB31.BOF_NO = TB2_REPORT_LZ.连铸机座 AND LB31.GROUP_CD = TB2_REPORT_LZ.生产班组 
     WHERE 生产日期 BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
     GROUP BY 生产班组,连铸机座) LZ1 
    LEFT JOIN
    (SELECT 1 AS 排序,SGLGZB.GF_COMMNAMEFIND('G0004',生产班组, '2') AS 生产班组,SGLGZB.GF_COMMNAMEFIND('Q0177',连铸机座, '2') AS 连铸机座,生产班组 AS 生产班,
           COUNT(1) AS 炉数,
           TRIM(TO_CHAR(SUM(钢坯量),'999999990.000')) AS 钢坯量,
           TRIM(TO_CHAR(SUM(钢水量),'999999990.000')) AS 钢水量,
           TRIM(TO_CHAR(ROUND(SUM(钢坯量)/SUM(钢水量)*100,2),'999999990.00')) AS 连铸收得率,
           round(sum(1 / ZB.MAX_TD_AGE), 2) 中包个数,
           SUM(LZ65.B) 溢漏次数,
           MAX(LB31.对接次数) 对接次数
      FROM TB2_REPORT_LZ
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.冶炼编号
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "中包寿命"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.炉号 
    LEFT JOIN (SELECT t.bof_no,group_cd,
sum(case when t.project = '对接次数' then num end) "对接次数"
FROM TB2_LBB311 t WHERE t.kh_type = '综合报表' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date = P_DAY
group by bof_no,group_cd) LB31   ON LB31.BOF_NO = TB2_REPORT_LZ.连铸机座 AND LB31.GROUP_CD = TB2_REPORT_LZ.生产班组
     WHERE 生产日期 = P_DAY
     GROUP BY 生产班组,连铸机座) LZ2 ON LZ2.生产班组 = LZ1.生产班组 AND LZ2.连铸机座 = LZ1.连铸机座
     UNION
    SELECT LZ1.排序 AS 排序,
           LZ1.生产班,
           LZ1.生产班组 AS 生产班组,
           LZ1.连铸机座 AS 连铸机座,
           LZ2.炉数 AS 炉数,
           LZ1.炉数 AS 月累计炉数,
           LZ2.钢坯量 AS 钢坯量,
           LZ1.钢坯量 AS 月累计钢坯量,
           LZ2.钢水量 AS 钢水量,
           LZ1.钢水量 AS 月累计钢水量,
           LZ2.连铸收得率 AS 连铸收得率,
           LZ1.连铸收得率 AS 月累计连铸收得率,
           LZ1.班数   AS 班数,
           LZ1.平均班产 AS 平均班产,
           LZ1.中包个数 AS 月累计中包个数,
           LZ2.中包个数 AS 中包个数,
           LZ1.中包龄   AS 中包龄,
           LZ1.溢漏次数 AS 月累计溢漏次数,
           LZ2.溢漏次数 AS 溢漏次数,
           round(LZ1.溢漏次数*10000/LZ1.钢坯量,2) AS 万吨溢漏次数,
           LZ1.质量废品量 AS 质量废品量,
           LZ1.冶废量 AS 冶废量,
           round((LZ1.钢坯量 - nvl(LZ1.质量废品量,0))/LZ1.钢坯量*100,2)  AS 合格率,
           LZ1.粗轧  AS 粗轧,
           LZ1.中轧  AS 中轧,
           LZ1.精轧  AS 精轧,
           LZ1.废坯量 AS 废坯量,
           round(LZ1.钢坯量/(nvl(LZ1.废坯量,0)+LZ1.钢坯量+nvl(LZ1.冶废量,0))*100,2) AS 回归收得率,
           LZ1.对接次数 AS 月累计对接次数,
           LZ2.对接次数 AS 对接次数,
           LZ1.中包个数 - nvl(LZ1.对接次数,0) AS 月累计组数,
           LZ2.中包个数 - nvl(LZ2.对接次数,0) AS 组数,
           ROUND(LZ1.炉数/(LZ1.中包个数 - nvl(LZ1.对接次数,0)),2) AS 连浇炉数,
           LZ1.开浇对接失败 AS 开机对接失败次数,
           nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0) AS 开浇对接总次数,
           ROUND(nvl(LZ1.开浇对接成功,0)/decode((nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0)),'0','9999999999',(nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0)))*100,2)  AS 开机对接成功率,
           LZ1.铸机断流次数 AS 铸机断流次数,
           LZ1.非计划停机 AS 非计划停机,
           LZ1.回炉数 AS 回炉数,
           LZ1.回炉吨数 AS 回炉吨数
      FROM (SELECT 1 AS 排序,SGLGZB.GF_COMMNAMEFIND('G0004',生产班组, '2') AS 生产班组,'班组合计' AS 连铸机座,生产班组 AS 生产班,
           COUNT(1) AS 炉数,
           TRIM(TO_CHAR(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON),'999999990.000')) AS 钢坯量,
           TRIM(TO_CHAR(SUM(钢水量),'999999990.000')) AS 钢水量,
           TRIM(TO_CHAR(ROUND((SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON))/SUM(钢水量)*100,2),'999999990.00')) AS 连铸收得率,
           COUNT(DISTINCT 生产日期) 班数,
           TRIM(TO_CHAR(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/COUNT(DISTINCT 生产日期),'999999990.000')) 平均班产,
           round(sum(1 / ZB.MAX_TD_AGE), 2) 中包个数,
           round(count(1) / sum(1 / ZB.MAX_TD_AGE), 2) 中包龄,
           SUM(LZ65.B) 溢漏次数,
           SUM(LB21.ZLKH_WGT) 质量废品量,
           SUM(LB22.A) 冶废量,
           sum(case when LB22.类型 = '粗轧' then '1' end) 粗轧,
           sum(case when LB22.类型 = '中轧' then '1' end) 中轧,
           sum(case when LB22.类型 = '精轧' then '1' end) 精轧,
           MAX(LB31.废坯量) 废坯量,
           MAX(LB31.对接次数) 对接次数,
           MAX(LB31.开浇对接成功) 开浇对接成功,
           MAX(LB31.开浇对接失败) 开浇对接失败,
           MAX(LB31.铸机断流次数) 铸机断流次数,
           MAX(LB31.非计划停机) 非计划停机,
           MAX(LB31.回炉数) 回炉数,
           MAX(LB31.回炉吨数) 回炉吨数
      FROM TB2_REPORT_LZ
      LEFT JOIN SGLGZB.TB2_REPORT_SAVE LG2WGT ON LG2WGT.SMS_DATE = P_DAY AND LG2WGT.FAC = 'LG2'
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.冶炼编号
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "中包寿命"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.炉号  
     LEFT JOIN (select * from TB2_LBB210 t where t.zlkh_type = '3' and t.zlkh_lz like 'LG2H%') LB21 ON LB21.L2_CH_NO = TB2_REPORT_LZ.炉号
      LEFT JOIN (select distinct t.l2_ch_no,max(t.zlkh_reason) 类型,round(sum(q.slab_wgt_total)/sum(q.slab_amount)*max(t.zlkh_wgt),2)  "A" from TB2_LBB210 t left join elgzgzl.tb2_qc230 q on q.l2_ch_no = t.l2_ch_no
      where t.zlkh_type = '4' and t.zlkh_lz like 'LG2H%'
      group by t.l2_ch_no) LB22 ON LB22.L2_CH_NO = TB2_REPORT_LZ.炉号  
       LEFT JOIN (SELECT group_cd,
sum(case when t.project = '废坯量' then num end) "废坯量",
sum(case when t.project = '对接次数' then num end) "对接次数",
sum(case when t.project = '开浇对接成功' then num end) "开浇对接成功",
sum(case when t.project = '开浇对接失败' then num end) "开浇对接失败",
sum(case when t.project = '铸机断流次数' then num end) "铸机断流次数",
sum(case when t.project = '非计划停机' then num end) "非计划停机",
sum(case when t.project = '回炉数' then num end) "回炉数",
sum(case when t.project = '回炉吨数' then num end) "回炉吨数",
sum(case when t.project = '铜管支数' then num end) "铜管支数"
FROM TB2_LBB311 t WHERE t.kh_type = '综合报表' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
group by group_cd) LB31   ON  LB31.GROUP_CD = TB2_REPORT_LZ.生产班组
     WHERE 生产日期 BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
     GROUP BY 生产班组) LZ1 
     LEFT JOIN
    (SELECT 1 AS 排序,SGLGZB.GF_COMMNAMEFIND('G0004',生产班组, '2') AS 生产班组 ,'班组合计' AS 连铸机座,生产班组 AS 生产班,
           COUNT(1) AS 炉数,
           TRIM(TO_CHAR(SUM(钢坯量),'999999990.000')) AS 钢坯量,
           TRIM(TO_CHAR(SUM(钢水量),'999999990.000')) AS 钢水量,
           TRIM(TO_CHAR(ROUND(SUM(钢坯量)/SUM(钢水量)*100,2),'999999990.00')) AS 连铸收得率,
           round(sum(1 / ZB.MAX_TD_AGE), 2) 中包个数,
           SUM(LZ65.B) 溢漏次数,
           MAX(LB31.对接次数) 对接次数
      FROM TB2_REPORT_LZ
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.冶炼编号
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "中包寿命"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
      LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.炉号
     LEFT JOIN (SELECT group_cd,
sum(case when t.project = '对接次数' then num end) "对接次数"
FROM TB2_LBB311 t WHERE t.kh_type = '综合报表' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date = P_DAY
group by bof_no,group_cd) LB31   ON  LB31.GROUP_CD = TB2_REPORT_LZ.生产班组
     WHERE 生产日期 = P_DAY
     GROUP BY 生产班组) LZ2 ON LZ2.生产班组 = LZ1.生产班组 AND LZ2.连铸机座 = LZ1.连铸机座
     UNION
    SELECT LZ1.排序 AS 排序,
           LZ1.生产班,
           LZ1.生产班组 AS 生产班组,
           LZ1.连铸机座 AS 连铸机座,
           LZ2.炉数 AS 炉数,
           LZ1.炉数 AS 月累计炉数,
           LZ2.钢坯量 AS 钢坯量,
           LZ1.钢坯量 AS 月累计钢坯量,
           LZ2.钢水量 AS 钢水量,
           LZ1.钢水量 AS 月累计钢水量,
           LZ2.连铸收得率 AS 连铸收得率,
           LZ1.连铸收得率 AS 月累计连铸收得率,
           LZ1.班数   AS 班数,
           LZ1.平均班产 AS 平均班产,
           LZ1.中包个数 AS 月累计中包个数,
           LZ2.中包个数 AS 中包个数,
           LZ1.中包龄   AS  中包龄,
           LZ1.溢漏次数 AS 月累计溢漏次数,
           LZ2.溢漏次数 AS 溢漏次数,
           round(LZ1.溢漏次数*10000/LZ1.钢坯量,2) AS 万吨溢漏次数,
           LZ1.质量废品量 AS 质量废品量,
           LZ1.冶废量 AS 冶废量,
           round((LZ1.钢坯量 - nvl(LZ1.质量废品量,0))/LZ1.钢坯量*100,2)  AS 合格率,
           LZ1.粗轧  AS 粗轧,
           LZ1.中轧  AS 中轧,
           LZ1.精轧  AS 精轧,
           LZ1.废坯量 AS 废坯量,
           round(LZ1.钢坯量/(nvl(LZ1.废坯量,0)+LZ1.钢坯量+nvl(LZ1.冶废量,0))*100,2) AS 回归收得率,
           LZ1.对接次数 AS 月累计对接次数,
           LZ2.对接次数 AS 对接次数,
           LZ1.中包个数 - nvl(LZ1.对接次数,0) AS 月累计组数,
           LZ2.中包个数 - nvl(LZ2.对接次数,0) AS 组数,
           ROUND(LZ1.炉数/(LZ1.中包个数 - nvl(LZ1.对接次数,0)),2) AS 连浇炉数,
           LZ1.开浇对接失败 AS 开机对接失败次数,
           nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0) AS 开浇对接总次数,
           ROUND(nvl(LZ1.开浇对接成功,0)/decode((nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0)),'0','9999999999',(nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0)))*100,2)  AS 开机对接成功率,
           LZ1.铸机断流次数 AS 铸机断流次数,
           LZ1.非计划停机 AS 非计划停机,
           LZ1.回炉数 AS 回炉数,
           LZ1.回炉吨数 AS 回炉吨数
      FROM (SELECT 2 AS 排序,'机座合计' AS 生产班组,SGLGZB.GF_COMMNAMEFIND('Q0177',连铸机座, '2') AS 连铸机座,'' AS 生产班,
           COUNT(1) AS 炉数,
           TRIM(TO_CHAR(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON),'999999990.000')) AS 钢坯量,
           TRIM(TO_CHAR(SUM(钢水量),'999999990.000')) AS 钢水量,
           TRIM(TO_CHAR(ROUND((SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON))/SUM(钢水量)*100,2),'999999990.00')) AS 连铸收得率,
           COUNT(DISTINCT 生产日期) 班数,
           TRIM(TO_CHAR(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/COUNT(DISTINCT 生产日期),'999999990.000')) 平均班产,
           round(sum(1 / ZB.MAX_TD_AGE), 2) 中包个数,
           round(count(1) / sum(1 / ZB.MAX_TD_AGE), 2) 中包龄,
           SUM(LZ65.B) 溢漏次数,
           SUM(LB21.ZLKH_WGT) 质量废品量,
           SUM(LB22.A) 冶废量,
           sum(case when LB22.类型 = '粗轧' then '1' end) 粗轧,
           sum(case when LB22.类型 = '中轧' then '1' end) 中轧,
           sum(case when LB22.类型 = '精轧' then '1' end) 精轧,
           MAX(LB31.废坯量) 废坯量,
           MAX(LB31.对接次数) 对接次数,
           MAX(LB31.开浇对接成功) 开浇对接成功,
           MAX(LB31.开浇对接失败) 开浇对接失败,
           MAX(LB31.铸机断流次数) 铸机断流次数,
           MAX(LB31.非计划停机) 非计划停机,
           MAX(LB31.回炉数) 回炉数,
           MAX(LB31.回炉吨数) 回炉吨数
      FROM TB2_REPORT_LZ
      LEFT JOIN SGLGZB.TB2_REPORT_SAVE LG2WGT ON LG2WGT.SMS_DATE = P_DAY AND LG2WGT.FAC = 'LG2'
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.冶炼编号
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "中包寿命"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.炉号
    LEFT JOIN (select * from TB2_LBB210 t where t.zlkh_type = '3' and t.zlkh_lz like 'LG2H%') LB21 ON LB21.L2_CH_NO = TB2_REPORT_LZ.炉号
      LEFT JOIN (select distinct t.l2_ch_no,max(t.zlkh_reason) 类型,round(sum(q.slab_wgt_total)/sum(q.slab_amount)*max(t.zlkh_wgt),2)  "A" from TB2_LBB210 t left join elgzgzl.tb2_qc230 q on q.l2_ch_no = t.l2_ch_no
      where t.zlkh_type = '4' and t.zlkh_lz like 'LG2H%'
      group by t.l2_ch_no) LB22 ON LB22.L2_CH_NO = TB2_REPORT_LZ.炉号  
       LEFT JOIN (SELECT t.bof_no,
sum(case when t.project = '废坯量' then num end) "废坯量",
sum(case when t.project = '对接次数' then num end) "对接次数",
sum(case when t.project = '开浇对接成功' then num end) "开浇对接成功",
sum(case when t.project = '开浇对接失败' then num end) "开浇对接失败",
sum(case when t.project = '铸机断流次数' then num end) "铸机断流次数",
sum(case when t.project = '非计划停机' then num end) "非计划停机",
sum(case when t.project = '回炉数' then num end) "回炉数",
sum(case when t.project = '回炉吨数' then num end) "回炉吨数",
sum(case when t.project = '铜管支数' then num end) "铜管支数"
FROM TB2_LBB311 t WHERE t.kh_type = '综合报表' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
group by bof_no) LB31   ON LB31.BOF_NO = TB2_REPORT_LZ.连铸机座 
     WHERE 生产日期 BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
     GROUP BY 连铸机座 ) LZ1 
    LEFT JOIN
    (SELECT 2 AS 排序,'机座合计' AS 生产班组,SGLGZB.GF_COMMNAMEFIND('Q0177',连铸机座, '2') AS 连铸机座,'' AS 生产班,
           COUNT(1) AS 炉数,
           TRIM(TO_CHAR(SUM(钢坯量),'999999990.000')) AS 钢坯量,
           TRIM(TO_CHAR(SUM(钢水量),'999999990.000')) AS 钢水量,
           TRIM(TO_CHAR(ROUND(SUM(钢坯量)/SUM(钢水量)*100,2),'999999990.00')) AS 连铸收得率,
           round(sum(1 / ZB.MAX_TD_AGE), 2) 中包个数,
           SUM(LZ65.B) 溢漏次数,
           MAX(LB31.对接次数) 对接次数
      FROM TB2_REPORT_LZ
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.冶炼编号
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "中包寿命"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.炉号
     LEFT JOIN (SELECT t.bof_no,
sum(case when t.project = '对接次数' then num end) "对接次数"
FROM TB2_LBB311 t WHERE t.kh_type = '综合报表' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date = P_DAY
group by bof_no) LB31   ON LB31.BOF_NO = TB2_REPORT_LZ.连铸机座
     WHERE 生产日期 = P_DAY
     GROUP BY 连铸机座) LZ2 ON LZ2.生产班组 = LZ1.生产班组 AND LZ2.连铸机座 = LZ1.连铸机座
     UNION
    SELECT LZ1.排序 AS 排序,
           LZ1.生产班,
           LZ1.生产班组 AS 生产班组,
           LZ1.连铸机座 AS 连铸机座,
           LZ2.炉数 AS 炉数,
           LZ1.炉数 AS 月累计炉数,
           LZ2.钢坯量 AS 钢坯量,
           LZ1.钢坯量 AS 月累计钢坯量,
           LZ2.钢水量 AS 钢水量,
           LZ1.钢水量 AS 月累计钢水量,
           LZ2.连铸收得率 AS 连铸收得率,
           LZ1.连铸收得率 AS 月累计连铸收得率,
           LZ1.班数   AS 班数,
           LZ1.平均班产 AS 平均班产,
           LZ1.中包个数 AS 月累计中包个数,
           LZ2.中包个数 AS 中包个数,
           LZ1.中包龄   AS  中包龄,
           LZ1.溢漏次数 AS 月累计溢漏次数,
           LZ2.溢漏次数 AS 溢漏次数,
           round(LZ1.溢漏次数*10000/LZ1.钢坯量,2) AS 万吨溢漏次数,
           LZ1.质量废品量 AS 质量废品量,
           LZ1.冶废量 AS 冶废量,
           round((LZ1.钢坯量 - nvl(LZ1.质量废品量,0))/LZ1.钢坯量*100,2)  AS 合格率,
           LZ1.粗轧  AS 粗轧,
           LZ1.中轧  AS 中轧,
           LZ1.精轧  AS 精轧,
           LZ1.废坯量 AS 废坯量,
           round(LZ1.钢坯量/(nvl(LZ1.废坯量,0)+LZ1.钢坯量+nvl(LZ1.冶废量,0))*100,2) AS 回归收得率,
           LZ1.对接次数 AS 月累计对接次数,
           LZ2.对接次数 AS 对接次数,
           LZ1.中包个数 - nvl(LZ1.对接次数,0) AS 月累计组数,
           LZ2.中包个数 - nvl(LZ2.对接次数,0) AS 组数,
           ROUND(LZ1.炉数/(LZ1.中包个数 - nvl(LZ1.对接次数,0)),2) AS 连浇炉数,
           LZ1.开浇对接失败 AS 开机对接失败次数,
           nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0) AS 开浇对接总次数,
           ROUND(nvl(LZ1.开浇对接成功,0)/decode((nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0)),'0','9999999999',(nvl(LZ1.开浇对接失败,0) + nvl(LZ1.开浇对接成功,0)))*100,2)  AS 开机对接成功率,
           LZ1.铸机断流次数 AS 铸机断流次数,
           LZ1.非计划停机 AS 非计划停机,
           LZ1.回炉数 AS 回炉数,
           LZ1.回炉吨数 AS 回炉吨数
      FROM (SELECT 3 AS 排序,'总合计' AS 生产班组,' ' AS 连铸机座,'' AS 生产班,
           COUNT(1) AS 炉数,
           TRIM(TO_CHAR(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON),'999999990.000')) AS 钢坯量,
           TRIM(TO_CHAR(SUM(钢水量),'999999990.000')) AS 钢水量,
           TRIM(TO_CHAR(ROUND(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/SUM(钢水量)*100,2),'999999990.00')) AS 连铸收得率,
           COUNT(DISTINCT 生产日期) 班数,
           TRIM(TO_CHAR(SUM(钢坯量)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/COUNT(DISTINCT 生产日期),'999999990.000')) 平均班产,
           round(sum(1 / ZB.MAX_TD_AGE), 2) 中包个数,
           round(count(1) / sum(1 / ZB.MAX_TD_AGE), 2) 中包龄,
           SUM(LZ65.B) 溢漏次数,
           SUM(LB21.ZLKH_WGT) 质量废品量,
           SUM(LB22.A) 冶废量,
           sum(case when LB22.类型 = '粗轧' then '1' end) 粗轧,
           sum(case when LB22.类型 = '中轧' then '1' end) 中轧,
           sum(case when LB22.类型 = '精轧' then '1' end) 精轧,
           MAX(LB31.废坯量) 废坯量,
           MAX(LB31.对接次数) 对接次数,
           MAX(LB31.开浇对接成功) 开浇对接成功,
           MAX(LB31.开浇对接失败) 开浇对接失败,
           MAX(LB31.铸机断流次数) 铸机断流次数,
           MAX(LB31.非计划停机) 非计划停机,
           MAX(LB31.回炉数) 回炉数,
           MAX(LB31.回炉吨数) 回炉吨数
      FROM TB2_REPORT_LZ
      LEFT JOIN SGLGZB.TB2_REPORT_SAVE LG2WGT ON LG2WGT.SMS_DATE = P_DAY AND LG2WGT.FAC = 'LG2'
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.冶炼编号
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "中包寿命"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.炉号   
    LEFT JOIN (select * from TB2_LBB210 t where t.zlkh_type = '3' and t.zlkh_lz like 'LG2H%') LB21 ON LB21.L2_CH_NO = TB2_REPORT_LZ.炉号
      LEFT JOIN (select distinct t.l2_ch_no,max(t.zlkh_reason) 类型,round(sum(q.slab_wgt_total)/sum(q.slab_amount)*max(t.zlkh_wgt),2)  "A" from TB2_LBB210 t left join elgzgzl.tb2_qc230 q on q.l2_ch_no = t.l2_ch_no
      where t.zlkh_type = '4' and t.zlkh_lz like 'LG2H%'
      group by t.l2_ch_no) LB22 ON LB22.L2_CH_NO = TB2_REPORT_LZ.炉号  
       LEFT JOIN (SELECT 
sum(case when t.project = '废坯量' then num end) "废坯量",
sum(case when t.project = '对接次数' then num end) "对接次数",
sum(case when t.project = '开浇对接成功' then num end) "开浇对接成功",
sum(case when t.project = '开浇对接失败' then num end) "开浇对接失败",
sum(case when t.project = '铸机断流次数' then num end) "铸机断流次数",
sum(case when t.project = '非计划停机' then num end) "非计划停机",
sum(case when t.project = '回炉数' then num end) "回炉数",
sum(case when t.project = '回炉吨数' then num end) "回炉吨数",
sum(case when t.project = '铜管支数' then num end) "铜管支数"
FROM TB2_LBB311 t WHERE t.kh_type = '综合报表' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY) LB31 ON 1 = 1
     WHERE 生产日期 BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY) LZ1 
    LEFT JOIN
    (SELECT 3 AS 排序,'总合计' AS 生产班组,' ' AS 连铸机座,'' AS 生产班,
           COUNT(1) AS 炉数,
           TRIM(TO_CHAR(SUM(钢坯量),'999999990.000')) AS 钢坯量,
           TRIM(TO_CHAR(SUM(钢水量),'999999990.000')) AS 钢水量,
           TRIM(TO_CHAR(ROUND(SUM(钢坯量)/SUM(钢水量)*100,2),'999999990.00')) AS 连铸收得率,
           round(sum(1 / ZB.MAX_TD_AGE), 2) 中包个数,
           SUM(LZ65.B) 溢漏次数,
           MAX(LB31.对接次数) 对接次数
      FROM TB2_REPORT_LZ
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.冶炼编号
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "中包寿命"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
    LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.炉号  
    LEFT JOIN (SELECT 
sum(case when t.project = '对接次数' then num end) "对接次数"
FROM TB2_LBB311 t WHERE t.kh_type = '综合报表' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date = P_DAY) LB31   ON 1 = 1
     WHERE 生产日期 = P_DAY) LZ2 ON LZ2.生产班组 = LZ1.生产班组 AND LZ2.连铸机座 = LZ1.连铸机座		 
		 
     ORDER BY 排序,生产班 
	) tt  )
	;
	
	commit;
	
  OPEN P_CUR FOR	
    
		 select  t.t11	排序,  t.t12	生产班,  t.t13	生产班组,  t.t14	连铸机座,  t.t15	炉数,  t.t16	月累计炉数,  t.t17	钢坯量,  t.t18	月累计钢坯量,  t.t19	钢水量,  t.t20	月累计钢水量,  t.t21	连铸收得率,  t.t22	月累计连铸收得率,  t.t23	班数,  t.t24	平均班产,  t.t25	月累计中包个数,  t.t26	中包个数,  t.t27	中包龄,  t.t28	月累计溢漏次数,  t.t29	溢漏次数,  t.t30	万吨溢漏次数,  t.t31	质量废品量,  t.t32	冶废量,  t.t33	合格率,  t.t34	粗轧,  t.t35	中轧,  t.t36	精轧,  t.t37	废坯量,  t.t38	回归收得率,  t.t39	月累计对接次数,  t.t40	对接次数,  t.t41	月累计组数,  t.t42	组数,  t.t43	连浇炉数,  t.t44	开机对接失败次数,  t.t45	开浇对接总次数,  t.t46	开机对接成功率,  t.t47	铸机断流次数,  t.t48	非计划停机,  t.t49	回炉数,  t.t50	回炉吨数  	
		 from tb2_lkb590 t  where t.id=1  order by t.t11,t.t12,t14
		 ;
		 
		 
  END REPROT1;




end PG2_LBB370;
/
