CREATE OR REPLACE PACKAGE PG2_LKB523 IS
-- 
TYPE V_CUR IS REF CURSOR;
 
	
 
  PROCEDURE tb00_list_01 (p_bt IN varchar2, --查询时间 
                         p_et IN varchar2, --查询时间 
                         --p_zd IN varchar2, --zd
                         --p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR);
 
  PROCEDURE tb00_list_01_04 (p_bt IN varchar2, --查询时间 
                         p_et IN varchar2, --查询时间 
                         --p_zd IN varchar2, --zd
                         --p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR);
  PROCEDURE tb00_list_01_12 (p_bt IN varchar2, --查询时间 
                         p_et IN varchar2, --查询时间 
                         --p_zd IN varchar2, --zd
                         --p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR);
 
  PROCEDURE tb00_list_02 (p_bt IN varchar2, --查询时间 
                         p_et IN varchar2, --查询时间  
                          P_CUR OUT V_CUR);
													
													
  PROCEDURE tb00_list_02_04 (p_bt IN varchar2, --查询时间 
                         p_et IN varchar2, --查询时间  
                          P_CUR OUT V_CUR);
													
													
  PROCEDURE tb00_list_02_12 (p_bt IN varchar2, --查询时间 
                         p_et IN varchar2, --查询时间  
                          P_CUR OUT V_CUR);
													
													
 
  PROCEDURE tb00_list_03 (p_bt IN varchar2, --查询时间 
                         p_et IN varchar2, --查询时间  
                          P_CUR OUT V_CUR);
 
  PROCEDURE tb00_list_04 (p_bt IN varchar2, --查询时间 
                         p_et IN varchar2, --查询时间  
                          P_CUR OUT V_CUR);
 
 

  PROCEDURE tb01_list (  P_CUR OUT V_CUR);
  PROCEDURE tb02_list (  P_CUR OUT V_CUR);
  PROCEDURE tb03_list (   P_CUR OUT V_CUR);
  
  

  PROCEDURE test (P_CUR OUT V_CUR) ;
  /*AAAAA,*/
  PROCEDURE AAA(P_CUR OUT V_CUR);
										     
