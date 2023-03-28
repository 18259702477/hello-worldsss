create or replace package PG2_LBB375 is

  -- Author  : WPING
  -- Created : 2013-05-07 09:59:02
  -- Purpose : 二炼钢连铸综合报表(三)
  
  type v_cur is ref cursor;
  procedure REPROT1(P_DAY in varchar2, p_cur out v_cur);
	

end PG2_LBB375;

 
/
create or replace package body PG2_LBB375 is


/*
20131101  xyz LKB522要调用本包体结果,修改成 搜索结果插入临时表中 以方便后继取值 

*/

  procedure REPROT1(P_DAY in varchar2, p_cur out v_cur) AS
	
  BEGIN 
	
  
  delete tb2_lkb590 t ;	
	 
  
  --增加每列列名
  
  insert into tb2_lkb590
  ( id, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24  )
  (select 0,
  'GROUP_CD', '班组', 'ML工艺坯', 'ML总坯数', 'ML优质率', '中高碳工艺坯', '中高碳总坯数', '中高碳优质率', 
  '品种工艺坯', '品种总坯数', '品种优质率', '热送支数', '总坯数', '热送率' from dual ) ;
 

 --将原搜索结果存入临时表中
  
  insert into tb2_lkb590
  ( id,t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24  )
  (select 1,
  t.GROUP_CD, t.班组, t.ML工艺坯, t.ML总坯数, t.ML优质率, t.中高碳工艺坯, t.中高碳总坯数,   t.中高碳优质率, t.品种工艺坯, 
  t.品种总坯数, t.品种优质率, t.热送支数, t.总坯数, t.热送率  from 
  ( SELECT A.GROUP_CD,
             decode(A.GROUP_CD, '1', '甲', '2', '乙', '3', '丙', '4', '丁')  AS "班组",
             A.工艺坯 AS "ML工艺坯",
             A.总坯数 AS "ML总坯数",
             A.优质率 AS "ML优质率",
             B.工艺坯 AS "中高碳工艺坯",
             B.总坯数 AS "中高碳总坯数",
             B.优质率 AS "中高碳优质率",
             NVL(A.工艺坯,0) + NVL(B.工艺坯,0) AS "品种工艺坯",
             NVL(A.总坯数,0) + NVL(B.总坯数,0) AS "品种总坯数",
             round((1 - (NVL(A.工艺坯,0) + NVL(B.工艺坯,0)) / (NVL(A.总坯数,0) + NVL(B.总坯数,0)))*100, 2) AS "品种优质率",
             C.热送支数,
             C.总坯数,
             C.热送率
        FROM (SELECT T.GROUP_CD,
                     sum(T.GYP_NUM) 工艺坯,
                     sum(T.CUT_NUM) 总坯数,
                     ROUND((1 - sum(T.GYP_NUM) / sum(T.CUT_NUM)) * 100, 2) 优质率
                FROM TB2_SRS20 T
               WHERE T.CCM_NO = 'LG2H1'
                 AND T.STL_GRD like 'ML%'
                 AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                     SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY
               GROUP BY T.GROUP_CD) A
        LEFT JOIN (SELECT T.GROUP_CD,
                          sum(T.GYP_NUM) 工艺坯,
                          sum(T.CUT_NUM) 总坯数,
                          ROUND((1 - sum(T.GYP_NUM) / sum(T.CUT_NUM)) * 100,
                                2) 优质率
                     FROM TB2_SRS20 T
                    WHERE T.CCM_NO = 'LG2H1'
                      AND (T.STL_GRD like '40%' OR T.STL_GRD like '45%' OR
                          T.STL_GRD like '60%' OR T.STL_GRD like '65%')
                      AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                          SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY
                    GROUP BY T.GROUP_CD) B
          ON B.GROUP_CD = A.GROUP_CD
        LEFT JOIN (SELECT T.GROUP_CD,
                          sum(T.TABLE_ROLLER_NUM_SUM) 热送支数,
                          sum(T.CUT_NUM) 总坯数,
                          ROUND(sum(T.TABLE_ROLLER_NUM_SUM) / sum(T.CUT_NUM) * 100,
                                2) 热送率
                     FROM TB2_SRS20 T
                    WHERE T.CCM_NO = 'LG2H2'
                      AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                          SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY
                    GROUP BY T.GROUP_CD) C
          ON C.GROUP_CD = A.GROUP_CD
         -- 
         UNION
         ( SELECT '5',
             '累计' AS "班组",
             A.工艺坯 AS "ML工艺坯",
             A.总坯数 AS "ML总坯数",
             A.优质率 AS "ML优质率",
             B.工艺坯 AS "中高碳工艺坯",
             B.总坯数 AS "中高碳总坯数",
             B.优质率 AS "中高碳优质率",
             NVL(A.工艺坯,0) + NVL(B.工艺坯,0) AS "品种工艺坯",
             NVL(A.总坯数,0) + NVL(B.总坯数,0) AS "品种总坯数",
             round((1 - (NVL(A.工艺坯,0) + NVL(B.工艺坯,0)) / (NVL(A.总坯数,0) + NVL(B.总坯数,0)))*100, 2) AS "品种优质率",
             C.热送支数,
             C.总坯数,
             C.热送率
        FROM (SELECT  sum(T.GYP_NUM) 工艺坯,
                     sum(T.CUT_NUM) 总坯数,
                     ROUND((1 - sum(T.GYP_NUM) / sum(T.CUT_NUM)) * 100, 2) 优质率
                FROM TB2_SRS20 T
               WHERE T.CCM_NO = 'LG2H1'
                 AND T.STL_GRD like 'ML%'
                 AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                     SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY) A
        LEFT JOIN (SELECT sum(T.GYP_NUM) 工艺坯,
                          sum(T.CUT_NUM) 总坯数,
                          ROUND((1 - sum(T.GYP_NUM) / sum(T.CUT_NUM)) * 100,
                                2) 优质率
                     FROM TB2_SRS20 T
                    WHERE T.CCM_NO = 'LG2H1'
                      AND (T.STL_GRD like '40%' OR T.STL_GRD like '45%' OR
                          T.STL_GRD like '60%' OR T.STL_GRD like '65%')
                      AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                          SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY) B
          ON 1 = 1
        LEFT JOIN (SELECT   sum(T.TABLE_ROLLER_NUM_SUM) 热送支数,
                          sum(T.CUT_NUM) 总坯数,
                          ROUND(sum(T.TABLE_ROLLER_NUM_SUM) / sum(T.CUT_NUM) * 100,
                                2) 热送率
                     FROM TB2_SRS20 T
                    WHERE T.CCM_NO = 'LG2H2'
                      AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                          SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY) C
          ON 1 = 1)
         ORDER BY GROUP_CD) t
     ) ;
  
  commit;
    OPEN P_CUR FOR
    
  select t.t11 GROUP_CD , t.t12 班组 , t.t13 ML工艺坯 , t.t14 ML总坯数 , t.t15 ML优质率 , t.t16 中高碳工艺坯 , 
  t.t17 中高碳总坯数 , t.t18 中高碳优质率 , t.t19 品种工艺坯 , t.t20 品种总坯数 , t.t21 品种优质率 , t.t22 热送支数 , 
  t.t23 总坯数 , t.t24 热送率
  from  tb2_lkb590 t where t.id=1	  order by t.t11				 
				 ;
				 
				 
  END REPROT1;


 

end PG2_LBB375;
/