END PG2_LKB523;

 
/
CREATE OR REPLACE PACKAGE BODY PG2_LKB523 IS
    
 -- [LKB520]-- 连铸考核 P3 班长
 -- by xyz  
 --tb2_lkb522 考核录入表
 --  实体表 TB2_LKB 5 8 0      临时表 tb2_lkb 5 9 1
 


  -- 公共部分 值班主任和班长 共同部分 
  PROCEDURE tb00_list_01(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         --p_zd IN varchar2, --zd
                         --p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    a_CUR   V_CUR ; 
		v_bt  varchar2(30);
		v_et  varchar2(30);
    
  BEGIN
  
	tb00_list_01_04(p_bt,p_et,a_cur);
	
	
  
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_01;


  -- 公共部分 值班主任和班长 共同部分  不分机座只分班组  4个班的算法
  PROCEDURE tb00_list_01_04(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         --p_zd IN varchar2, --zd
                         --p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    a_CUR   V_CUR ; 
    v_bt  varchar2(30);
    v_et  varchar2(30);
    
    V_ZPQFL1  varchar2(10);
    V_ZPQFL2  varchar2(10);
    V_ZPQFL3  varchar2(10);
    V_ZPQFL4  varchar2(10);
    V_ZDF        varchar2(10);
    V_COUNT number;
/*         V_JJ  varchar2(10);*/
    
  BEGIN
  
  v_stra:='                                                  @';
  v_fldm:='LKB521'; 
  v_dt:=substr(replace(p_et,'-',''),1,6);
  v_bt:=(replace(p_bt,'-',''));
  v_et:=(replace(p_et,'-',''));
   
     
  delete TB2_LKB591 ;
  
  --先取出自动指标 从 LBB370 LBB375 中取出 
  PG2_LBB370.REPROT1(replace(p_et,'-',''),a_cur);       
  insert into TB2_LKB591
  (id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50 )
  (select  9370, 9370, id, t02, t03, t04, t05, t06, t07, t08, t09, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50  from tb2_lkb590);  
  
  
  PG2_LBB375.REPROT1(replace(p_et,'-',''),a_cur);   
  insert into TB2_LKB591
  (id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25  )
  (select  9375, 9375,  id, t02, t03, t04, t05, t06, t07, t08, t09, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25   from tb2_lkb590);
  
  --将370 表中 机座填上ID
  update TB2_LKB591 t set   t.t04=nvl(t.t12,5),t.t02=( case when t.t14='1#方坯连铸' then 11 
    when t.t14='2#方坯连铸' then 12    when t.t14='3#方坯连铸' then 13 else 20 end )
  where t.id=9370 and t.t01=1 ;
  update TB2_LKB591 t set   t.t04='BZID',t.t02='ZDID'
  where t.id=9370 and t.t01=0 ;
  
  --将375 表中 机座填上ID
  update TB2_LKB591 t set   t.t04=t.t11,t.t02=11   where t.id=9375  ;
   
  
  insert into  TB2_LKB591 (id,fl,t01,t02,t03,t04,t10,t11,t12)  
  (select 9988,9988,'站点' as t01,'zd' as t02 ,'班组' as t03,'bz' as t04,
  '恒拉速指标' as t10, '有效时间' as t11 ,'总时间' as t12 from dual )   ;
  
  insert into  TB2_LKB591 ( id,fl,t01,t02,t03,t04,t10,t11,t12)  
  (  SELECT 9987,9987,  CCM_NO, zd,
              GROUP_CD, bz,
       ROUND((SUM(PRO_TIME)*7-SUM(UN_TIME)+SUM(MZ_TIME))/DECODE(SUM(PRO_TIME)*7,0,1,SUM(PRO_TIME)*7)*100,2) ,
       (SUM(PRO_TIME)*7-SUM(UN_TIME)+SUM(MZ_TIME)),DECODE(SUM(PRO_TIME)*7,0,1,SUM(PRO_TIME)*7)
        FROM (
          SELECT S.CCM_NO,s.zd,s.bz, 
          S.GROUP_CD, 
          ROUND(S.PRO_TIME/60) AS PRO_TIME,
          ROUND((LS1_UN_TIME+LS2_UN_TIME+LS3_UN_TIME+LS4_UN_TIME+LS5_UN_TIME+LS6_UN_TIME+LS7_UN_TIME)/60) AS UN_TIME,
          NVL(S.S1+S.S2+S.S3+S.S4+S.S5+S.S6+S.S7,0) AS MZ_TIME,
 
          
          ROUND(S.LS1_UN_TIME/60) AS LS1_UN_TIME, 
          ''
  
    FROM   (SELECT SGLGZB.GF_COMMNAMEFIND('Q0177', CCM_NO, '2') AS CCM_NO, CCM_NO zd , 
           GROUP_CD bz, SGLGZB.GF_COMMNAMEFIND('G0004',GROUP_CD, '2') AS GROUP_CD,  
            NVL(PRO_TIME,0) AS PRO_TIME,
            NVL(LS1_UN_TIME,0) AS LS1_UN_TIME,
            
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='1' OR LS='1-7') AND DELETE_BZ = 0) S1,--1流免责时间累积
            NVL(LS2_UN_TIME,0) AS LS2_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='2' OR LS='1-7') AND DELETE_BZ = 0) S2,--2流免责时间累积
            NVL(LS3_UN_TIME,0) AS LS3_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='3' OR LS='1-7') AND DELETE_BZ = 0) S3,--3流免责时间累积
            NVL(LS4_UN_TIME,0) AS LS4_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='4' OR LS='1-7') AND DELETE_BZ = 0) S4,--4流免责时间累积
            NVL(LS5_UN_TIME,0) AS LS5_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='5' OR LS='1-7') AND DELETE_BZ = 0) S5,--5流免责时间累积
            NVL(LS6_UN_TIME,0) AS LS6_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='6' OR LS='1-7') AND DELETE_BZ = 0) S6,--6流免责时间累积
            NVL(LS7_UN_TIME,0) AS LS7_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='7' OR LS='1-7') AND DELETE_BZ = 0) S7--7流免责时间累积
             
       FROM TB2_LLS40 T
       WHERE (T.OCCR_DATE BETWEEN v_bt AND v_et)   ) S 
       ) b
          GROUP BY CCM_NO,GROUP_CD,zd,bz
       );
  
  update TB2_LKB591 t set 
  t.t02=decode(t.t01,    '1#方坯连铸',11,     '2#方坯连铸',12,     '3#方坯连铸',13 ) 
  where t.id=9987 and t.fl=9987;
  
  -- 班组总计 机座不分
  insert into  TB2_LKB591 ( id,fl,t01,t02,t03,t04,t10,t11,t12)  
  ( 
  select 9986,9986 , '小计',20,  t.t03,t.t04,round(sum(t.t11)*100/sum(t.t12),2),sum(t.t11),sum(t.t12)
  from TB2_LKB591 t
  where t.id=9987 and t.fl=9987
  group by t.t03,t.t04
  
  
  )
    ;
		
		
  insert into  TB2_LKB591 ( id,fl,t01,t02,t03,t04,t10,t11,t12)  
  ( 
  select 9985,9985 , '总计',20, '总计',5,round(sum(t.t11)*100/sum(t.t12),2),sum(t.t11),sum(t.t12)
  from TB2_LKB591 t
  where t.id=9987 and t.fl=9987
  --group by t.t03,t.t04
  )
    ;
    
    
  
  
  --插入 中包低液面计算情况
  
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04,t05,t06)   
  (select 9970,9970,'中包低液面情况','bt'||v_bt,'et'||v_et,'zd' ,
   'bz' , to_char(sysdate,'hh24:mi:ss') a from dual);
  
  insert into TB2_LKB591 (id,fl,t01  )  (select 9970,9970,'中包低液面计算情况' from dual);
  
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04,t05)   
  (select 9970,9971,'接不上1,接的上0','机座','机座ID' ,'班组' , '计算值' from dual);
  
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04,t05)   
  ( (select 9970,9972,ifup,ccm_no,substr(ccm_no,-1)+10 b,  group_cd,count(*) a  from 
    (select 
    (case when t."上一炉停浇时间"*1 < t."钢包到达时间"*1 then 1 else 0 end ) ifup,
    t.*  FROM ( 
    SELECT   ( 
    ( select max(LD_CAST_END_TIME)  from TB2_LLZ00 ta01
     where ta01.ccm_no=t.ccm_no and ta01.td_cd=t.td_cd
       and ta01.CAST_NUM <  t.CAST_NUM ))   上一炉停浇时间 , 
       t.*  FROM 
    ( select  NVL(NVL(L1.TD_WGT_MIN, L2.TD_WGT_MIN), L3.TD_WGT_MIN) 中包最小重量, 
    Z.CCM_NO, SUBSTR(LD_ARV_DTIME,1,8) DT,Z.GROUP_CD, 
    LD_ARV_DTIME  AS 钢包到达时间,   nvl(LD_CAST_END_TIME,to_char(sysdate,'YYYYMMDDHH24MISS'))  AS 大包停浇时间,
    td_cd,Z.TD_AGE,  Z.CAST_NUM AS 连浇炉次, Z.CAST_NUM,
    LD_ARV_DTIME
    FROM TB2_LLZ00 Z
    LEFT JOIN TB2_LLZ21 L1  ON L1.CAST_NO = Z.CAST_NO
    LEFT JOIN TB2_LLZ22 L2  ON L2.CAST_NO = Z.CAST_NO
    LEFT JOIN TB2_LLZ23 L3  ON L3.CAST_NO = Z.CAST_NO
                       
    WHERE  LD_ARV_DTIME IS NOT NULL   AND LD_ARV_DTIME   < 20300328134833
     and z.CAST_NUM>1 and z.td_age > 1
     and ( L1.TD_WGT_MIN<16 or  L2.TD_WGT_MIN<16 or  L3.TD_WGT_MIN<16  )
     ) T   where   CAST_NUM is   not   null  
     ) t  ) t
     where dt between  v_bt  and   v_et
     group by ifup,ccm_no,group_cd  )   );
  
  insert into TB2_LKB591 (id,fl,t01  )  (select 9970,9973,'中包低液面标准情况' from dual);
  insert into TB2_LKB591 (id,fl, t02,t03,t04,t05,t06)   
  (select 9970,9974,'基础分','接得上的分数值','接不上的分数值' ,'最大值' , '最小值' from dual);
  insert into TB2_LKB591 (id,fl, t02,t03,t04,t05,t06 , t07)   
  (select 9970,9975,
  nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
                and t.sbbfl='LKB522' and t.sbbdm='C1202')  ),0),  --'基础分',
  nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
                and t.sbbfl='LKB522' and t.sbbdm='C1203')  ),0),  --'接得上的分数值',
  nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
                and t.sbbfl='LKB522' and t.sbbdm='C1204')  ),0),  --'接不上的分数值',
  nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
                and t.sbbfl='LKB522' and t.sbbdm='C1205')  ),0),  --'最大值',
  nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
                and t.sbbfl='LKB522' and t.sbbdm='C1206')  ),0),  --'最小值',
  
  0   from dual);
  
  
  ---------------------原始计算 
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04,t05,t06)  
  (select 110,100,'P3班长','bt'||p_bt,'et'||p_et,'zd' ,
   'bz' , to_char(sysdate,'hh24:mi:ss') a from dual);
  
  insert into TB2_LKB591 (id,fl,t01  )  (select 110,100,'指标情况' from dual);
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04 ,t05,t06,t07,
  t11 , t12 , t13 , t14 , t15 , t16 , t17 , t18 , t19 , 
  t20 , t21 , t22 , t23 , t24 , t25 , t26 , t27 ,
  t31,t32,t33 ,t34,t35 ,t36, t39 , 
    ---------------------谢治光
    t100,t101
      ---------------------谢治光 
  
    )  
  (select 110,105,
  '站点' as t01 , '站点ID' as t02 , '班组' as t03 , '班组ID' as t04 , 'P3班长' as t05 , '职务' as t06 , '个人工分' as t07 , 
  '产量' as t11 , '废品' as t12 , '粗轧' as t13 , '中轧' as t14 , '精轧' as t15 , '收得率' as t16 , '开机对接成功率' as t17 , 
  '新品优质率' as t18 , '断流' as t19 , '工艺违规' as t20 , '不配合' as t21 , '普钢中包龄' as t22 , '非计划停机' as t23 ,
  '成本' as t24 , '微伤' as t25 , '轻伤' as t26 , '重伤' as t27 , 
  '生产考核' as t31 , '工艺考核' as t32 , '班组总考核额' as t33 , '恒拉速' as t34  ,
  '中包低液面接的上' as t35 , '中包低液面接不上' as t36 ,'铸柸切废量' as t39 ,
 ---------------------谢治光  
 '指令完成情况'  as  t100,
  '流程落地稽查'  as  t101
 ---------------------谢治光 
  
    from dual);
  
  
  --  指标
  --分机座 分班组
  insert into TB2_LKB591 (  t13,t14,t15, t20 , t21 , t22 ,   t24 , t25 , t26 , t27 , t35,t36 , 
  t11, t12,  t16, t17,   t23, 
  t69,t68, --断流　漏钢
  t18,
  t31,t32,t33 ,
  id,fl, t01,t02,t03,t04,t05,t06,t07,
---------------------谢治光   
  t100,t101
---------------------谢治光  
    )  
  (  select 
  nvl((ta.t13),0)+nvl((tb.t13),0),nvl((ta.t14),0)+nvl((tb.t14),0),nvl((ta.t15),0)+nvl((tb.t15),0),
  nvl((ta.t20),0),nvl((ta.t21),0),
  nvl((ta.t22),0),nvl((ta.t24),0),nvl((ta.t25),0),nvl((ta.t26),0),nvl((ta.t27),0),  
  nvl((ta.t28),0),nvl((ta.t29),0),  
  nvl((tb.t11),0),nvl((tb.t12),0),nvl((tb.t16),0),nvl((tb.t17),0),nvl((tb.t23),0),  
  nvl((tb.t19),0),nvl((tlg.a),0),
  nvl((tc.t18),0),
  nvl((td.t31),0),nvl((td.t32),0),nvl((td.t33),0),
  t.id,t.fl,t.t01,t.t02,t.t03,t.t04  ,tman.khman,tman.khzw,tman.khgf,
  ---------------------谢治光  
nvl((ta.t100),0),
nvl((ta.t101),0)
 ---------------------谢治光 
  from 
  (select 110 id ,110 fl , ta.khzdid t02,ta.khzd t01,tb.khbbid t04,tb.khbb t03 from 
     (select t.khzdid ,t.khzd from TB2_LKB596 t where t.ifdel=9 and t.khzdid>10 ) ta,        
     (select t.khbbid ,t.khbb from TB2_LKB596 t where t.ifdel=9 and t.khbbid<5 
        union select 5,'小计' from dual ) tb ) t
  
  left join (   select tman.khman ,tman.khzw,tman.khgf,tman.khzdid,tman.khbzid  from tb2_lkb599 tman  
  where tman.ifdel=0 and tman.dt=v_dt and tman.khzw in ('班长','副班长')  and tman.khgz='P3' ) tman
   on tman.khzdid=t.t02 and tman.khbzid=t.t04
  
  --手动录入表
  left join (  select t.khzdid t02, nvl(t.khbzid,'5') t04 ,  
  nvl(sum(t.kh11),0) t13,nvl(sum(t.kh12),0) t14,nvl(sum(t.kh13),0) t15,nvl(sum(t.kh14),0) t20,
  nvl(sum(t.kh15),0) t21,nvl(sum(t.kh16),0) t22,nvl(sum(t.kh17),0) t24,nvl(sum(t.kh18),0) t25,
  nvl(sum(t.kh19),0) t26,nvl(sum(t.kh20),0) t27,
  nvl(sum(nvl(t.kh22,0)),0) t28,nvl(sum(nvl(t.kh23,0)),0) t29,
   ---------------------谢治光 
  nvl(sum(nvl(t.kh24,0)),0) t100,
  nvl(sum(nvl(t.kh25,0)),0) t101
   ---------------------谢治光 
    from tb2_lkb522 t  where t.ifdel=0 and  t.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')
   and t.khname in ( select tman.khman from tb2_lkb599 tman  where tman.ifdel=0 and tman.dt=v_dt 
   and tman.khzw in ('班长')  and tman.khgz='P3'  )  and t.KHDMFL= 'LKB522'
    group by t.khzd,t.khzdid, /*t.khbz,*/cube( t.khbzid )    ) ta on ta.t02=t.t02 and ta.t04=t.t04
  
  --漏钢记录数
  left join (select t.zd,nvl(t.bz,'小计') bz,count(*) a from (
   select to_char(to_date(t.date_time,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') dt,
   DECODE(CCM_NO, 'LG2H1','11', 'LG2H2', '12','LG2H3','13') zd,  group_cd bz, t.rowid 
   from tb2_llz65 t  ) t  where  t.zd is not null and t.bz is not null
    and  t.dt  between  replace(p_bt,'-','') and  replace(p_et,'-','')  
   group by t.zd ,cube(t.bz) )  tlg on tlg.zd=t.t02 and tlg.bz=t.t03
    
    
  -- 9370 
  left join ( select t.t02,t.t04 ,t.t16 t11,t.t37 t12, t.t34 t13,t.t35 t14, t.t36 t15,
    t.t22 t16 , t.t46 t17, t.t47 t19, t.t48 t23  
    from TB2_LKB591 t 
    where t.id=9370 and t.t01=1 and t.t02 in ('11','12','13') ) tb on tb.t02=t.t02 and tb.t04=t.t04
  
  --9375
  left join ( select t.t02,t.t04,t.t21 t18 from TB2_LKB591 t 
    where t.id=9375 and t.t01=1 ) tc on t.t02=tc.t02  and t.t04=tc.t04  
  
  -- 日常考核的P3,P9班组考核
  left join ( select t.khbbid,t.khzdid , sum(t.khje+t.khje2) t33 ,  
      sum(case when t.khflid=2396 then (t.khje+t.khje2) else 0 end ) t31,
      sum(case when t.khflid=2406 then (t.khje+t.khje2) else 0 end ) t32 from tb2_lkb596 t   
      where  t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','')
         and t.ifbzman=1 and t.ifseng=0 and t.ifdel=0 and t.khgz in ('P3','P9')
           group by t.khbbid,t.khzdid )    td on td.khbbid=t.t04 and td.khzdid=t.t02    
    
     )
       ;
       
       -- '接不上1,接的上0'
       
  --计算中包低液面情况 
  update TB2_LKB591 t set 
  t.t35= t.t35+ nvl(( select ta.t05 from TB2_LKB591 ta where ta.id=9970 and ta.fl=9972
   and ta.t01=0 and ta.t03=t.t02 and ta.t04=t.t04 ),0) ,
  t.t36= t.t36+ nvl(( select ta.t05 from TB2_LKB591 ta where ta.id=9970 and ta.fl=9972
   and ta.t01=1 and ta.t03=t.t02 and ta.t04=t.t04 ),0) 
  where t.id=110 and t.fl=110;
  
  
  
  --'中包低液面接的上' as t35 , '中包低液面接不上' as t36 
  --'站点' as t01 , '站点ID' as t02 , '班组' as t03 , '班组ID' as t04 ,
  
  
  ---  '断流' as t19  要加上　各机漏钢记录中的漏钢数
  
  
  --计算断流列　T19=T69+T68
  update TB2_LKB591 t set t.t19=t.t69+t.t68 where t.id=110 and t.fl=110;
  
  
  --恒拉速 
  update TB2_LKB591 t set t.t34= nvl(( select ta.t10 from tb2_lkb591 ta where ta.id=9987
   and ta.fl=9987  and ta.t02=t.t02 and ta.t04=t.t04 ),0)   where t.id=110 and t.fl=110;
  
  
  ---KH69 ---铸柸切废量 
  update TB2_LKB591 t set t.t39= 
  nvl(( 
     (select  sum(ta.KH69)   from TB2_LKB522  ta where   ta.ifdel=0 
    and  ta.khdt between replace(p_bt,'-','')  and  replace(p_et,'-','')  
    and ta.KHDMFL= 'LKB522' and ta.khzdid =10 and ta.khbzid = t.t04   )
   
   ),0)  
   
    where t.id=110 and t.fl=110;
  

  
  
  
  
  ---指标汇总  按班组汇总
  insert into TB2_LKB591 (  t13,t14,t15, t20 , t21 , t22 ,   t24 , t25 , t26 , t27  ,  
  t11, t12,  t16, t17, t19,  t23, 
  t18,
  t31,t32,t33,t34,t35,t36,t39,t100,t101,
  id,fl,t01,t02,t03,t04)
  ( select  sum(t13),sum(t14),sum(t15),sum(t20),sum(t21),sum(t22),sum(t24),sum(t25),sum(t26),sum(t27),
  sum(t11),sum(t12),sum(t16),sum(t17),sum(t19),sum(t23),
  sum(t18),
  sum(t31),sum(t32), sum(t33),sum(t34),sum(t35),sum(t36),sum(t39),sum(t100),sum(t101),
  110,115,'小计',15,t.t03,t.t04
  from  TB2_LKB591 t where t.id=110 and t.fl=110 and t.t04<5 group by t.t03,t.t04  )
  ;
  
  
  ---KH69 ---铸柸切废量 
  update TB2_LKB591 t set t.t39= 
  nvl(( 
     (select  sum(ta.KH69)   from TB2_LKB522  ta where   ta.ifdel=0 
    and  ta.khdt between replace(p_bt,'-','')  and  replace(p_et,'-','')  
    and ta.KHDMFL= 'LKB522' and ta.khzdid =10 and ta.khbzid = t.t04   )
   
   ),0)  
   
    where t.id=110 and t.fl=115;
  
  ------ 收得率%  开机对接成功率  新品优质率%  普钢中包龄   成本普钢 恒拉速

  update TB2_LKB591 ta set 
  -- 收得率%   
  ta.t16=nvl((select  t.t22 t16  from TB2_LKB591 t where t.id=9370 and t.t02='20' and t.t04=ta.t04),0) ,
  --   开机对接成功率 
  ta.t17=nvl((select  t.t46 t17  from TB2_LKB591 t where t.id=9370 and t.t02='20' and t.t04=ta.t04),0) ,
  --  新品优质率%  
  ta.t18=nvl((select  t.t21 t18  from TB2_LKB591 t where t.id=9375 and t.t02='11' and t.t04=ta.t04),0) ,
  
  --普钢中包龄  取 1  10  二炼钢连铸  的数据 
  ta.t22=nvl((  select  nvl(sum(t.kh16),0) t22 
    from tb2_lkb522 t  where t.ifdel=0 and  t.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')
   and t.khzdid=10  and t.KHDMFL= 'LKB522' and t.khbzid=ta.t04 ),0) ,
  
  --   成本普钢
  ta.t24=nvl((select  nvl(sum(t.kh17),0) t24 
    from tb2_lkb522 t  where t.ifdel=0 and  t.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')
   and t.khzdid=10  and t.KHDMFL= 'LKB522' and t.khbzid=ta.t04 ),0) ,  
   
   --恒拉速
  ta.t34=nvl(( select t.t10 from TB2_LKB591 t where t.id=9986 and t.fl=9986 and t.t04=ta.t04 ),0),
  
  ta.t04=ta.t04
  where ta.id=110 and ta.fl=115   ;
  
    
 
  
  
  
  
  --指标汇总与平均 车间汇总  
     
  insert into TB2_LKB591 (  t13,t14,t15, t20 , t21 , t22 ,   t24 , t25 , t26 , t27  ,  
  t11, t12,  t16, t17, t19,  t23, 
  t18,
  t31,t32,t33,t34,t35,t36,t39,t100,t101,
  id,fl, t01,t02,t03,t04    )  
  (select  sum(t13),sum(t14),sum(t15),sum(t20),sum(t21),sum(t22),sum(t24),sum(t25),sum(t26),sum(t27),
  sum(t11),sum(t12),sum(t16),sum(t17),sum(t19),sum(t23),
  sum(t18),
  sum(t31),sum(t32), sum(t33),sum(t34),sum(t35),sum(t36),sum(t39),sum(t100),sum(t101),
  110,120,'车间',20,'合计',5
  from  TB2_LKB591 t where t.id=110 and t.fl=110 and t.t04<5 )    ;
    
  
  update TB2_LKB591 ta set 
  ta.t16=(select  t.t22 t16  from TB2_LKB591 t where t.id=9370 and t.t02='20' and t.t04='5') ,
  ta.t17=(select  t.t46 t17  from TB2_LKB591 t where t.id=9370 and t.t02='20' and t.t04='5') ,
  ta.t18=(select  t.t21 t18  from TB2_LKB591 t where t.id=9375 and t.t02='11' and t.t04='5') ,
   
   --恒拉速
  ta.t34=nvl(( select t.t10 from TB2_LKB591 t where t.id=9985 and t.fl=9985 and t.t04='5' ),0),
  
  ta.t04=ta.t04

  where ta.id=110 and ta.fl=120   ;
  
  

  
  
  /*
  insert into TB2_LKB591 (  t13,t14,t15, t20 , t21 , t22 ,   t24 , t25 , t26 , t27  ,  
  t11, t12,  t16, t17, t19,  t23, 
  t18,
  id,fl, t01,t02,t03,t04    )  
  (select round(t13/12,10),round(t14/12,10),round(t15/12,10),round(t20/12,10),round(t21/12,10),
  round(t22/12,10),  round(t24/12,10),round(t25/12,10),round(t26/12,10),round(t27/12,10),
  round(t11/12,10),round(t12/12,10),  round(t16/12,10),round(t17/12,10),round(t19/12,10),round(t23/12,10),
  round(t18/12,10) ,
  110,130,'车间',20,'平均',6
  from  TB2_LKB591 t where t.id=110 and t.fl=120  )    ;
  */
	
  insert into TB2_LKB591 (  t13,t14,t15, t20 , t21 , t22 ,   t24 , t25 , t26 , t27  ,  
  t11, t12,  t16, t17, t19,  t23, 
  t18, 
  id,fl, t01,t02,t03,t04    )  
  (select round(t13/4,10),round(t14/4,10),round(t15/4,10),round(t20/4,10),round(t21/4,10),
  round(t22/4,10),  round(t24/4,10),round(t25/4,10),round(t26/4,10),round(t27/4,10),
  round(t11/4,10),round(t12/4,10),  round(t16/4,10),round(t17/4,10),round(t19/4,10),round(t23/4,10),
  round(t18/4,10) , 
  110,130,'车间',20,'平均',6
  from  TB2_LKB591 t where t.id=110 and t.fl=120  )    ;
	
  update TB2_LKB591 ta set 
  ta.t16=(select  t.t16  from TB2_LKB591 t where t.id=110 and t.fl=120) ,
  ta.t17=(select  t.t17  from TB2_LKB591 t where t.id=110 and t.fl=120) ,
  ta.t18=(select  t.t18  from TB2_LKB591 t where t.id=110 and t.fl=120) ,
	 --恒拉速
	ta.t34=nvl(( select t.t10 from TB2_LKB591 t where t.id=9986 and t.fl=9985 and t.t04='5' ),0),
	ta.t04=ta.t04
  where ta.id=110 and ta.fl=130   ;
  
  
  
  
  
  
  
  
  --求分
  insert into TB2_LKB591 ( id,fl,  t01  )   ( select  120,100, '分数'   from dual  );
  insert into TB2_LKB591 ( id,fl,  t01 ,t02,t03,t04,
  t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23 ,
	t28, t29 ,t30,t31,t32 ,t34 ,t35 ,t39 ,t41,t100,t101) 
  (select  120,105, '站点','站点ID','班组','班组ID' , 
  '产量','废品','轧钢退废','收得率','开机对接成功率','新品优质率',
	'断流','工艺违规','不配合试验工作','普钢中包龄',
  '非计划停机/次','普钢成本','安全',
	'班组考核分' as t28,'个人考核分','班组总分' as t30,'无考核总分' as t31,
	'个人总分' as t32 ,'恒拉速' as t34 ,'低液面' as t35 ,'铸柸切废量' as t39 ,'台上难度系数' as t41, '指令完成情况'  as t100, '流程落地稽查'  as t101
      from dual  );
  
  
  -- 120,110, 分班分机 得分
	
  insert into TB2_LKB591 (id,fl,  t01 ,t02,t03,t04,  
  t11  , t12 , t13 ,  t17 , t18 , t19 , t21 , t22 , t23 , 
  t14,t15,t16,t20, T34,T35, T39 ,
	t41, --台上难度系数
  t05,t06,t07,t100,t101
	) 
  
  (select  120,110, t.t01,t.t02,t.t03,t.t04  ,
  --t11  , t12 , t13 ,  t17 , t18 , t19 , t21 , t22 , t23 ,
	
  --产量  公式  A1103+(N-(AVG(N)-X)*A1104
  /* A1103.A +(t.t11-a11avg.a)*A1104.A */
	trunc(( CASE WHEN T.T02=11 THEN A1103.A +(t.t11-a11avg.a/3-A1111.A)*A1104.A 
		     WHEN T.T02=12 THEN A1103.A +(t.t11-a11avg.a/3-A1112.A)*A1104.A 
         WHEN T.T02=13 THEN A1103.A +(t.t11-a11avg.a/3-A1113.A)*A1104.A  END ),5) t11   ,
	
  
  --废品  公式  IF N=A1203,A1204,A1205+N*A1206
  ( CASE WHEN  t.T12=A1203.A THEN A1204.A ELSE A1205.A+t.T12*A1206.A END ) t12  ,
  
  --开花头  公式  IF(N1+N2+N3=A1303,A1304,A1305+N1*A1306+N2*A1307+N3*A1308)  
  ( CASE WHEN t.T13+t.T14+t.T15=A1303.A THEN A1304.A ELSE A1305.A+t.T13*A1306.A+t.T14*A1307.A+t.T15*A1308.A END ) t13 ,
   
  --断流次数  公式  A1603+N*A1604
   ( A1603.a+t.t19*A1604.a )  t17 ,
   
   --工艺违规  公式  N*A2203
   (t.t20*A2203.A) T18 ,
   
   --不配合试验  公式  N*A2303
   (t.t21*A2303.A) T19 ,
   
   --非计划停机  公式  A2103+N*A2104
   (A2103.A+t.T23*A2104.A) T21 ,
   
   --成本  公式  A1903+(A1905-N)*A1904
   (A1903.A+(A1905.A-t.T24)*A1904.A) T22 ,
   
   --安全  公式  IF(N1+N2+N3=A2003,A2004,N1*A2004+N2*A2005+N3*A2006)
  ( CASE WHEN t.T25+t.T26+t.T27=A2003.A THEN A2004.A ELSE t.T25*A2004.A+t.T26*A2005.A+t.T27*A2006.A END ) t23  , 
  
  t16,t17,t18,t22,
	
	--恒拉速 =C1102+(N-(C1111,C1112,C1113))*C1104
  ( case when 	( CASE WHEN T.T02=11 THEN C1102.A +(t.t34-C1111.A)*A1104.A 
		     WHEN T.T02=12 THEN C1102.A +(t.t34-C1112.A)*A1104.A 
         WHEN T.T02=13 THEN C1102.A +(t.t34-C1113.A)*A1104.A  END ) > c1106.a then c1106.a
		  when 	(     CASE WHEN T.T02=11 THEN C1102.A +(t.t34-C1111.A)*A1104.A 
		     WHEN T.T02=12 THEN C1102.A +(t.t34-C1112.A)*A1104.A 
         WHEN T.T02=13 THEN C1102.A +(t.t34-C1113.A)*A1104.A  END ) < c1107.a then c1107.a
	  else ( CASE WHEN T.T02=11 THEN C1102.A +(t.t34-C1111.A)*A1104.A 
		     WHEN T.T02=12 THEN C1102.A +(t.t34-C1112.A)*A1104.A 
         WHEN T.T02=13 THEN C1102.A +(t.t34-C1113.A)*A1104.A  END ) end )  t34   ,
	
	--中包低液面 （基础分15分，接得上一次扣2分，接不上一次扣0.5分）	0	C1200
	--=C1202+(N1*C1203)+(N2*C1204)	 最大值		15	C1205 最小值		0	C1206
	(CASE WHEN (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) > C12.C1205 THEN C12.C1205
	      WHEN (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) < C12.C1206 THEN C12.C1206
        ELSE (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) END )   ,
  
  ---  铸柸切废量	公式	C1302-((N-C1305)*C1304/C1303) 
  (C1302.A -((t.t39-C1305.A)*C1304.A/C1303.A)  ) , 
  
  
	--台上难度系数
	( case --台上难度系数
	when t.t02=11 and t.t04=1 then B0111.A*1 when t.t02=11 and t.t04=2 then B0112.A*1 
	when t.t02=11 and t.t04=3 then B0113.A*1 when t.t02=11 and t.t04=4 then B0114.A*1 
	when t.t02=12 and t.t04=1 then B0121.A*1 when t.t02=12 and t.t04=2 then B0122.A*1 
	when t.t02=12 and t.t04=3 then B0123.A*1 when t.t02=12 and t.t04=4 then B0124.A*1 
	when t.t02=13 and t.t04=1 then B0131.A*1 when t.t02=13 and t.t04=2 then B0132.A*1 
	when t.t02=13 and t.t04=3 then B0133.A*1 when t.t02=13 and t.t04=4 then B0134.A*1 
	else 1 end ) as t41,
	
  t05,t06,t07,
     --指令完成情况
   (D0002.A+t.t100*D0003.A) T100 ,
  t.t101*L0007.A T101
   
  from 
  (select   id,fl, t01,t02,t03,t04  ,t05,t06,t07,
  t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27,T34 ,t35 ,t36 ,t39,t100,t101
  from TB2_LKB591 ta where ta.id=110 and  ta.fl=110 and to_number(ta.t04)<5 ) t,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1103') A1103,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1104') A1104,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1111') A1111,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1112') A1112,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1113') A1113,
  (select to_number(tb.t11) a from TB2_LKB591 tb where  tb.fl=130 and tb.id=110 ) a11avg ,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1203') A1203,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1204') A1204,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1205') A1205,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1206') A1206,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1303') A1303,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1304') A1304,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1305') A1305,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1306') A1306,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1307') A1307,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1308') A1308,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1603') A1603,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1604') A1604,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2203') A2203,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2303') A2303,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2103') A2103,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2104') A2104,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1903') A1903,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1904') A1904,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1905') A1905,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2003') A2003,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2004') A2004,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2005') A2005,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2006') A2006,
 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0111') B0111 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0112') B0112 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0113') B0113 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0114') B0114 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0121') B0121 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0122') B0122 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0123') B0123 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0124') B0124 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0131') B0131 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0132') B0132 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0133') B0133 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0134') B0134 ,
 
 
 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1102') C1102, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1104') C1104,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1106') C1106, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1107') C1107,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1111') C1111,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1112') C1112,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1113') C1113,
  
  
  ---  铸柸切废量	公式	C1302-((N-C1305)/C1303)*C1304 
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1302') C1302, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1303') C1303,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1304') C1304, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1305') C1305,
  
  
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='D0002') D0002,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='D0003') D0003,
   (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='L0007') L0007,
-- =C1102+(N-(C1111,C1112,C1113))*C1104
  
  ( select  t02*1 C1202,t03*1 C1203,t04*1 C1204,t05*1 C1205,t06*1 C1206 
	  from TB2_LKB591 t where t.id=9970 and t.fl=9975 ) C12,

  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1103') A9999 
    ) 
    ;
  
	
	
	
  -- 120,110, 分班分机 得分
  update TB2_LKB591 t set 
	
	
	--班组考核分  ， 个人考核分
	t.t28=nvl((   select  nvl(sum(ta.khje),0) khje  from TB2_LKB594 ta 
     where ta.ifdel=0 and ta.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')   
		 and (ta.khzdid = t.t02 )	 and (ta.khbbid= t.t04) and (ta.khgz= 'P3' )  
		 and ta.ifbz='班组考核' and ta.ifbzid=22 		  ),0) ,
		 
	t.t29=nvl((   select  nvl(sum(ta.khje),0) khje  from TB2_LKB594 ta 
     where ta.ifdel=0 and ta.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')   
		 and (ta.khzdid = t.t02 )	 and (ta.khbbid= t.t04) and (ta.khgz= 'P3' )  
		 and ta.ifbz='个人考核' and ta.ifbzid=11 and t.t05=ta.man		  ),0) ,
		 
	
  /*
  新品优质率  说明  ±1%奖扣2分，最高扣3分。
  新品优质率  公式  MAX[ IF N=A1703,A1704, (N-X)*A1705] >= A1706
  */
  T.T16=(SELECT  TA.T18 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  
  t.t71=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1703') ,
  t.t72=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1704') ,
  t.t73=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1705') ,
  t.t74=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1706') ,
  t.t75=( case when t.t02=11 then (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1711') else 0 end ) ,
  
  /*
  普钢中包龄  说明  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉
  普钢中包龄  公式  IF N=A1503,A1504,A1505+(N-X)*A1506
  
  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉    A1501

  
  
   */
  T.T20=(SELECT  TA.T22 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) ,
  T.T87=(SELECT  TA.T22 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  
  t.t83=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1503') ,
  t.t84=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1504') ,
  t.t85=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1505') ,
  t.t86=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1506') ,
  t.t81=( case 
          when t.t02=11 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1511') 
          when t.t02=12 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1512') 
          when t.t02=13 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1513') 
          else 0 end ) ,

  
  /*
  钢水收得率  说明  达标奖20分，每±0.1%奖扣2分，最高奖扣15分。1#机99.6 %、2#机99.8%、3#机99.8%，
  钢水收得率  公式  [ IF N=A1403,A1404,A1407+(ABS((N-X)*A1405)<=A1406)]
  */
  
  T.T14=(SELECT  TA.T16 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  t.t51=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1403') ,
  t.t52=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1404') ,
  t.t53=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1405') ,
  t.t54=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1406') ,
  t.t55=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1407'),  
  t.t56=( case 
          when t.t02=11 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1411') 
          when t.t02=12 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1412') 
          when t.t02=13 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1413') 
          else 0 end ) ,

  /*
  开机对接成功率  说明  基奖10分，以成功率98%计算，每升降1%奖扣0.5分。 暂时没有分3台机
  开机对接成功率  公式  A1803+(N-A1805)*A1804
  */
  
  T.T15=(SELECT  TA.T17 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  t.t61=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1803') ,
  t.t62=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1804') ,
  t.t63=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1805')
  where t.id=120 and t.fl=110
  ;
  
  --120,110
  update TB2_LKB591 t set 
  /*
  新品优质率  说明  ±1%奖扣2分，最高扣3分。
  新品优质率  公式  MAX[ IF N=A1703,A1704, (N-X)*A1705] >= A1706
  */
  t.t16=  (case when  1*t.t16=1*t.t71 then 1*t.t72 when (1*t.t16-1*t.t75)*1*t.t73<1*t.t74 then 1*t.t74
   else (1*t.t16-1*t.t75)*1*t.t73 end ) ,  
  
  /*
  普钢中包龄  说明  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉
  普钢中包龄  公式  IF N=A1503,A1504,A1505+(N-X)*A1506   
  
  */
  t.t20= (case when  1*t.T87=1*t.t83 then 1*t.t84 
         else 1*t.t85 + (1*t.T87-1*t.t81)*1*t.t86 end ) , 
  
   
          

  /*
  钢水收得率  说明  达标奖20分，每±0.1%奖扣2分，最高奖扣15分。1#机99.6 %、2#机99.8%、3#机99.8%，
  钢水收得率  公式  [ IF N=A1403,A1404,A1407+(ABS((N-X)*A1405)<=A1406)]
  */
  t.t14= (case when  1*t.t14=1*t.t51 then 1*t.t52 
  when abs((1*t.t14-1*t.t56)*1*t.t53) > 1*t.t54 then  1*t.t55 + 1*t.t54 
  --when 1*t.t55+(1*t.t14-1*t.t56)*1*t.t53>1*t.t54 then 1*t.t54
  else 1*t.t55+(1*t.t14-1*t.t56)*1*t.t53 end ) , 


  /*
  开机对接成功率  说明  基奖10分，以成功率98%计算，每升降1%奖扣0.5分。 暂时没有分3台机
  开机对接成功率  公式  A1803+(N-A1805)*A1804
  */
  t.t15= 1*t.t61+(1*t.t15-1*t.t63)*1*t.t62 
  where t.id=120 and t.fl=110
  ;
  
	
	
  
  -- 分数合计各班各机 
  update TB2_LKB591 t set 
	--无考核分总分
	t.t31=(t.t11+t.t12+t.t13+t.t14+t.t15+t.t16+t.t17+t.t18+t.t19+t.t20+t.t21+t.t22+t.t23+t.t34+t.t35+t.t39+t.t100+t.t101)	
  where t.id=120 and t.fl=110;
	
  update TB2_LKB591 t set 
	-- （总分+班组考核）*班组系数
	t.t30=(t.t31+t.t28 )*t.t41
  where t.id=120 and t.fl=110;
	
  -- 设置 各机各班 台上难度系数  --t02 zdid ,t04 bzid 
	
	
	
	-------------------------------------------------------------------------------
	----分班组不分机座 计分   120,115,
	
	
  insert into TB2_LKB591 (id,fl,  t01 ,t02,t03,t04,  
  t11  , t12 , t13 ,  t17 , t18 , t19 , t21 , t22 , t23 , 
  t14,t15,t16,t20, T34,T35,T39,
	t41, --台上难度系数
  t05,t06,t07,t100,t101
	) 
  
  (select  120,115, '小计',15,t.t03,t.t04  ,
  --t11  , t12 , t13 ,  t17 , t18 , t19 , t21 , t22 , t23 ,
	
  --产量  公式  A1103+(N-(AVG(N)-X)*A1104
  /* A1103.A +(t.t11-a11avg.a)*A1104.A */
	trunc((  A1103.A +(t.t11-a11avg.a- nvl(A1120.A,0) )*A1104.A   ),5) t11   ,
	
  
  --废品  公式  IF N=A1203,A1204,A1205+N*A1206
  ( CASE WHEN  t.T12=A1203.A THEN A1204.A ELSE A1205.A+t.T12*A1206.A END ) t12  ,
  
  --开花头  公式  IF(N1+N2+N3=A1303,A1304,A1305+N1*A1306+N2*A1307+N3*A1308)  
  ( CASE WHEN t.T13+t.T14+t.T15=A1303.A THEN A1304.A ELSE A1305.A+t.T13*A1306.A+t.T14*A1307.A+t.T15*A1308.A END ) t13 ,
   
  --断流次数  公式  A1603+N*A1604
   ( A1603.a+t.t19*A1604.a )  t17 ,
   
   --工艺违规  公式  N*A2203
   (t.t20*A2203.A) T18 ,
   
   --不配合试验  公式  N*A2303
   (t.t21*A2303.A) T19 ,
   
   --非计划停机  公式  A2103+N*A2104
   (A2103.A+t.T23*A2104.A) T21 ,
   
   --成本  公式  A1903+(A1905-N)*A1904
   (A1903.A+(A1905.A-t.T24)*A1904.A) T22 ,
   
   --安全  公式  IF(N1+N2+N3=A2003,A2004,N1*A2004+N2*A2005+N3*A2006)
  ( CASE WHEN t.T25+t.T26+t.T27=A2003.A THEN A2004.A ELSE t.T25*A2004.A+t.T26*A2005.A+t.T27*A2006.A END ) t23  , 
  
  t16,t17,t18,t22,
	
	--恒拉速 =C1102+(N-(C1120 ))*C1104
  ( case when 	(   C1102.A +(t.t34-C1120.A)*A1104.A   ) > c1106.a then c1106.a
		  when 	(   C1102.A +(t.t34-C1120.A)*A1104.A   ) < c1107.a then c1107.a
	  else (   C1102.A +(t.t34-C1120.A)*A1104.A   ) end )  t34   ,
	
	--中包低液面 （基础分15分，接得上一次扣2分，接不上一次扣0.5分）	0	C1200
	--=C1202+(N1*C1203)+(N2*C1204)	 最大值		15	C1205 最小值		0	C1206
	(CASE WHEN (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) > C12.C1205 THEN C12.C1205
	      WHEN (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) < C12.C1206 THEN C12.C1206
        ELSE (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) END )   ,
        
        
  ---  铸柸切废量	公式	C1302-((N-C1305)/C1303)*C1304 
  (C1302.A -((t.t39-C1305.A)/C1303.A)*C1304.A  ) , 
  
  
	--台上难度系数
	( case --台上难度系数
	when  t.t04=1 then nvl(B0201.A,1)*1 when  t.t04=2 then nvl(B0202.A,1)*1 
	when  t.t04=3 then nvl(B0203.A,1)*1 when  t.t04=4 then nvl(B0204.A,1)*1  
	else 1 end ) as t41,
	
	
	
  t05,t06,t07,
       --指令完成情况
   (D0002.A+t.t100*D0003.A) T100 ,
  t.t101*L0007.A T101 
  from 
  (select   id,fl, t01,t02,t03,t04  ,t05,t06,t07,
  t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27,T34 ,t35 ,t36,t39,t100,t101
  from TB2_LKB591 ta where ta.id=110 and  ta.fl=115 and to_number(ta.t04)<5 ) t,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1103') A1103,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1104') A1104,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1111') A1111,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1112') A1112,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1113') A1113,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1120') A1120,
  (select to_number(tb.t11) a from TB2_LKB591 tb where  tb.fl=130 and tb.id=110 ) a11avg ,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1203') A1203,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1204') A1204,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1205') A1205,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1206') A1206,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1303') A1303,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1304') A1304,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1305') A1305,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1306') A1306,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1307') A1307,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1308') A1308,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1603') A1603,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1604') A1604,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2203') A2203,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2303') A2303,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2103') A2103,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2104') A2104,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1903') A1903,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1904') A1904,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1905') A1905,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2003') A2003,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2004') A2004,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2005') A2005,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2006') A2006,
 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0201') B0201 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0202') B0202 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0203') B0203 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0204') B0204 ,  
 
 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1120') C1120, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1102') C1102, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1104') C1104,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1106') C1106, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1107') C1107,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1111') C1111,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1112') C1112,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1113') C1113,
    (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='D0002') D0002,
      (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='D0003') D0003,
        (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='L0007') L0007,
-- =C1102+(N-(C1111,C1112,C1113))*C1104



  ---  铸柸切废量	公式	C1302-((N-C1305)/C1303)*C1304 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1302') C1302, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1303') C1303,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1304') C1304, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1305') C1305,
  
  
  
  
  ( select  t02*1 C1202,t03*1 C1203,t04*1 C1204,t05*1 C1205,t06*1 C1206 
	  from TB2_LKB591 t where t.id=9970 and t.fl=9975 ) C12,

  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1103') A9999 
    ) 
    ;
  
	
	
	
  --120,115
  update TB2_LKB591 t set 
	
	
	--班组考核分  
	t.t28=nvl((  select sum(ta.t28) from TB2_LKB591 ta where ta.id=120 and ta.fl=110 and ta.t04=t.t04  ),0) ,
		  
		 
	
  /*
  新品优质率  说明  ±1%奖扣2分，最高扣3分。
  新品优质率  公式  MAX[ IF N=A1703,A1704, (N-X)*A1705] >= A1706
  */
  T.T16=(SELECT  TA.T18 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  
  t.t71=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1703') ,
  t.t72=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1704') ,
  t.t73=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1705') ,
  t.t74=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1706') ,
  t.t75=(   (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1711')   ) ,
  
  /*
  普钢中包龄  说明  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉
  普钢中包龄  公式  IF N=A1503,A1504,A1505+(N-X)*A1506
  
  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉    A1501

  
  
   */
  T.T20=(SELECT  TA.T22 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) ,
  T.T87=(SELECT  TA.T22 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  
  t.t83=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1503') ,
  t.t84=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1504') ,
  t.t85=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1505') ,
  t.t86=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1506') ,
  t.t81=nvl( (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1520') ,0 ) ,

  
  /*
  钢水收得率  说明  达标奖20分，每±0.1%奖扣2分，最高奖扣15分。1#机99.6 %、2#机99.8%、3#机99.8%，
  钢水收得率  公式  [ IF N=A1403,A1404,A1407+(ABS((N-X)*A1405)<=A1406)]
  */
  
  T.T14=(SELECT  TA.T16 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  t.t51=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1403') ,
  t.t52=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1404') ,
  t.t53=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1405') ,
  t.t54=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1406') ,
  t.t55=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1407'),  
  t.t56=nvl((select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1420'),0) ,

  /*
  开机对接成功率  说明  基奖10分，以成功率98%计算，每升降1%奖扣0.5分。 暂时没有分3台机
  开机对接成功率  公式  A1803+(N-A1805)*A1804
  */
  
  T.T15=(SELECT  TA.T17 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  t.t61=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1803') ,
  t.t62=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1804') ,
  t.t63=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1805')
  where t.id=120 and t.fl=115
  ;
  
  
  update TB2_LKB591 t set 
  /*
  新品优质率  说明  ±1%奖扣2分，最高扣3分。
  新品优质率  公式  MAX[ IF N=A1703,A1704, (N-X)*A1705] >= A1706
  */
  t.t16=  (case when  1*t.t16=1*t.t71 then 1*t.t72 when (1*t.t16-1*t.t75)*1*t.t73<1*t.t74 then 1*t.t74
   else (1*t.t16-1*t.t75)*1*t.t73 end ) ,  
  
  /*
  普钢中包龄  说明  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉
  普钢中包龄  公式  IF N=A1503,A1504,A1505+(N-X)*A1506   
  
  */
  t.t20= (case when  1*t.T87=1*t.t83 then 1*t.t84 
         else 1*t.t85 + (1*t.T87-1*t.t81)*1*t.t86 end ) , 
  
   
          

  /*
  钢水收得率  说明  达标奖20分，每±0.1%奖扣2分，最高奖扣15分。1#机99.6 %、2#机99.8%、3#机99.8%，
  钢水收得率  公式  [ IF N=A1403,A1404,A1407+(ABS((N-X)*A1405)<=A1406)]
  */
  t.t14= (case when  1*t.t14=1*t.t51 then 1*t.t52 
  when abs((1*t.t14-1*t.t56)*1*t.t53) > 1*t.t54 then  1*t.t55 + 1*t.t54 
  --when 1*t.t55+(1*t.t14-1*t.t56)*1*t.t53>1*t.t54 then 1*t.t54
  else 1*t.t55+(1*t.t14-1*t.t56)*1*t.t53 end ) , 


  /*
  开机对接成功率  说明  基奖10分，以成功率98%计算，每升降1%奖扣0.5分。 暂时没有分3台机
  开机对接成功率  公式  A1803+(N-A1805)*A1804
  */
  t.t15= 1*t.t61+(1*t.t15-1*t.t63)*1*t.t62 
  where t.id=120 and t.fl=115
  ;
  
	
	
  -- 分数合计各班各机 
  update TB2_LKB591 t set 
	--无考核分总分
	t.t31=(t.t11+t.t12+t.t13+t.t14+t.t15+t.t16+t.t17+t.t18+t.t19+t.t20+t.t21+t.t22+t.t23+t.t34+t.t35+t.t39+t100+t101)	
  where t.id=120 and t.fl=115;
	
  update TB2_LKB591 t set 
	-- （总分+班组考核）*班组系数
	t.t30=(t.t31+t.t28 )*t.t41
  where t.id=120 and t.fl=115;
	
  -- 设置 各机各班 台上难度系数  --t02 zdid ,t04 bzid 
	
	
	
	-------------------------------------------------------------------------------
	
  --分机座小计 
  insert into TB2_LKB591
  (id,fl,  t01 ,t02,t03,t04,  
   t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23,
  t30,t31,t32,t34,t35,t39,t100,t101) 
  ( select  120,120,t.t01,t.t02,'小计',5,
   sum(t.t11) , sum(t.t12) , sum(t.t13) , sum(t.t14) , sum(t.t15) , sum(t.t16) , 
   sum(t.t17) , sum(t.t18) , sum(t.t19) , sum(t.t20) , sum(t.t21) , sum(t.t22) , sum(t.t23), 
      sum(t.t30)  ,  sum(t.t31)  ,  sum(t.t32) ,  sum(t.t34)  ,  sum(t.t35)  ,  sum(t.t39)  ,sum(t.t100)  ,sum(t.t101)
  from TB2_LKB591 t where id=120 and fl=110 group by t.t01,t.t02 )
  ;
	
-------------------------------------------------------------------------------------------------	
	
	
  --车间合计  
  insert into TB2_LKB591
  (id,fl,  t01 ,t02,t03,t04,  
   t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, 
   t30,t31,t32,t34,t35,t39,t100,t101) 
  ( select  120,130,'车间',20,'合计',5,
   sum(t.t11) , sum(t.t12) , sum(t.t13) , sum(t.t14) , sum(t.t15) , sum(t.t16) , 
   sum(t.t17) , sum(t.t18) , sum(t.t19) , sum(t.t20) , sum(t.t21) , sum(t.t22) , sum(t.t23), 
   sum(t.t30)   ,  sum(t.t31)  ,  sum(t.t32)  ,  sum(t.t34)   ,  sum(t.t35)  ,  sum(t.t39)   ,  sum(t.t100)  ,  sum(t.t101) 
   from TB2_LKB591 t where id=120 and fl=115  );
  
  
  
  
  
  begin
  V_COUNT:=0;
  --- del by xyz 
  /*
  begin
  --- mod by wjp
  delete TB2_LKB522_TEMP ; 
   INSERT INTO TB2_LKB522_TEMP  
   (GROUP_CD,type,ZPQFL,DF) (select nvl(t.khbz,'合计'),'小计',sum(t.KH69),''  from TB2_LKB522  t where   t.ifdel=0 and  t.khdt between replace(p_bt,'-','') 
   and  replace(p_et,'-','')
   and t.KHDMFL= 'LKB522'  group by cube (t.khbz) );
   
     SELECT COUNT(1) INTO V_COUNT FROM TB2_LKB522_TEMP  ;
     if  V_COUNT  = 0 then 
     INSERT INTO TB2_LKB522_TEMP  
   (GROUP_CD,type,ZPQFL,DF) (select '甲','','','' from dual );
    INSERT INTO TB2_LKB522_TEMP  
   (GROUP_CD,type,ZPQFL,DF) (select '乙','','','' from dual );
    INSERT INTO TB2_LKB522_TEMP  
   (GROUP_CD,type,ZPQFL,DF) (select '丙','','','' from dual );
    INSERT INTO TB2_LKB522_TEMP  
   (GROUP_CD,type,ZPQFL,DF) (select '丁','','','' from dual ) ;
   INSERT INTO TB2_LKB522_TEMP  
   (GROUP_CD,type,ZPQFL,DF) (select '合计','','','' from dual );
   end if;
  
   update TB2_LKB522_TEMP t  set t.type='车间'   where t.GROUP_CD='合计';
   
select  t.khje  into V_ZPQFL1 from tb2_lkb598 t where t.id = '357'  and substr(t.modtime,1,6)>='201411'; -- 2
select  t.khje  into V_ZPQFL2 from tb2_lkb598 t where t.id = '364'  and substr(t.modtime,1,6)>='201411'; --20
select  t.khje  into V_ZPQFL3 from tb2_lkb598 t where t.id = '371'  and substr(t.modtime,1,6)>='201411'; --4.3
select  t.khje  into V_ZPQFL4 from tb2_lkb598 t where t.id = '378'  and substr(t.modtime,1,6)>='201411'; -- 0.1
   
   update TB2_LKB522_TEMP t  set t.DF=   V_ZPQFL2 + (V_ZPQFL3 - ZPQFL)*V_ZPQFL1/V_ZPQFL4   where  t.GROUP_CD  !='合计';
   
 select max(t.ZDF) into  V_ZDF from (select sum(DF) as ZDF,type  from TB2_LKB522_TEMP   group by type) t  where t.type =  
       '小计';
    
    update TB2_LKB522_TEMP t  set t.DF=  V_ZDF where  t.GROUP_CD='总计';
  
  end;
  */
  end;
  
	
	
  
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_01_04;


  -- 公共部分 值班主任和班长 共同部分  分机座分班组  12个班的算法
  PROCEDURE tb00_list_01_12(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         --p_zd IN varchar2, --zd
                         --p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    a_CUR   V_CUR ; 
		v_bt  varchar2(30);
		v_et  varchar2(30);
    
  BEGIN
  
  v_stra:='                                                  @';
  v_fldm:='LKB521'; 
  v_dt:=substr(replace(p_et,'-',''),1,6);
  v_bt:=(replace(p_bt,'-',''));
  v_et:=(replace(p_et,'-',''));
   
     
  delete TB2_LKB591 ;
  
  --先取出自动指标 从 LBB370 LBB375 中取出 
  PG2_LBB370.REPROT1(replace(p_et,'-',''),a_cur);       
  insert into TB2_LKB591
  (id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50 )
  (select  9370, 9370, id, t02, t03, t04, t05, t06, t07, t08, t09, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50  from tb2_lkb590);  
  
  
  PG2_LBB375.REPROT1(replace(p_et,'-',''),a_cur);   
  insert into TB2_LKB591
  (id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25  )
  (select  9375, 9375,  id, t02, t03, t04, t05, t06, t07, t08, t09, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25   from tb2_lkb590);
  
  --将370 表中 机座填上ID
  update TB2_LKB591 t set   t.t04=nvl(t.t12,5),t.t02=( case when t.t14='1#方坯连铸' then 11 
    when t.t14='2#方坯连铸' then 12    when t.t14='3#方坯连铸' then 13 else 20 end )
  where t.id=9370 and t.t01=1 ;
  update TB2_LKB591 t set   t.t04='BZID',t.t02='ZDID'
  where t.id=9370 and t.t01=0 ;
  
  --将375 表中 机座填上ID
  update TB2_LKB591 t set   t.t04=t.t11,t.t02=11   where t.id=9375  ;
   
	
  insert into  TB2_LKB591 (id,fl,t01,t02,t03,t04,t10)  
	(select 9988,9988,'站点' as t01,'zd' as t02 ,'班组' as t03,'bz' as t04,
	'恒拉速指标' as t10 from dual ) 	;
	
	insert into  TB2_LKB591 ( id,fl,t01,t02,t03,t04,t10)   
	(  SELECT 9987,9987,  CCM_NO, zd,
              GROUP_CD, bz,
       ROUND((SUM(PRO_TIME)*7-SUM(UN_TIME)+SUM(MZ_TIME))/DECODE(SUM(PRO_TIME)*7,0,1,SUM(PRO_TIME)*7)*100,2)  FROM (
          SELECT S.CCM_NO,s.zd,s.bz, 
          S.GROUP_CD, 
          ROUND(S.PRO_TIME/60) AS PRO_TIME,
          ROUND((LS1_UN_TIME+LS2_UN_TIME+LS3_UN_TIME+LS4_UN_TIME+LS5_UN_TIME+LS6_UN_TIME+LS7_UN_TIME)/60) AS UN_TIME,
          NVL(S.S1+S.S2+S.S3+S.S4+S.S5+S.S6+S.S7,0) AS MZ_TIME,
 
					
          ROUND(S.LS1_UN_TIME/60) AS LS1_UN_TIME, 
          ''
  
    FROM   (SELECT SGLGZB.GF_COMMNAMEFIND('Q0177', CCM_NO, '2') AS CCM_NO, CCM_NO zd , 
           GROUP_CD bz, SGLGZB.GF_COMMNAMEFIND('G0004',GROUP_CD, '2') AS GROUP_CD,  
            NVL(PRO_TIME,0) AS PRO_TIME,
            NVL(LS1_UN_TIME,0) AS LS1_UN_TIME,
						
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='1' OR LS='1-7') AND DELETE_BZ = 0) S1,--1流免责时间累积
            NVL(LS2_UN_TIME,0) AS LS2_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='2' OR LS='1-7') AND DELETE_BZ = 0) S2,--2流免责时间累积
            NVL(LS3_UN_TIME,0) AS LS3_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='3' OR LS='1-7') AND DELETE_BZ = 0) S3,--3流免责时间累积
            NVL(LS4_UN_TIME,0) AS LS4_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='4' OR LS='1-7') AND DELETE_BZ = 0) S4,--4流免责时间累积
            NVL(LS5_UN_TIME,0) AS LS5_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='5' OR LS='1-7') AND DELETE_BZ = 0) S5,--5流免责时间累积
            NVL(LS6_UN_TIME,0) AS LS6_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='6' OR LS='1-7') AND DELETE_BZ = 0) S6,--6流免责时间累积
            NVL(LS7_UN_TIME,0) AS LS7_UN_TIME,
            (SELECT NVL(SUM(MZ_TIME),0) FROM TB2_LLS50 S1 WHERE S1.OCCR_DATE = T.OCCR_DATE AND CCM_NO = T.CCM_NO AND S1.SHIFT_CD = T.SHIFT_CD AND (LS='7' OR LS='1-7') AND DELETE_BZ = 0) S7--7流免责时间累积
						 
       FROM TB2_LLS40 T
       WHERE (T.OCCR_DATE BETWEEN v_bt AND v_et)   ) S 
			 ) b
          GROUP BY CCM_NO,GROUP_CD,zd,bz
			 );
	
	update TB2_LKB591 t set 
	t.t02=decode(t.t01,  	'1#方坯连铸',11,   	'2#方坯连铸',12,   	'3#方坯连铸',13 ) 
	where t.id=9987 and t.fl=9987;
	
  --插入 中包低液面计算情况
	
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04,t05,t06)   
  (select 9970,9970,'中包低液面情况','bt'||v_bt,'et'||v_et,'zd' ,
   'bz' , to_char(sysdate,'hh24:mi:ss') a from dual);
	
  insert into TB2_LKB591 (id,fl,t01  )  (select 9970,9970,'中包低液面计算情况' from dual);
	
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04,t05)   
  (select 9970,9971,'接不上1,接的上0','机座','机座ID' ,'班组' , '计算值' from dual);
	
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04,t05)   
  ( (select 9970,9972,ifup,ccm_no,substr(ccm_no,-1)+10 b,  group_cd,count(*) a  from 
		(select 
		(case when t."上一炉停浇时间"*1 < t."钢包到达时间"*1 then 1 else 0 end ) ifup,
		t.*  FROM ( 
		SELECT   ( 
		( select max(LD_CAST_END_TIME)  from TB2_LLZ00 ta01
		 where ta01.ccm_no=t.ccm_no and ta01.td_cd=t.td_cd
		 	and ta01.CAST_NUM <  t.CAST_NUM )) 	上一炉停浇时间 , 
			 t.*  FROM 
		( select  NVL(NVL(L1.TD_WGT_MIN, L2.TD_WGT_MIN), L3.TD_WGT_MIN) 中包最小重量, 
		Z.CCM_NO, SUBSTR(LD_ARV_DTIME,1,8) DT,Z.GROUP_CD, 
		LD_ARV_DTIME  AS 钢包到达时间,   nvl(LD_CAST_END_TIME,to_char(sysdate,'YYYYMMDDHH24MISS'))  AS 大包停浇时间,
		td_cd,Z.TD_AGE,  Z.CAST_NUM AS 连浇炉次, Z.CAST_NUM,
		LD_ARV_DTIME
		FROM TB2_LLZ00 Z
		LEFT JOIN TB2_LLZ21 L1  ON L1.CAST_NO = Z.CAST_NO
		LEFT JOIN TB2_LLZ22 L2  ON L2.CAST_NO = Z.CAST_NO
		LEFT JOIN TB2_LLZ23 L3  ON L3.CAST_NO = Z.CAST_NO
											 
		WHERE  LD_ARV_DTIME IS NOT NULL   AND LD_ARV_DTIME   < 20300328134833
		 and z.CAST_NUM>1 and z.td_age > 1
		 and ( L1.TD_WGT_MIN<16 or  L2.TD_WGT_MIN<16 or  L3.TD_WGT_MIN<16  )
		 ) T 	where   CAST_NUM is   not   null  
		 ) t  ) t
		 where dt between  v_bt  and   v_et
		 group by ifup,ccm_no,group_cd  )   );
	
  insert into TB2_LKB591 (id,fl,t01  )  (select 9970,9973,'中包低液面标准情况' from dual);
  insert into TB2_LKB591 (id,fl, t02,t03,t04,t05,t06)   
  (select 9970,9974,'基础分','接得上的分数值','接不上的分数值' ,'最大值' , '最小值' from dual);
  insert into TB2_LKB591 (id,fl, t02,t03,t04,t05,t06 , t07)   
  (select 9970,9975,
	nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
	              and t.sbbfl='LKB522' and t.sbbdm='C1202')  ),0),  --'基础分',
	nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
	              and t.sbbfl='LKB522' and t.sbbdm='C1203')  ),0),  --'接得上的分数值',
	nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
	              and t.sbbfl='LKB522' and t.sbbdm='C1204')  ),0),  --'接不上的分数值',
	nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
	              and t.sbbfl='LKB522' and t.sbbdm='C1205')  ),0),  --'最大值',
	nvl(((select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT
	              and t.sbbfl='LKB522' and t.sbbdm='C1206')  ),0),  --'最小值',
	
	0	 from dual);
	
	
  
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04,t05,t06)  
  (select 110,100,'P3班长','bt'||p_bt,'et'||p_et,'zd' ,
   'bz' , to_char(sysdate,'hh24:mi:ss') a from dual);
  
  insert into TB2_LKB591 (id,fl,t01  )  (select 110,100,'指标情况' from dual);
  insert into TB2_LKB591 (id,fl,t01,t02,t03,t04 ,t05,t06,t07,
  t11 , t12 , t13 , t14 , t15 , t16 , t17 , t18 , t19 , 
	t20 , t21 , t22 , t23 , t24 , t25 , t26 , t27 ,
  t31,t32,t33 ,t34,t35 ,t36  )  
  (select 110,105,
  '站点' as t01 , '站点ID' as t02 , '班组' as t03 , '班组ID' as t04 , 'P3班长' as t05 , '职务' as t06 , '个人工分' as t07 , 
  '产量' as t11 , '废品' as t12 , '粗轧' as t13 , '中轧' as t14 , '精轧' as t15 , '收得率' as t16 , '开机对接成功率' as t17 , 
  '新品优质率' as t18 , '断流' as t19 , '工艺违规' as t20 , '不配合' as t21 , '普钢中包龄' as t22 , '非计划停机' as t23 ,
  '成本' as t24 , '微伤' as t25 , '轻伤' as t26 , '重伤' as t27 , 
  '生产考核' as t31 , '工艺考核' as t32 , '班组总考核额' as t33 , '恒拉速' as t34  ,
	'中包低液面接的上' as t35 , '中包低液面接不上' as t36 
	
	  from dual);
  
  
  --  指标
  --分机座 分班组
  insert into TB2_LKB591 (  t13,t14,t15, t20 , t21 , t22 ,   t24 , t25 , t26 , t27 , t35,t36 , 
  t11, t12,  t16, t17,   t23, 
  t69,t68, --断流　漏钢
  t18,
  t31,t32,t33 ,
  id,fl, t01,t02,t03,t04,t05,t06,t07  )  
  (  select 
  nvl((ta.t13),0)+nvl((tb.t13),0),nvl((ta.t14),0)+nvl((tb.t14),0),nvl((ta.t15),0)+nvl((tb.t15),0),
  nvl((ta.t20),0),nvl((ta.t21),0),
  nvl((ta.t22),0),nvl((ta.t24),0),nvl((ta.t25),0),nvl((ta.t26),0),nvl((ta.t27),0),  
	nvl((ta.t28),0),nvl((ta.t29),0),  
  nvl((tb.t11),0),nvl((tb.t12),0),nvl((tb.t16),0),nvl((tb.t17),0),nvl((tb.t23),0),  
  nvl((tb.t19),0),nvl((tlg.a),0),
  nvl((tc.t18),0),
  nvl((td.t31),0),nvl((td.t32),0),nvl((td.t33),0),
  t.id,t.fl,t.t01,t.t02,t.t03,t.t04  ,tman.khman,tman.khzw,tman.khgf
  from 
  (select 110 id ,110 fl , ta.khzdid t02,ta.khzd t01,tb.khbbid t04,tb.khbb t03 from 
     (select t.khzdid ,t.khzd from TB2_LKB596 t where t.ifdel=9 and t.khzdid>10 ) ta,        
     (select t.khbbid ,t.khbb from TB2_LKB596 t where t.ifdel=9 and t.khbbid<5 
        union select 5,'小计' from dual ) tb ) t
  
  left join (   select tman.khman ,tman.khzw,tman.khgf,tman.khzdid,tman.khbzid  from tb2_lkb599 tman  
  where tman.ifdel=0 and tman.dt=v_dt and tman.khzw in ('班长')  and tman.khgz='P3' ) tman
   on tman.khzdid=t.t02 and tman.khbzid=t.t04
  
  --手动录入表
  left join (  select t.khzdid t02, nvl(t.khbzid,'5') t04 ,  
  nvl(sum(t.kh11),0) t13,nvl(sum(t.kh12),0) t14,nvl(sum(t.kh13),0) t15,nvl(sum(t.kh14),0) t20,
  nvl(sum(t.kh15),0) t21,nvl(sum(t.kh16),0) t22,nvl(sum(t.kh17),0) t24,nvl(sum(t.kh18),0) t25,
  nvl(sum(t.kh19),0) t26,nvl(sum(t.kh20),0) t27,
  nvl(sum(nvl(t.kh22,0)),0) t28,nvl(sum(nvl(t.kh23,0)),0) t29
    from tb2_lkb522 t  where t.ifdel=0 and  t.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')
   and t.khname in ( select tman.khman from tb2_lkb599 tman  where tman.ifdel=0 and tman.dt=v_dt 
   and tman.khzw in ('班长')  and tman.khgz='P3'  )  and t.KHDMFL= 'LKB522'
    group by t.khzd,t.khzdid, /*t.khbz,*/cube( t.khbzid )    ) ta on ta.t02=t.t02 and ta.t04=t.t04
  
  --漏钢记录数
  left join (select t.zd,nvl(t.bz,'小计') bz,count(*) a from (
   select to_char(to_date(t.date_time,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') dt,
   DECODE(CCM_NO, 'LG2H1','11', 'LG2H2', '12','LG2H3','13') zd,  group_cd bz, t.rowid 
   from tb2_llz65 t  ) t  where  t.zd is not null and t.bz is not null
    and  t.dt  between  replace(p_bt,'-','') and  replace(p_et,'-','')  
   group by t.zd ,cube(t.bz) )  tlg on tlg.zd=t.t02 and tlg.bz=t.t03
    
    
  -- 9370 
  left join ( select t.t02,t.t04 ,t.t16 t11,t.t37 t12, t.t34 t13,t.t35 t14, t.t36 t15,
    t.t22 t16 , t.t46 t17, t.t47 t19, t.t48 t23  
    from TB2_LKB591 t 
    where t.id=9370 and t.t01=1 and t.t02 in ('11','12','13') ) tb on tb.t02=t.t02 and tb.t04=t.t04
  
  --9375
  left join ( select t.t02,t.t04,t.t21 t18 from TB2_LKB591 t 
    where t.id=9375 and t.t01=1 ) tc on t.t02=tc.t02  and t.t04=tc.t04  
  
  -- 日常考核的P3,P9班组考核
  left join ( select t.khbbid,t.khzdid , sum(t.khje+t.khje2) t33 ,  
      sum(case when t.khflid=2396 then (t.khje+t.khje2) else 0 end ) t31,
      sum(case when t.khflid=2406 then (t.khje+t.khje2) else 0 end ) t32 from tb2_lkb596 t   
      where  t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','')
         and t.ifbzman=1 and t.ifseng=0 and t.ifdel=0 and t.khgz in ('P3','P9')
           group by t.khbbid,t.khzdid )    td on td.khbbid=t.t04 and td.khzdid=t.t02    
    
     )
       ;
			 
			 -- '接不上1,接的上0'
			 
  --计算中包低液面情况 
  update TB2_LKB591 t set 
	t.t35= t.t35+ nvl(( select ta.t05 from TB2_LKB591 ta where ta.id=9970 and ta.fl=9972
	 and ta.t01=0 and ta.t03=t.t02 and ta.t04=t.t04 ),0) ,
	t.t36= t.t36+ nvl(( select ta.t05 from TB2_LKB591 ta where ta.id=9970 and ta.fl=9972
	 and ta.t01=1 and ta.t03=t.t02 and ta.t04=t.t04 ),0) 
	where t.id=110 and t.fl=110;
	
	
	--'中包低液面接的上' as t35 , '中包低液面接不上' as t36 
	--'站点' as t01 , '站点ID' as t02 , '班组' as t03 , '班组ID' as t04 ,
	
  
  ---  '断流' as t19  要加上　各机漏钢记录中的漏钢数
  
	
  --计算断流列　T19=T69+T68
  update TB2_LKB591 t set t.t19=t.t69+t.t68 where t.id=110 and t.fl=110;
  
	--恒拉速 
  update TB2_LKB591 t set t.t34= nvl(( select ta.t10 from tb2_lkb591 ta where ta.id=9987
	 and ta.fl=9987  and ta.t02=t.t02 and ta.t04=t.t04 ),0) 	where t.id=110 and t.fl=110;
	
	----------------------------------------------------------------------------------------------------------------------------------
  --指标汇总与平均
     
  insert into TB2_LKB591 (  t13,t14,t15, t20 , t21 , t22 ,   t24 , t25 , t26 , t27  ,  
  t11, t12,  t16, t17, t19,  t23, 
  t18,
  id,fl, t01,t02,t03,t04    )  
  (select  sum(t13),sum(t14),sum(t15),sum(t20),sum(t21),sum(t22),sum(t24),sum(t25),sum(t26),sum(t27),
  sum(t11),sum(t12),sum(t16),sum(t17),sum(t19),sum(t23),
  sum(t18),
  110,120,'车间',20,'合计',5
  from  TB2_LKB591 t where t.id=110 and t.fl=110 and t.t04<5 )    ;
  ---------------------------------------------------------------------------------
  update TB2_LKB591 ta set 
  ta.t16=(select  t.t22 t16  from TB2_LKB591 t where t.id=9370 and t.t02='20' and t.t04='5') ,
  ta.t17=(select  t.t46 t17  from TB2_LKB591 t where t.id=9370 and t.t02='20' and t.t04='5') ,
  ta.t18=(select  t.t21 t18  from TB2_LKB591 t where t.id=9375 and t.t02='11' and t.t04='5')  
  where ta.id=110 and ta.fl=120   ;
  
  
  insert into TB2_LKB591 (  t13,t14,t15, t20 , t21 , t22 ,   t24 , t25 , t26 , t27  ,  
  t11, t12,  t16, t17, t19,  t23, 
  t18,
  id,fl, t01,t02,t03,t04    )  
  (select round(t13/12,10),round(t14/12,10),round(t15/12,10),round(t20/12,10),round(t21/12,10),
  round(t22/12,10),  round(t24/12,10),round(t25/12,10),round(t26/12,10),round(t27/12,10),
  round(t11/12,10),round(t12/12,10),  round(t16/12,10),round(t17/12,10),round(t19/12,10),round(t23/12,10),
  round(t18/12,10) ,
  110,130,'车间',20,'平均',6
  from  TB2_LKB591 t where t.id=110 and t.fl=120  )    ;
  
  update TB2_LKB591 ta set 
  ta.t16=(select  t.t16  from TB2_LKB591 t where t.id=110 and t.fl=120) ,
  ta.t17=(select  t.t17  from TB2_LKB591 t where t.id=110 and t.fl=120) ,
  ta.t18=(select  t.t18  from TB2_LKB591 t where t.id=110 and t.fl=120)  
  where ta.id=110 and ta.fl=130   ;
  
  
  --求分
  insert into TB2_LKB591 ( id,fl,  t01  )   ( select  120,100, '分数'   from dual  );
  insert into TB2_LKB591 ( id,fl,  t01 ,t02,t03,t04,
  t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23 ,
	t28, t29 ,t30,t31,t32 ,t34 ,t35 ,t41) 
  (select  120,105, '站点','站点ID','班组','班组ID' , 
  '产量','废品','轧钢退废','收得率','开机对接成功率','新品优质率',
	'断流','工艺违规','不配合试验工作','普钢中包龄',
  '非计划停机/次','普钢成本','安全',
	'班组考核分' as t28,'个人考核分','班组总分' as t30,'无考核总分' as t31,
	'个人总分' as t32 ,'恒拉速' as t34 ,'低液面' as t35 ,'台上难度系数' as t41
      from dual  );
  
  
  
  insert into TB2_LKB591 (id,fl,  t01 ,t02,t03,t04,  
  t11  , t12 , t13 ,  t17 , t18 , t19 , t21 , t22 , t23 , 
  t14,t15,t16,t20, T34,T35,
	t41, --台上难度系数
  t05,t06,t07
	) 
  
  (select  120,110, t.t01,t.t02,t.t03,t.t04  ,
  --t11  , t12 , t13 ,  t17 , t18 , t19 , t21 , t22 , t23 ,
	
  --产量  公式  A1103+(N-(AVG(N)-X)*A1104
  /* A1103.A +(t.t11-a11avg.a)*A1104.A */
	( CASE WHEN T.T02=11 THEN A1103.A +(t.t11-a11avg.a-A1111.A)*A1104.A 
		     WHEN T.T02=12 THEN A1103.A +(t.t11-a11avg.a-A1112.A)*A1104.A 
         WHEN T.T02=13 THEN A1103.A +(t.t11-a11avg.a-A1113.A)*A1104.A  END ) t11   ,
	
  
  --废品  公式  IF N=A1203,A1204,A1205+N*A1206
  ( CASE WHEN  t.T12=A1203.A THEN A1204.A ELSE A1205.A+t.T12*A1206.A END ) t12  ,
  
  --开花头  公式  IF(N1+N2+N3=A1303,A1304,A1305+N1*A1306+N2*A1307+N3*A1308)  
  ( CASE WHEN t.T13+t.T14+t.T15=A1303.A THEN A1304.A ELSE A1305.A+t.T13*A1306.A+t.T14*A1307.A+t.T15*A1308.A END ) t13 ,
   
  --断流次数  公式  A1603+N*A1604
   ( A1603.a+t.t19*A1604.a )  t17 ,
   
   --工艺违规  公式  N*A2203
   (t.t20*A2203.A) T18 ,
   
   --不配合试验  公式  N*A2303
   (t.t21*A2303.A) T19 ,
   
   --非计划停机  公式  A2103+N*A2104
   (A2103.A+t.T23*A2104.A) T21 ,
   
   --成本  公式  A1903+(A1905-N)*A1904
   (A1903.A+(A1905.A-t.T24)*A1904.A) T22 ,
   
   --安全  公式  IF(N1+N2+N3=A2003,A2004,N1*A2004+N2*A2005+N3*A2006)
  ( CASE WHEN t.T25+t.T26+t.T27=A2003.A THEN A2004.A ELSE t.T25*A2004.A+t.T26*A2005.A+t.T27*A2006.A END ) t23  , 
  
  t16,t17,t18,t22,
	
	--恒拉速 =C1102+(N-(C1111,C1112,C1113))*C1104
  ( case when 	( CASE WHEN T.T02=11 THEN C1102.A +(t.t34-C1111.A)*A1104.A 
		     WHEN T.T02=12 THEN C1102.A +(t.t34-C1112.A)*A1104.A 
         WHEN T.T02=13 THEN C1102.A +(t.t34-C1113.A)*A1104.A  END ) > c1106.a then c1106.a
		  when 	(     CASE WHEN T.T02=11 THEN C1102.A +(t.t34-C1111.A)*A1104.A 
		     WHEN T.T02=12 THEN C1102.A +(t.t34-C1112.A)*A1104.A 
         WHEN T.T02=13 THEN C1102.A +(t.t34-C1113.A)*A1104.A  END ) < c1107.a then c1107.a
	  else ( CASE WHEN T.T02=11 THEN C1102.A +(t.t34-C1111.A)*A1104.A 
		     WHEN T.T02=12 THEN C1102.A +(t.t34-C1112.A)*A1104.A 
         WHEN T.T02=13 THEN C1102.A +(t.t34-C1113.A)*A1104.A  END ) end )  t34   ,
	
	--中包低液面 （基础分15分，接得上一次扣2分，接不上一次扣0.5分）	0	C1200
	--=C1202+(N1*C1203)+(N2*C1204)	 最大值		15	C1205 最小值		0	C1206
	(CASE WHEN (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) > C12.C1205 THEN C12.C1205
	      WHEN (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) < C12.C1206 THEN C12.C1206
        ELSE (C12.C1202+(T.T35*C12.C1203)+(T.T36*C12.C1204)) END )   ,
  
	--台上难度系数
	( case --台上难度系数
	when t.t02=11 and t.t04=1 then B0111.A*1 when t.t02=11 and t.t04=2 then B0112.A*1 
	when t.t02=11 and t.t04=3 then B0113.A*1 when t.t02=11 and t.t04=4 then B0114.A*1 
	when t.t02=12 and t.t04=1 then B0121.A*1 when t.t02=12 and t.t04=2 then B0122.A*1 
	when t.t02=12 and t.t04=3 then B0123.A*1 when t.t02=12 and t.t04=4 then B0124.A*1 
	when t.t02=13 and t.t04=1 then B0131.A*1 when t.t02=13 and t.t04=2 then B0132.A*1 
	when t.t02=13 and t.t04=3 then B0133.A*1 when t.t02=13 and t.t04=4 then B0134.A*1 
	else 1 end ) as t41,
	
  t05,t06,t07
  from 
  (select   id,fl, t01,t02,t03,t04  ,t05,t06,t07,
  t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27,T34 ,t35 ,t36
  from TB2_LKB591 ta where ta.id=110 and  ta.fl=110 and to_number(ta.t04)<5 ) t,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1103') A1103,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1104') A1104,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1111') A1111,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1112') A1112,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1113') A1113,
  (select to_number(tb.t11) a from TB2_LKB591 tb where  tb.fl=130 and tb.id=110 ) a11avg ,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1203') A1203,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1204') A1204,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1205') A1205,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1206') A1206,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1303') A1303,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1304') A1304,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1305') A1305,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1306') A1306,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1307') A1307,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1308') A1308,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1603') A1603,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1604') A1604,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2203') A2203,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2303') A2303,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2103') A2103,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2104') A2104,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1903') A1903,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1904') A1904,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1905') A1905,
  
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2003') A2003,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2004') A2004,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2005') A2005,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A2006') A2006,
 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0111') B0111 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0112') B0112 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0113') B0113 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0114') B0114 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0121') B0121 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0122') B0122 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0123') B0123 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0124') B0124 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0131') B0131 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0132') B0132 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0133') B0133 , 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='B0134') B0134 ,
 
 
 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1102') C1102, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1104') C1104,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1106') C1106, 
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1107') C1107,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1111') C1111,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1112') C1112,
  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='C1113') C1113,
-- =C1102+(N-(C1111,C1112,C1113))*C1104
  
  ( select  t02*1 C1202,t03*1 C1203,t04*1 C1204,t05*1 C1205,t06*1 C1206 
	  from TB2_LKB591 t where t.id=9970 and t.fl=9975 ) C12,

  (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=V_DT and t.sbbfl='LKB522' and t.sbbdm='A1103') A9999 
    ) 
    ;
  
	
	
	
  
  update TB2_LKB591 t set 
	
	
	--班组考核分  ， 个人考核分
	t.t28=nvl((   select  nvl(sum(ta.khje),0) khje  from TB2_LKB594 ta 
     where ta.ifdel=0 and ta.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')   
		 and (ta.khzdid = t.t02 )	 and (ta.khbbid= t.t04) and (ta.khgz= 'P3' )  
		 and ta.ifbz='班组考核' and ta.ifbzid=22 		  ),0) ,
		 
	t.t29=nvl((   select  nvl(sum(ta.khje),0) khje  from TB2_LKB594 ta 
     where ta.ifdel=0 and ta.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')   
		 and (ta.khzdid = t.t02 )	 and (ta.khbbid= t.t04) and (ta.khgz= 'P3' )  
		 and ta.ifbz='个人考核' and ta.ifbzid=11 and t.t05=ta.man		  ),0) ,
		 
	
  /*
  新品优质率  说明  ±1%奖扣2分，最高扣3分。
  新品优质率  公式  MAX[ IF N=A1703,A1704, (N-X)*A1705] >= A1706
  */
  T.T16=(SELECT  TA.T18 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  
  t.t71=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1703') ,
  t.t72=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1704') ,
  t.t73=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1705') ,
  t.t74=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1706') ,
  t.t75=( case when t.t02=11 then (select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1711') else 0 end ) ,
  
  /*
  普钢中包龄  说明  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉
  普钢中包龄  公式  IF N=A1503,A1504,A1505+(N-X)*A1506
  
  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉    A1501

  
  
   */
  T.T20=(SELECT  TA.T22 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) ,
  T.T87=(SELECT  TA.T22 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  
  t.t83=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1503') ,
  t.t84=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1504') ,
  t.t85=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1505') ,
  t.t86=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1506') ,
  t.t81=( case 
          when t.t02=11 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1511') 
          when t.t02=12 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1512') 
          when t.t02=13 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1513') 
          else 0 end ) ,

  
  /*
  钢水收得率  说明  达标奖20分，每±0.1%奖扣2分，最高奖扣15分。1#机99.6 %、2#机99.8%、3#机99.8%，
  钢水收得率  公式  [ IF N=A1403,A1404,A1407+(ABS((N-X)*A1405)<=A1406)]
  */
  
  T.T14=(SELECT  TA.T16 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  t.t51=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1403') ,
  t.t52=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1404') ,
  t.t53=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1405') ,
  t.t54=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1406') ,
  t.t55=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1407'),  
  t.t56=( case 
          when t.t02=11 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1411') 
          when t.t02=12 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1412') 
          when t.t02=13 then (select to_number(t.khje) a from tb2_lkb598 t
               where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1413') 
          else 0 end ) ,

  /*
  开机对接成功率  说明  基奖10分，以成功率98%计算，每升降1%奖扣0.5分。 暂时没有分3台机
  开机对接成功率  公式  A1803+(N-A1805)*A1804
  */
  
  T.T15=(SELECT  TA.T17 FROM TB2_LKB591 TA WHERE TA.ID=110 AND  TA.T02=T.T02 AND TA.T04=T.T04 ) , 
  t.t61=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1803') ,
  t.t62=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1804') ,
  t.t63=(select to_number(t.khje) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A1805')
  where t.id=120 and t.fl=110
  ;
  
  
  update TB2_LKB591 t set 
  /*
  新品优质率  说明  ±1%奖扣2分，最高扣3分。
  新品优质率  公式  MAX[ IF N=A1703,A1704, (N-X)*A1705] >= A1706
  */
  t.t16=  (case when  1*t.t16=1*t.t71 then 1*t.t72 when (1*t.t16-1*t.t75)*1*t.t73<1*t.t74 then 1*t.t74
   else (1*t.t16-1*t.t75)*1*t.t73 end ) ,  
  
  /*
  普钢中包龄  说明  基数10分，±1炉奖扣0.3分。≥30炉，3#机≥22炉
  普钢中包龄  公式  IF N=A1503,A1504,A1505+(N-X)*A1506   
  
  */
  t.t20= (case when  1*t.T87=1*t.t83 then 1*t.t84 
         else 1*t.t85 + (1*t.T87-1*t.t81)*1*t.t86 end ) , 
  
   
          

  /*
  钢水收得率  说明  达标奖20分，每±0.1%奖扣2分，最高奖扣15分。1#机99.6 %、2#机99.8%、3#机99.8%，
  钢水收得率  公式  [ IF N=A1403,A1404,A1407+(ABS((N-X)*A1405)<=A1406)]
  */
  t.t14= (case when  1*t.t14=1*t.t51 then 1*t.t52 
  when abs((1*t.t14-1*t.t56)*1*t.t53) > 1*t.t54 then  1*t.t55 + 1*t.t54 
  --when 1*t.t55+(1*t.t14-1*t.t56)*1*t.t53>1*t.t54 then 1*t.t54
  else 1*t.t55+(1*t.t14-1*t.t56)*1*t.t53 end ) , 


  /*
  开机对接成功率  说明  基奖10分，以成功率98%计算，每升降1%奖扣0.5分。 暂时没有分3台机
  开机对接成功率  公式  A1803+(N-A1805)*A1804
  */
  t.t15= 1*t.t61+(1*t.t15-1*t.t63)*1*t.t62 
  where t.id=120 and t.fl=110
  ;
  
  -- 分数合计各班各机 
  update TB2_LKB591 t set 
	--无考核分总分
	t.t31=(t.t11+t.t12+t.t13+t.t14+t.t15+t.t16+t.t17+t.t18+t.t19+t.t20+t.t21+t.t22+t.t23+t.t34+t.t35)	
  where t.id=120 and t.fl=110;
	
  update TB2_LKB591 t set 
	-- （总分+班组考核）*班组系数
	t.t30=(t.t31+t.t28 )*t.t41
  where t.id=120 and t.fl=110;
	
  -- 设置 各机各班 台上难度系数  --t02 zdid ,t04 bzid 
	
	
	
	
  --分机座小计 
  insert into TB2_LKB591
  (id,fl,  t01 ,t02,t03,t04,  
   t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23,
  t30,t31,t32,t34,t35) 
  ( select  120,120,t.t01,t.t02,'小计',5,
   sum(t.t11) , sum(t.t12) , sum(t.t13) , sum(t.t14) , sum(t.t15) , sum(t.t16) , 
   sum(t.t17) , sum(t.t18) , sum(t.t19) , sum(t.t20) , sum(t.t21) , sum(t.t22) , sum(t.t23), 
      sum(t.t30)  ,  sum(t.t31)  ,  sum(t.t32) ,  sum(t.t34)  ,  sum(t.t35)  
  from TB2_LKB591 t where id=120 and fl=110 group by t.t01,t.t02 )
  ;
  --车间合计  
  insert into TB2_LKB591
  (id,fl,  t01 ,t02,t03,t04,  
   t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, 
   t30,t31,t32,t34,t35) 
  ( select  120,130,'车间',20,'合计',5,
   sum(t.t11) , sum(t.t12) , sum(t.t13) , sum(t.t14) , sum(t.t15) , sum(t.t16) , 
   sum(t.t17) , sum(t.t18) , sum(t.t19) , sum(t.t20) , sum(t.t21) , sum(t.t22) , sum(t.t23), 
   sum(t.t30)   ,  sum(t.t31)  ,  sum(t.t32)  ,  sum(t.t34)   ,  sum(t.t35)  
   from TB2_LKB591 t where id=120 and fl=120  )
  ;
  
  
	
	
  
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_01_12;

 

  --P3班长 奖金计算 12个班算法分钱
  PROCEDURE tb00_list_02(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间 
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN
  	
	tb00_list_02_04(p_bt,p_et,a_cur);
	commit;
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_02;



  --P3班长 奖金计算 4个班算法分钱
  PROCEDURE tb00_list_02_04(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间 
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    a_CUR   V_CUR ; 
    V_JJ  varchar2(10);
     V_JJ1  varchar2(10);
     V_JJ_FBZ  varchar2(10);
    V_KHZF varchar2(10); 
/*    V_ZJJ  varchar2(10);*/
    V_BZKHZF varchar2(10); 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_fldm:='LKB521'; 
  v_dt:=substr(replace(p_et,'-',''),1,6);
  
  
  --先取出自动指标 指标分数 从 LKB523 中取出  
  PG2_LKB523.tb00_list_01(replace(p_bt,'-',''),replace(p_et,'-',''),a_cur);   
  
  
  
  --求钱
  insert into TB2_LKB591 ( id,fl,  t01  )   ( select  130,100, '奖金'   from dual  );
  insert into TB2_LKB591 ( id,fl,  t01 ,t02,t03,t04,t05,t06,t07,t08,t09,
  t10,t11, t12, t13, t14, t15, t16, t17, t18, t19, t20,
	t24,t25,
  t31,t32,t33,t34,t35,t36,t37,t38 , t51 , t52 ,t300,t301) 
  (select  130 as id, 105 as fl, '站点' as t01, '站点ID' as t02, '班组' as t03, '班组ID' as t04, 
	'姓名' as t05, '职务' as t06, '个人工分' as t07, '班组系数' as t08, '个人系数' as t09, 
	'基础得分' as t10, '个人得分' as t11, '分值奖金' as t12, '指标奖金' as t13, 
	'生产考核' as t14, '工艺考核' as t15, '考核总数' as t16, '考核返还' as t17,
	 '个人考核' as t18, '出勤考核' as t19, '奖金预算' as t20, 
	 
	 '个人分总和' as t24, '奖金可分总数' as t25, 
	 
	 '生产考核' as t31, '生产承担比例'  as t32, 
	 '工艺考核' as t33, '生产承担比例'  as t34, 
	 '生产科室考核' as t35, '生产科室承担比例'  as t36, 
	 '工艺科室考核' as t37, '工艺科室承担比例'  as t38 , '个人考核分'  as t51 ,'个人系数得分'  as t52,
   '满勤奖' as t300,'最终合计' as t301   
      from dual  );
			
			
	 
  
  insert into TB2_LKB591 (id,fl,  t01 ,t02,t03,t04,t05,t06,t07, t08,
	t10,t51,
  t31,t32,t33,t34,t35,t36,t37,t38 ) 
  ( select  130,110,t.t01,t.t02,t.t03,t.t04,t.t05,t.t06,t.t07, 1, -- 班组系数已经在分中加上，此处不加 t.t41,
  tbz.t30 ,  t29,
	
  (tb.t31-tb.t33-tb.t35-tb.t37),--P3班长-生产考核 （除工艺外其它类）	0.13	A2444
  nvl((select (t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2444'),0.08) ,
	tb.t33,--P3班长-工艺考核	0.13	A2443
  nvl((select (t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2443'),0.08) ,
	tb.t35,--P3班长-科室生产考核	0.13	A2442
  nvl((select (t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2442'),0.08) ,
	
	tb.t37,  --P3班长-科室工艺考核	0.13	A2441
  nvl((select (t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2441'),0.08)   
	
	 
  from TB2_LKB591 t   left join 
	
	--考核取班组总考核 不分机座
	( select /*t.khzdid t02,*/ t.khbbid t04,  sum(t.khje+t.khje2) t31 ,  --总考核 (生产类+ 其它三类)
      sum(case when t.khflid=2406 then (t.khje+t.khje2) else 0 end ) t33, -- 工艺考核	
      sum(case when t.khflid=12823 then (t.khje+t.khje2) else 0 end ) t35, -- 生产科室考核
      sum(case when t.khflid=12826 then (t.khje+t.khje2) else 0 end ) t37  -- 工艺科室考核
			from tb2_lkb596 t  where  t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','')
         and t.ifbzman=1 and t.ifseng=0 and t.ifdel=0 and t.khgz in('P3','P9' )
				      group by /*t.khzdid,*/ t.khbbid ) tb 
  --(select ta.t02,ta.t04,ta.t31,ta.t32,ta.t33  from TB2_LKB591 ta where ta.id=110 and ta.fl=110) tb 
  on /*t.t02=tb.t02 and*/ t.t04=tb.t04   
	
	--总分取班组总分 不分机座
	left join 
	( select tc.t04,tc.t30  from  TB2_LKB591 tc where tc.id=120 and tc.fl=115   ) tbz on tbz.t04=t.t04	
	
  where t.id=120 and t.fl=110   );
   
	
  update TB2_LKB591 t set  
	
	  t.t09=round(t.t07*t.t08,10), t.t52=round(t.t10*t.t07*t.t08,10) , 
		 t.t11=round(t.t10*t.t07*t.t08,10)+t.t51 , 
   t.t14=round(t.t31*t.t32+t.t35*t.t36,10),t.t15=round(t.t33*t.t34+t.t37*t.t38,10),
	 t.t16=nvl(round(t.t31*t.t32+t.t35*t.t36+t.t33*t.t34+t.t37*t.t38 ,10),0)
  where t.id=130 and t.fl=110 ;
    
  
  
  --考核返还
  --个人考核  ,出勤考核
  update TB2_LKB591 t set 
  t.t17=nvl((t.t16-(select round(sum(ta.t16)/12,10)  from TB2_LKB591 ta where ta.id=130 and ta.fl=110 )),0) ,
  t.t18=nvl(( select nvl(sum(ta.khje+ta.khje2),0) tc from tb2_lkb596 ta where  ta.ifbzman=2 and ta.ifseng=0 and 
  ta.khdt between replace(p_bt,'-','') and replace(p_et,'-','')  and ta.ifdel=0 and ta.khgz in ('P3','P9') 
  and ta.man=t.t05 /*and ta.khbbid=t.t04 and ta.khzdid=t.t02 */    ),0),
  t.t19=nvl(( select nvl(sum(ta.kh21),0) tc from   tb2_lkb522 ta  where ta.ifdel=0 
  and  ta.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')   and ta.khname =t.t05 ),0)   
  where t.id=130 and t.fl in (110 ) ; 
  
  
  
  --车间合计  
  insert into TB2_LKB591  (id,fl,  t01 ,t02,t03,t04, t11, t14, t15, t16,t17,t18,t19 ) 
  ( select  130,130,'车间',20,'合计',5, sum(t.t11),sum(t.t14),sum(t.t15),sum(t.t16),sum(t.t17),sum(t.t18),sum(t.t19)   
  from TB2_LKB591 t
   where id=130 and fl=110  )  ;
  
  --车间P3班长总钱
	
	-- 20140617 by xyz 区分2，3号机付班长 ，/// 1号机的为正班长
	
  update TB2_LKB591 t set 
  t.t07=((select sum(ta.t07)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t08=((select sum(ta.t08)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t09=((select sum(ta.t09)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t10=((select sum(ta.t10)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t11=((select sum(ta.t11)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t13=nvl((select ta.moneyd  from tb2_lkb597 ta 
                    where ta.ifdel=0 and ta.gz='P3班长' and substr(ta.dtime,1,6) =v_dt ),10000)
  where t.id=130 and t.fl=130 ; 
	
	
	
	/*
	'基础得分' as t10, '个人得分' as t11, '分值奖金' as t12, '指标奖金' as t13,  
	'站点ID' as t02, '个人分总和' as t24, '奖金可分总数' as t25, 
	*/
	
  update TB2_LKB591 t set  
  t.t24=((select sum(ta.t11)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 and ta.t02=11 )) ,
  t.t25=nvl((select ta.moneyd  from tb2_lkb597 ta 
                    where ta.ifdel=0 and ta.gz='P3班长' and substr(ta.dtime,1,6) =v_dt ),10000)
  where t.id=130 and t.fl=110 and t.t02=11 ; 
	
	
  update TB2_LKB591 t set  
  t.t24=((select sum(ta.t11)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110  and ta.t02 in (12,13)  )) ,
  t.t25=nvl((select ta.moneyd  from tb2_lkb597 ta 
                    where ta.ifdel=0 and ta.gz='P3付班长' and substr(ta.dtime,1,6) =v_dt  ),10000)
  where t.id=130 and t.fl=110 and t.t02 in (12,13) ; 
	
	
  
  --车间P3班长 分值 
  update TB2_LKB591 t set 
  t.t12=(select round(ta.t13/ta.t11,10)  from TB2_LKB591 ta where ta.id=130 and ta.fl=130 )
  where t.id=130 and t.fl in (110,120,130) ; 
		
	
  --车间P3班长 分值 
  update TB2_LKB591 t set 
  t.t12= round(t.t25/t.t24,10) 
	  --(select round(ta.t25/ta.t24,10)  from TB2_LKB591 ta where ta.id=130 and ta.fl=130 )
  where t.id=130 and t.fl in (110,120,130) ; 
	
	-- 20140617 by xyz 区分2，3号机付班长 ，/// 1号机的为正班长
	
	
	
  
  --指标奖金
  update TB2_LKB591 t set t.t13=round(t.t11*t.t12,10)  where t.id=130 and t.fl in (110) ; 
  
  -- 奖金预算
  update TB2_LKB591 t set t.t20=t.t13+t.t17+t.t18+t.t19 where t.id=130 and t.fl in (110 ) ; 
  -- 满勤奖
  update TB2_LKB591 t set t.t300=100 where t.id=130 and t.fl in (110 ) ;
  -- 最终合计
  update TB2_LKB591 t set t.t301=t20+100 where t.id=130 and t.fl in (110 ) ;
  
	
  update TB2_LKB591 t set    
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990'))
  where  t.id in (130 ) and t.fl in (110,120,130);
		 
	
  --分机座小计 
  insert into TB2_LKB591  (id,fl,  t01 ,t02,t03,t04, t11,t12,t13, t14, t15, t16,t17,t18,t19,t20,t300,t301  ) 
  ( select 130,120,t.t01,t.t02,'小计',5, sum(t.t11),avg(t.t12), sum(t.t13), sum(t.t14), sum(t.t15), sum(t.t16) ,
  sum(t.t17),sum(t.t18),sum(t.t19) ,sum(t.t20),sum(t.t300),sum(t.t20+100)   from TB2_LKB591 t where id=130 and fl=110 group by t.t01,t.t02 )   ;
  
  update TB2_LKB591 t set 
  t.t13=(select sum(ta.t13) from TB2_LKB591 ta where ta.id=130 and ta.fl=110 ) , 
  t.t20=(select sum(ta.t20) from TB2_LKB591 ta where ta.id=130 and ta.fl=110 ),
  t.t300=(select sum(ta.t300) from TB2_LKB591 ta where ta.id=130 and ta.fl=110 ),
  t.t301=(select sum(ta.t20+100) from TB2_LKB591 ta where ta.id=130 and ta.fl=110 )
  where t.fl=130 and t.id=130 ;
  
   
  update TB2_LKB591 t set   
  t.t07=trim(to_char(trunc(nvl(t.t07,0), 2),'99999990.99')),
  t.t08=trim(to_char(trunc(nvl(t.t08,0), 2),'99999990.99')),
  t.t09=trim(to_char(trunc(nvl(t.t09,0), 2),'99999990.99')),
  t.t11=trim(to_char(trunc(nvl(t.t11,0), 2),'99999990.99')),
  t.t12=trim(to_char(trunc(nvl(t.t12,0), 2),'99999990.99')),
  t.t13=trim(to_char(trunc(nvl(t.t13,0), 2),'99999990.99')),
  t.t14=trim(to_char(trunc(nvl(t.t14,0), 2),'99999990.99')),
  t.t15=trim(to_char(trunc(nvl(t.t15,0), 2),'99999990.99')),
  t.t16=trim(to_char(trunc(nvl(t.t16,0), 2),'99999990.99')),
  t.t17=trim(to_char(trunc(nvl(t.t17,0), 2),'99999990.99')),
  t.t18=trim(to_char(trunc(nvl(t.t18,0), 2),'99999990.99')),
  t.t19=trim(to_char(trunc(nvl(t.t19,0), 2),'99999990.99')),
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 2),'99999990.99')),
  t.t52=trim(to_char(trunc(nvl(t.t52,0), 2),'99999990.99')),
  --
  t.t300=trim(to_char(trunc(nvl(t.t300,0), 2),'99999990.99')),
  t.t301=trim(to_char(trunc(nvl(t.t301,0), 2),'99999990.99'))
  where  t.id in (130,120) and t.fl in (110,115,120,130);
	
	
  
  update TB2_LKB591 t set   
  t.t21=trim(to_char(trunc(nvl(t.t21,0), 2),'99999990.99')),
  t.t22=trim(to_char(trunc(nvl(t.t22,0), 2),'99999990.99')),
  t.t23=trim(to_char(trunc(nvl(t.t23,0), 2),'99999990.99')),
  t.t30=trim(to_char(trunc(nvl(t.t30,0), 2),'99999990.99')),
  t.t31=trim(to_char(trunc(nvl(t.t31,0), 2),'99999990.99')),
  t.t34=trim(to_char(trunc(nvl(t.t34,0), 2),'99999990.99')),
  t.t35=trim(to_char(trunc(nvl(t.t35,0), 2),'99999990.99'))
  where  t.id in (120) and t.fl in (110,115,120,130);
  
	
	
	--个人奖金只要整数
  update TB2_LKB591 t set    
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990')),
  t.t301=trim(to_char(trunc(nvl(t.t301,0), 0),'99999990'))
  where  t.id in (130 ) and t.fl in (110,120,130);
	
	 
	
  update TB2_LKB591 t set    
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990.00')),
  t.t301=trim(to_char(trunc(nvl(t.t301,0), 0),'99999990.00'))
  where  t.id in (130 ) and t.fl in (110,120,130);
   
  begin
  V_KHZF:=0;
  ---del by xyz
  
  /*
  begin
  ---mod by wjp
  
  
  select nvl( 
  ( select ta.moneyd  from tb2_lkb597 ta   where ta.ifdel=0 and ta.gz='P3班长' and substr(ta.dtime,1,6) =v_dt )
  ,0) into V_JJ
  from dual
  ;
     
  select nvl( 
  (   select  max(t.t30 + nvl(nvl(t1.DF,0) ,0) )   from TB2_LKB591 t  left join TB2_LKB522_TEMP  t1  on t .t03 = t1.group_cd and t .t01 = t1.type  where t.id=120  and t.fl in (110,115,120,130)  and t.t01 = '车间' )
  ,0) into V_KHZF
  from dual
  ;
 
     
     delete TB2_LKB522_JJTEMP ; 
   INSERT INTO TB2_LKB522_JJTEMP  
   (ZD,GROUP_CD,ZBZF,ZBJJ)(select  '1号机',t.GROUP_CD,m.t30  ,''  from TB2_LKB522_TEMP  t  left join TB2_LKB591 m  on   t.group_cd = m.t03  where  m.t01 = '小计' and m.id=120  and m.fl in (110,115,120,130));
    INSERT INTO TB2_LKB522_JJTEMP  
   (ZD,GROUP_CD,ZBZF,ZBJJ)(select  '2号机',t.GROUP_CD,m.t30 ,''  from TB2_LKB522_TEMP  t  left join TB2_LKB591 m  on   t.group_cd = m.t03  where  m.t01 = '小计' and m.id=120  and m.fl in (110,115,120,130));
    INSERT INTO TB2_LKB522_JJTEMP  
   (ZD,GROUP_CD,ZBZF,ZBJJ)(select  '3号机',t.GROUP_CD,m.t30  ,''  from TB2_LKB522_TEMP  t  left join TB2_LKB591 m  on   t.group_cd = m.t03  where  m.t01 = '小计' and m.id=120  and m.fl in (110,115,120,130));

   INSERT INTO TB2_LKB522_JJTEMP  
   (ZD,GROUP_CD,ZBZF,ZBJJ)(select  '1号机','小计',sum(ZBZF)/3,'' from TB2_LKB522_JJTEMP where GROUP_CD ! = '小计');
      INSERT INTO TB2_LKB522_JJTEMP  
   (ZD,GROUP_CD,ZBZF,ZBJJ)(select  '2号机','小计',sum(ZBZF)/3,'' from TB2_LKB522_JJTEMP where GROUP_CD ! = '小计');
      INSERT INTO TB2_LKB522_JJTEMP  
   (ZD,GROUP_CD,ZBZF,ZBJJ)(select  '3号机','小计',sum(ZBZF)/3,'' from TB2_LKB522_JJTEMP where GROUP_CD ! = '小计');
     
        select max(ZBZF) into V_BZKHZF from TB2_LKB522_JJTEMP where GROUP_CD = '小计';
             update TB2_LKB522_JJTEMP t set    
       t.ZBJJ =round( (( V_JJ*t.ZBZF)/(nvl(V_BZKHZF,1))),2) where t.zd = '1号机';
     
      select nvl( (
      select ta.moneyd  from tb2_lkb597 ta   
      where ta.ifdel=0 and ta.gz='P3付班长' and substr(ta.dtime,1,6) =v_dt)
      ,0)  into V_JJ_FBZ
      from dual 
             
             ;
       update TB2_LKB522_JJTEMP t set    
       t.ZBJJ =round( (( 0.5*V_JJ_FBZ*t.ZBZF)/(nvl(V_BZKHZF,1))),2) where t.zd = '2号机';
       update TB2_LKB522_JJTEMP t set    
       t.ZBJJ =round( (( 0.5*V_JJ_FBZ*t.ZBZF)/(nvl(V_BZKHZF,1))),2) where t.zd = '3号机';
       
       end;
   */    
       end;
       
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_02_04;


  --P3班长 奖金计算 12个班算法分钱
  PROCEDURE tb00_list_02_12(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间 
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_fldm:='LKB521'; 
  v_dt:=substr(replace(p_et,'-',''),1,6);
  
  
  --先取出自动指标 指标分数 从 LKB523 中取出  
  PG2_LKB523.tb00_list_01_12(replace(p_bt,'-',''),replace(p_et,'-',''),a_cur);   
  
  
  
  --求钱
  insert into TB2_LKB591 ( id,fl,  t01  )   ( select  130,100, '奖金'   from dual  );
  insert into TB2_LKB591 ( id,fl,  t01 ,t02,t03,t04,t05,t06,t07,t08,t09,
  t10,t11, t12, t13, t14, t15, t16, t17, t18, t19, t20,
  t31,t32,t33,t34,t35,t36,t37,t38 , t51 , t52 ) 
  (select  130 as id, 105 as fl, '站点' as t01, '站点ID' as t02, '班组' as t03, '班组ID' as t04, 
	'姓名' as t05, '职务' as t06, '个人工分' as t07, '班组系数' as t08, '个人系数' as t09, 
	'基础得分' as t10, '个人得分' as t11, '分值奖金' as t12, '指标奖金' as t13, 
	'生产考核' as t14, '工艺考核' as t15, '考核总数' as t16, '考核返还' as t17,
	 '个人考核' as t18, '出勤考核' as t19, '奖金预算' as t20, 
	 '生产考核' as t31, '生产承担比例'  as t32, 
	 '工艺考核' as t33, '生产承担比例'  as t34, 
	 '生产科室考核' as t35, '生产科室承担比例'  as t36, 
	 '工艺科室考核' as t37, '工艺科室承担比例'  as t38 , '个人考核分'  as t51 ,'个人系数得分'  as t52  
      from dual  );
			
			
	 
  
  insert into TB2_LKB591 (id,fl,  t01 ,t02,t03,t04,t05,t06,t07, t08,
	t10,t51,
  t31,t32,t33,t34,t35,t36,t37,t38 ) 
  ( select  130,110,t.t01,t.t02,t.t03,t.t04,t.t05,t.t06,t.t07, 1, -- 班组系数已经在分中加上，此处不加 t.t41,
  t.t30 ,  t29,
	
  (tb.t31-tb.t33-tb.t35-tb.t37),--P3班长-生产考核 （除工艺外其它类）	0.13	A2444
  nvl((select (t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2444'),0.08) ,
	tb.t33,--P3班长-工艺考核	0.13	A2443
  nvl((select (t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2443'),0.08) ,
	tb.t35,--P3班长-科室生产考核	0.13	A2442
  nvl((select (t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2442'),0.08) ,
	
	tb.t37,  --P3班长-科室工艺考核	0.13	A2441
  nvl((select (t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2441'),0.08)   
	
	 
  from TB2_LKB591 t   left join 
	
	( select t.khzdid t02, t.khbbid t04,  sum(t.khje+t.khje2) t31 ,  --总考核 (生产类+ 其它三类)
      sum(case when t.khflid=2406 then (t.khje+t.khje2) else 0 end ) t33, -- 工艺考核	
      sum(case when t.khflid=12823 then (t.khje+t.khje2) else 0 end ) t35, -- 生产科室考核
      sum(case when t.khflid=12826 then (t.khje+t.khje2) else 0 end ) t37  -- 工艺科室考核
			from tb2_lkb596 t  where  t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','')
         and t.ifbzman=1 and t.ifseng=0 and t.ifdel=0 and t.khgz in('P3','P9' )
				      group by t.khzdid, t.khbbid ) tb 
	
	
  --(select ta.t02,ta.t04,ta.t31,ta.t32,ta.t33  from TB2_LKB591 ta where ta.id=110 and ta.fl=110) tb 
  on t.t02=tb.t02 and t.t04=tb.t04   
  where t.id=120 and t.fl=110   );
   
	
  update TB2_LKB591 t set  
	
	  t.t09=round(t.t07*t.t08,10), t.t52=round(t.t10*t.t07*t.t08,10) , 
		 t.t11=round(t.t10*t.t07*t.t08,10)+t.t51 , 
   t.t14=round(t.t31*t.t32+t.t35*t.t36,10),t.t15=round(t.t33*t.t34+t.t37*t.t38,10),
	 t.t16=nvl(round(t.t31*t.t32+t.t35*t.t36+t.t33*t.t34+t.t37*t.t38 ,10),0)
  where t.id=130 and t.fl=110 ;
    
  
  
  --考核返还
  --个人考核  ,出勤考核
  update TB2_LKB591 t set 
  t.t17=nvl((t.t16-(select round(sum(ta.t16)/12,10)  from TB2_LKB591 ta where ta.id=130 and ta.fl=110 )),0) ,
  t.t18=nvl(( select nvl(sum(ta.khje+ta.khje2),0) tc from tb2_lkb596 ta where  ta.ifbzman=2 and ta.ifseng=0 and 
  ta.khdt between replace(p_bt,'-','') and replace(p_et,'-','')  and ta.ifdel=0 and ta.khgz in ('P3','P9') 
  and ta.man=t.t05 /*and ta.khbbid=t.t04 and ta.khzdid=t.t02 */    ),0),
  t.t19=nvl(( select nvl(sum(ta.kh21),0) tc from   tb2_lkb522 ta  where ta.ifdel=0 
  and  ta.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')   and ta.khname =t.t05 ),0)   
  where t.id=130 and t.fl in (110 ) ; 
  
  
  
  --车间合计  
  insert into TB2_LKB591  (id,fl,  t01 ,t02,t03,t04, t11, t14, t15, t16,t17,t18,t19 ) 
  ( select  130,130,'车间',20,'合计',5, sum(t.t11),sum(t.t14),sum(t.t15),sum(t.t16),sum(t.t17),sum(t.t18),sum(t.t19)   
  from TB2_LKB591 t
   where id=130 and fl=110  )  ;
  
  --车间P3班长总钱
  update TB2_LKB591 t set 
  t.t07=((select sum(ta.t07)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t08=((select sum(ta.t08)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t09=((select sum(ta.t09)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t10=((select sum(ta.t10)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t11=((select sum(ta.t11)  from TB2_LKB591 ta where  ta.id=130 and ta.fl=110 )) ,
  t.t13=nvl((select ta.moneyd  from tb2_lkb597 ta 
                    where ta.ifdel=0 and ta.gz='P3班长' and substr(ta.dtime,1,6) =v_dt ),10000)
  where t.id=130 and t.fl=130 ; 
  
  --车间P3班长 分值 
  update TB2_LKB591 t set 
  t.t12=(select round(ta.t13/ta.t11,10)  from TB2_LKB591 ta where ta.id=130 and ta.fl=130 )
  where t.id=130 and t.fl in (110,120,130) ; 
  
  --指标奖金
  update TB2_LKB591 t set t.t13=round(t.t11*t.t12,10)  where t.id=130 and t.fl in (110) ; 
  
  -- 奖金预算
  update TB2_LKB591 t set t.t20=t.t13+t.t17+t.t18+t.t19 where t.id=130 and t.fl in (110 ) ; 
  
	
  update TB2_LKB591 t set    
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990'))
  where  t.id in (130 ) and t.fl in (110,120,130);
		 
	
  --分机座小计 
  insert into TB2_LKB591  (id,fl,  t01 ,t02,t03,t04, t11,t12,t13, t14, t15, t16,t17,t18,t19,t20  ) 
  ( select 130,120,t.t01,t.t02,'小计',5, sum(t.t11),avg(t.t12), sum(t.t13), sum(t.t14), sum(t.t15), sum(t.t16) ,
  sum(t.t17),sum(t.t18),sum(t.t19) ,sum(t.t20)   from TB2_LKB591 t where id=130 and fl=110 group by t.t01,t.t02 )   ;
  
  update TB2_LKB591 t set 
  t.t20=(select sum(ta.t20) from TB2_LKB591 ta where ta.id=130 and ta.fl=110 )
  where t.fl=130 and t.id=130 ;
  
   
  update TB2_LKB591 t set   
  t.t07=trim(to_char(trunc(nvl(t.t07,0), 2),'99999990.99')),
  t.t08=trim(to_char(trunc(nvl(t.t08,0), 2),'99999990.99')),
  t.t09=trim(to_char(trunc(nvl(t.t09,0), 2),'99999990.99')),
  t.t11=trim(to_char(trunc(nvl(t.t11,0), 2),'99999990.99')),
  t.t12=trim(to_char(trunc(nvl(t.t12,0), 2),'99999990.99')),
  t.t13=trim(to_char(trunc(nvl(t.t13,0), 2),'99999990.99')),
  t.t14=trim(to_char(trunc(nvl(t.t14,0), 2),'99999990.99')),
  t.t15=trim(to_char(trunc(nvl(t.t15,0), 2),'99999990.99')),
  t.t16=trim(to_char(trunc(nvl(t.t16,0), 2),'99999990.99')),
  t.t17=trim(to_char(trunc(nvl(t.t17,0), 2),'99999990.99')),
  t.t18=trim(to_char(trunc(nvl(t.t18,0), 2),'99999990.99')),
  t.t19=trim(to_char(trunc(nvl(t.t19,0), 2),'99999990.99')),
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 2),'99999990.99')),
  t.t52=trim(to_char(trunc(nvl(t.t52,0), 2),'99999990.99'))
  where  t.id in (130,120) and t.fl in (110,120,130);
	
	
  
  update TB2_LKB591 t set   
  t.t21=trim(to_char(trunc(nvl(t.t21,0), 2),'99999990.99')),
  t.t22=trim(to_char(trunc(nvl(t.t22,0), 2),'99999990.99')),
  t.t23=trim(to_char(trunc(nvl(t.t23,0), 2),'99999990.99')),
  t.t30=trim(to_char(trunc(nvl(t.t30,0), 2),'99999990.99')),
  t.t31=trim(to_char(trunc(nvl(t.t31,0), 2),'99999990.99')),
  t.t34=trim(to_char(trunc(nvl(t.t34,0), 2),'99999990.99')),
  t.t35=trim(to_char(trunc(nvl(t.t35,0), 2),'99999990.99'))
  where  t.id in (120) and t.fl in (110,120,130);
  
	
	
	--个人奖金只要整数
  update TB2_LKB591 t set    
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990'))
  where  t.id in (130 ) and t.fl in (110,120,130);
	
	 
	
  update TB2_LKB591 t set    
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990.00'))
  where  t.id in (130 ) and t.fl in (110,120,130);
   
  
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_02_12;



  --P3班长 奖金 更新到人员维护表中
  PROCEDURE tb00_list_03(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间 
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_fldm:='LKB521'; 
  v_dt:=substr(replace(p_et,'-',''),1,6);
  
  
  --先取出自动指标 指标分数 从 LKB523 中取出  
  PG2_LKB523.tb00_list_02(replace(p_bt,'-',''),replace(p_et,'-',''),a_cur);   
  
	
	--根据查询结果,更新人员名单表中的奖金预算值 
	update TB2_LKB599 t set 
	/*t.moneya=t.moneya+nvl((select tb.t20 from  TB2_LKB591 tb where tb.t02=t.khzdid and */
  t.moneya=nvl((select (tb.t20+100) from  TB2_LKB591 tb where tb.t02=t.khzdid and 
	              tb.t04=t.khbzid and tb.t05=t.khman and (tb.id in (130 ) and tb.fl in (110 ) ) ),0),
	t.personal_score=(   select   tb.t52    from  TB2_LKB591 tb 
     where tb.t02=t.khzdid and  tb.t04=t.khbzid and tb.t05=t.khman and (tb.id in (130 ) and tb.fl in (110 ))  ),
  t.personal_buckle=(   select   (tb.t17 + tb.t18  + tb.t300)   from  TB2_LKB591 tb 
     where tb.t02=t.khzdid and  tb.t04=t.khbzid and tb.t05=t.khman and (tb.id in (130 ) and tb.fl in (110 ))  ),
  t.personal_attrition = (   select  tb.t19   from  TB2_LKB591 tb 
     where tb.t02=t.khzdid and  tb.t04=t.khbzid and tb.t05=t.khman and (tb.id in (130 ) and tb.fl in (110 ))  )
  where t.ifdel=0 and t.dt=v_dt 
  and t.khman in (select ta.t05 from  TB2_LKB591 ta where (ta.id in (130 ) and ta.fl in (110 ) ) ) ;
	
	
	
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;
 


  end tb00_list_03;




  --P3班长  检查数据用
  PROCEDURE tb00_list_04(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间 
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    v_bt varchar2(30);
    v_et varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_fldm:='LKB521'; 
  v_dt:=substr(replace(p_et,'-',''),1,6);
  v_bt:=(replace(p_et,'-',''));
  v_et:=(replace(p_et,'-',''));
  delete TB2_LKB591 ;
  
  
  --先取出自动指标 指标分数 从 LKB523 中取出  
   PG2_LKB523.tb00_list_02(replace(p_bt,'-',''),replace(p_et,'-',''),a_cur);   
  
	  
	
  commit;
  
  
  OPEN P_CUR FOR
  
  select * from TB2_LKB591 t order by t.id,t.fl ;
 
/*
    select rownum id,t.* from (
    select t01 as "站点", t03 as "班组", t05 as "P3班长" ,t06 as  "职务",
		t07 as "个人工分",t08 as "班组系数",     t09 as "个人系数", 
		
    t51 as "个人考核分",      t52 as "个人得分",  	 
		
    t11 as "个人总分",t12 as "分值奖金",t13 as "指标奖金",t14 as "生产考核",t15 as "工艺考核",t16 as "考核总数",
    t17 as "考核返还",t18 as "个人考核",t19 as "出勤考核",t20 as "奖金预算" 
     from TB2_LKB591 t  
    where t.id=130  and fl in (110,120,130)
    order by   t02,t04 ) t;
*/


  end tb00_list_04;







  /*指标,*/
  PROCEDURE tb01_list(P_CUR OUT V_CUR) as
  BEGIN 
    OPEN P_CUR FOR
    
    select rownum id,t2.* from (
  select   t .t01 as "站点", t .t03 as "班组", t .t05 as "P3班长" ,
   t .t11 as "产量" , t .t12 as "废品" ,t .t13 as  "粗轧" , t .t14 as  "中轧" ,t .t15 as "精轧" ,t .t16 as "收得率" ,
   t.t17 as "开机对接成功率" , t .t18 as  "新品优质率" , t .t19 as "断流" ,t .t20 as "工艺违规" ,t .t21 as "不配合" ,
   t.t22 as "普钢中包龄" ,t23 as "非计划停机" ,t24 as "成本" ,t .t25 as "微伤" ,t .t26 as "轻伤" ,t .t27 as "重伤",
	 t.t34 as "恒拉速"  ,	 t.t35 as "低液面接的上"    ,	 t.t36 as "低液面接不上"  ,
   /*nvl(t1.ZPQFL,0)*/T.T39 as "铸柸切废量"
     from TB2_LKB591 t  
     --left join TB2_LKB522_TEMP  t1   on t .t03 = t1.group_cd and t .t01 = t1.type
    where t.id=110 and fl in (110,115,120)
    order by   t02,t04 ) t2;
      
    
  end tb01_list;
  
  
  /*分数,*/
  PROCEDURE tb02_list(P_CUR OUT V_CUR) as
  BEGIN 
    OPEN P_CUR FOR
    
    select rownum id,t.* from (
    select t01 as "站点", t03 as "班组", t05 as "P3班长" ,
    t11 as "产量",t12 as "废品",t13 as "轧钢退废",t14 as "收得率",
    t15 as "开机对接成功率",t16 as "新品优质率",t17 as "断流",t18 as "工艺违规",t19 as "不配合试验工作",
    t20 as "普钢中包龄",t21 as  "非计划停机",t22 as "普钢成本",t23 as "安全", 		
	  t11+t12+t13+t14+t15+t16+t17+t18+t19+t20+t21+t22+t23+t39+t34+t35
  /*  t31*/  as "无考核总分",
	  t41 as "台上难度系数",
	  t28 as "班组考核分",
    t11+t12+t13+t14+t15+t16+t17+t18+t19+t20+t21+t22+t23+t39+t34+t35+t28				
		/*t30 */ as "总分"  
    ,t34 as "恒拉速"   ,t35 as "低液面"  ,
    /*nvl(t1.DF,0)*/T39 as "铸柸切废量"
     from TB2_LKB591 t  
   -- left join TB2_LKB522_TEMP  t1 on t .t03 = t1.group_cd and t .t01 = t1.type
    where t.id=120  and t.fl in (110,115,120,130)
    order by   t02,t04 ) t;
      
  end tb02_list;
  
  
  /*奖金,*/
  PROCEDURE tb03_list( P_CUR OUT V_CUR) as
/*            V_JJ1_W  varchar2(20);     
            V_JJ_W  varchar2(20);

            V_KHZF_W varchar2(20); 
            V_KHZF1_W varchar2(20);*/
 BEGIN 
  
 
      OPEN P_CUR FOR
    select rownum id,t.* from (
    select t01 as "站点", t03 as "班组", t05 as "P3班长" ,t06 as  "职务",
		t07 as "个人工分",t08 as "班组系数",     t09 as "个人系数", 
    
		    t51 as "个人考核分",  
        --/* t52 + nvl(t2.DF,0) */ ( t1.zbzf  + nvl(t2.DF,0) )*t09 
        t11 as "个人得分", 
         	 
		    T52/*t1.zbzf  + nvl(t2.DF,0)*/   as "个人总分",
        
        T12/* t1.zbjj/(t1.zbzf  + nvl(t2.DF,0)) */ as "分值奖金",   
        
        T13 /* t1.zbjj */  as "指标奖金",
        t14 as "生产考核",t15 as "工艺考核",t16 as "考核总数",
    t17 as "考核返还",t18 as "个人考核",t19 as "出勤考核",
    T20/*t1.zbjj + t17 +t18 +  t19*/  as "奖金预算"  ,
    t300 as "满勤奖",t301 as "最终合计"
    
     from TB2_LKB591 t  
        -- left join TB2_LKB522_JJTEMP  t1  on t .t03 = t1.group_cd  and t.t01 = t1.zd
        -- left join TB2_LKB522_TEMP  t2  on t .t03 = t2.group_cd 
    where t.id=130  and fl in (110,120,130)
    order by   t02,t04 ) t;
      
      
  end tb03_list;
 



  /*AAAAA,*/
  PROCEDURE test (P_CUR OUT V_CUR) as
	a_CUR   V_CUR;
		v_bt  varchar2(30);
		v_et  varchar2(30);
  BEGIN 
		v_bt:='20141201';
		v_et:='20141231'; 
    tb00_list_02(v_bt,v_et,a_CUR); 
		
		delete tb2_lkb591_test;
		/*insert into tb2_lkb591_test
		(select * from tb2_lkb591)
		;*/
		commit;
		
    OPEN P_CUR FOR
		select * from
			tb2_lkb591_test
			;
  end test;
 
  

  /*AAAAA,*/
  PROCEDURE AAA(P_CUR OUT V_CUR) as
  BEGIN 
    SGLGZB.P_CALL('pg2_cos100', 'AAA'); 
    OPEN P_CUR FOR
      select sysdate from dual ;  
  end AAA;
 

 END PG2_LKB523;
 
 
 
/
