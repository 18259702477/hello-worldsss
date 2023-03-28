CREATE OR REPLACE PACKAGE PG2_LKB525 IS
-- 
TYPE V_CUR IS REF CURSOR;
 
   
  
  PROCEDURE tb00_list_01(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) ;
	
  PROCEDURE tb00_list_01_04(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) ;
	
  PROCEDURE tb00_list_01_12(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) ;
  PROCEDURE tb00_list_02(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) ;
 


													
  PROCEDURE tb00_list_03(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间 
                          P_CUR OUT V_CUR) ;
													
													
	
  PROCEDURE tb00_test(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) ;
 
  PROCEDURE tb01_list (  P_CUR OUT V_CUR);
 
 
 
  PROCEDURE tb02_list(P_CUR OUT V_CUR);
  
  PROCEDURE tb03_list(P_CUR OUT V_CUR);
  
  PROCEDURE tb04_list(P_CUR OUT V_CUR);
  

  /*AAAAA,*/
  PROCEDURE AAA(P_CUR OUT V_CUR);
										     
END PG2_LKB525;

 
/
CREATE OR REPLACE PACKAGE BODY PG2_LKB525 IS
    
 -- [LKB525]-- 连铸之各班组考核表分奖金
 -- by xyz  
 --tb2_lkb522 考核录入表
 --  实体表 TB2_LKB　5　8　0      临时表 TB2_LKB　5　9　2
 

  -- 计算
  PROCEDURE tb00_list_01(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    v_bt varchar2(30);
    v_et varchar2(30);
    v_zd varchar2(30);
    v_bz varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN
  
	
  tb00_list_01_04(replace(p_bt,'-',''),replace(p_et,'-',''),20,p_bz,a_cur);  
   
  
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_01;



  -- 计算  四个班组 不分机座 的计算 
  PROCEDURE tb00_list_01_04(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    v_bt varchar2(30);
    v_et varchar2(30);
    v_zd varchar2(30);
    v_bz varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_fldm:='LKB526'; 
  v_dt:=substr(replace(p_et,'-',''),1,6);
  v_bt:=substr(replace(p_bt,'-',''),1,8);
  v_et:=substr(replace(p_et,'-',''),1,8);
  if p_zd <20 then 
  v_zd:=p_zd;
  end if ;
  
  if p_bz < 5 then 
  v_bz:=p_bz;  
  end if ;
  
  
  
  
  
  delete TB2_LKB592 ; 
	
	
	--成员基础分 每天都有基础分 要X天数 为 总基础分
	
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  99,99, 'P3P9基础分'   from dual  );
  insert into TB2_LKB592 ( id,fl,  t01  )   
	( select  99,98, nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB526' and t.sbbdm='C1201'),0)   from dual  );
	

	
 
	
  --先取出自动 每机每班 的P3班长 指标,分数 从 LKB523 中取出  
    
  PG2_LKB523.tb00_list_01_04(replace(p_bt,'-',''),replace(p_et,'-',''),a_cur);       
  
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  100,100, 'P3班长分数'   from dual  );
  
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10 ,t60 )
  ( select  100, fl,  t01, t02, t03, t04, t05, t06, t07, t08, t09, t30 ,rownum
    from (select  fl,  t01, t02, t03, t04, t05, t06, t07, t08, t09, t30   from tb2_lkb591 t 
    where t.id in (120) order by t.t02,t.t04 ) t );
  
  --根据P3班长分数,P3,P9本班总人数 区分各班总钱
  
  
   
    
      
   insert into  TB2_LKB592 ( id,fl,  t01  )   ( select  110,50, 'P3P9个人系数汇总'   from dual );
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10 ,  t11 )
  ( select  110,60,  '站点','zdid','bz' ,'bzid', 'name' as t05 , '工种' as t06 , '职务' as t07 ,
  '个人工分' as t08,  '职务系数' as t09, '班组系数' as t10 ,'最后系数' as t11 from dual );
   
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10 ,  t11 )
  ( select   110,70,      tman.khzd,tman.khzdid,tman.khbz,tman.khbzid,tman.khman,tman.khgz,tman.khzw,tman.khgf,
  (case when tman.khzw='主浇工' then C1101.A*1 else 1 end ) ,
  (case --班组系数
    when tman.khzdid=11 and tman.khbzid=1 then  B1101.A*1  when tman.khzdid=11 and tman.khbzid=2 then  B1102.A*1 
    when tman.khzdid=11 and tman.khbzid=3 then  B1103.A*1  when tman.khzdid=11 and tman.khbzid=4 then  B1104.A*1  
    when tman.khzdid=12 and tman.khbzid=1 then  B1201.A*1  when tman.khzdid=12 and tman.khbzid=2 then  B1202.A*1 
    when tman.khzdid=12 and tman.khbzid=3 then  B1203.A*1  when tman.khzdid=12 and tman.khbzid=4 then  B1204.A*1      
    when tman.khzdid=13 and tman.khbzid=1 then  B1301.A*1  when tman.khzdid=13 and tman.khbzid=2 then  B1302.A*1 
    when tman.khzdid=13 and tman.khbzid=3 then  B1303.A*1  when tman.khzdid=13 and tman.khbzid=4 then  B1304.A*1 
    else 1 end ) ,
   11
   from 

   (select rownum id, t.khzd,t.khzdid,t.khbz,t.khbzid,t.khman,t.khgz, t.khzw,t.khgf  
      from ( select t.khzd,t.khzdid,t.khbz,t.khbzid,t.khman,t.khgz, t.khzw,t.khgf  
    from tb2_lkb599 t   where t.ifdel=0  and t.dt=v_dt and t.khgz in ('P3','P9') and t.khzdid in (11,12,13) and 
    (t.khzw not in ('班长') or t.khzw is null ) order by t.khzdid,t.khbzid,t.khgz,t.khzw,t.khman ) t ) tman , 

    
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1101') B1101,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1102') B1102,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1103') B1103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1104') B1104,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1201') B1201,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1202') B1202,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1203') B1203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1204') B1204,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1301') B1301,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1302') B1302,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1303') B1303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1304') B1304,  
  
  (select nvl(t.khje,1.2) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='C1101') C1101 )
  
  ;
   
  update TB2_LKB592 t set t.t11=t.t08*t.t09*t.t10 where t.id=110 and t.fl=70 ; 
   
   
   --12班分钱
   
   
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  110,100, 'P3班组奖金分配'   from dual  );
  
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10 ,
  t11, t12, t13, t14, t15, t16, t17, t18  ,t31,t32,t33,t34,t35,t36,t37,t38 ,
	t41,t42,t43,t44,t45,t46, 	 t60)
  ( select  110,fl,  t01, t02, t03, t04, 'P3人数' as t05 ,'P9人数' as t06,'班组总人数' as t07,
  '班组分数' as t08,'班组总分数' as t09,'分值' as t10,  '奖金预算' as t11,
	'生产考核' as t12,'工艺考核' as t13,'考核总数' as t14,  '考核返还' as t15,
	
	'班组奖金' as t16,'P3奖金' as t17,'P9奖金'  as t18 ,
 --  '班组总生产考核' as t21,'班组总工艺考核' as t22,'班组总考核总数' as t23,'班组承担比例' as t24,
	
	 '生产考核' as t31, 'P3班长-生产承担比例'  as t32, 
	 '工艺考核' as t33, 'P3班长-生产承担比例'  as t34, 
	 '生产科室考核' as t35, 'P3班长-生产科室承担比例'  as t36, 
	 '工艺科室考核' as t37, 'P3班长-工艺科室承担比例'  as t38 ,
	 
	 
	 '值班正主任-科室生产考核' AS T41 ,
	 '(台上)值班副主任-科室生产考核' AS T42,
	 '(台下)值班副主任-科室生产考核' AS T43,
	 
	 '值班正主任-科室工艺考核' AS T44,	 
	 '(台上)值班副主任-科室工艺考核' AS T45,
	 '(台下)值班副主任-科室工艺考核' AS T46,
	  

	
	'PXID' as t60
   from TB2_LKB592 t where t.id in (100) and t.fl=105 );
   
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04,t05, t06, /*t07,*/ t08 , 
	t31,t32,t33,t34,t35,t36,t37,t38 , t41,t42,t43,t44,t45,t46, t60 )
  ( select  110,t.fl,  t.t01, t.t02, t.t03, t.t04, 
   tman.p3,tman.p9,/*tman.pall, */   t.t10   ,
	 
	 /*
   nvl(tkh.t31,0),nvl(tkh.t32,0),nvl(tkh.t33,0),    
   --考核比例
  (1-nvl((select sum(t.khje) a from tb2_lkb598 t where t.ifdel=0 
  and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm in ( 'A2403', 'A2404', 'A2405' ) ),0.31 )*1),
  */
	
	
  (nvl(tkh.t31,0)-nvl(tkh.t33,0)-nvl(tkh.t35,0)-nvl(tkh.t37,0)),--P3班长-生产 （除工艺外其它类）	0.13	A2444
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2444'),0.08) ,
	nvl(tkh.t33,0),--P3班长-工艺	0.13	A2443
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2443'),0.08) ,
	nvl(tkh.t35,0),--P3班长-科室生产考核	0.13	A2442
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2442'),0.08) ,	
	nvl(tkh.t37,0),  --P3班长-科室工艺考核	0.13	A2441
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2441'),0.08) ,
	
	
		/*
	
	值班正主任-科室生产考核	0.13	A2412
	(台上)值班副主任-科室生产考核	0.13	A2422
	(台下)值班副主任-科室生产考核	0.13	A2432 
	
		值班正主任-科室工艺考核	0.13	A2411
	(台上)值班副主任-科室工艺考核	0.13	A2421
	(台下)值班副主任-科室工艺考核	0.13	A2431
	
	  */
		
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2412'),0.08) t41,
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2422'),0.08) t42,
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2432'),0.08) t43,
	
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2411'),0.08) t44,
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2421'),0.08) t45,
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2431'),0.08) t46,
	

	
	
  t.id
   
   from  (select rownum id,fl,t01, t02, t03, t04,t10 from    
   ( select t.fl,t01, t02, t03, t04,t10 from  TB2_LKB592 t  where t.id in (100) and t.fl>=110 order by t.t02,t.t04 ) t )t
   
   left join (  select t.t02 tt02, t.t04 tt04 ,  sum(case when t.t06='P3' then t.t11*1 else 0 end ) p3, 
    sum(case when t.t06='P9' then t.t11*1 else 0 end ) p9,  sum(t.t11*1) pall  from TB2_LKB592 t 
    where t.id=110  and t.fl=70    group by t.t02 , t.t04 ) tman on tman.tt02=t.t02 and tman.tt04=t.t04
   
	 left join ( select t.khzdid t02, t.khbbid t04,  sum(nvl(t.khje,0)+nvl(t.khje2,0)) t31 ,  --总考核 (生产类+ 其它三类)
      sum(case when t.khflid=2406 then (nvl(t.khje,0)+nvl(t.khje2,0)) else 0 end ) t33, -- 工艺考核	
      sum(case when t.khflid=12823 then (nvl(t.khje,0)+nvl(t.khje2,0)) else 0 end ) t35, -- 生产科室考核
      sum(case when t.khflid=12826 then (nvl(t.khje,0)+nvl(t.khje2,0)) else 0 end ) t37  -- 工艺科室考核
			from tb2_lkb596 t  where  t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','')
         and t.ifbzman=1 and t.ifseng=0 and t.ifdel=0 and t.khgz in('P3','P9' )
				      group by t.khzdid, t.khbbid ) tkh on tkh.t02=t.t02 and tkh.t04=t.t04
    /*  
   left join ( select nvl(t.khzdid,20) khzdid,nvl(t.khbbid,5) khbzid, sum(t.khje+t.khje2) t33 ,  
      sum(case when t.khflid=2396 then (t.khje+t.khje2) else 0 end ) t31,
      sum(case when t.khflid=2406 then (t.khje+t.khje2) else 0 end ) t32 from tb2_lkb596 t   
      where  t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','')
			 and t.khbbid is not null and t.khzdid is not null
      and t.ifbzman=1 and t.ifseng=0 and t.ifdel=0 and t.khgz in ('P3','P9')
      group by cube(t.khbbid,t.khzdid) )  tkh on tkh.khzdid=t.t02 and tkh.khbzid=t.t04 */
     )   ;
   
   update TB2_LKB592  t set 
   t.t07=t.t06+t.t05 , t.t09=(t.t06+t.t05)*t.t08 ,
	 T.T12=T.T31*(1-T.T32) + t.t35*(1-t.t41-t.t42-t.t36) ,  -- -- 生产科室考核    车间考核总除工艺类的
	 T.T13=T.T33*(1-T.T34)+t.t37*(1-t.t44-t.t45-t.t38) ,
	 t.t14=T.T31*(1-T.T32) + t.t35*(1-t.t41-t.t42-t.t36)+T.T33*(1-T.T34)+t.t37*(1-t.t44-t.t45-t.t38)
   --t.t12=t.t22*t.t25 ,t.t13=t.t23*t.t25,t.t14=t.t24*t.t25
   where t.id = (110) and t.fl=110 ;
   
	 
   -- 分班组 不分机座 值 总计
	    
	 
   update TB2_LKB592  t set 
   t.t05= ( select sum(ta.t05) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t06= ( select sum(ta.t06) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t07= ( select sum(ta.t07) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  , 
   t.t12= ( select sum(ta.t12) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t13= ( select sum(ta.t13) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t14= ( select sum(ta.t14) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t15= ( select sum(ta.t15) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  
   where t.id = (110) and t.fl=115 ;
	    
	 --班组总分
   update  TB2_LKB592  t set t.t09=t.t08*t.t07    where t.id = (110) and t.fl=115 ;
	  
	 
	 
	 
   --总计值
   update TB2_LKB592  t set  
   t.t05= ( select sum(ta.t05) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t06= ( select sum(ta.t06) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t07= ( select sum(ta.t07) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t09= ( select sum(ta.t09) from TB2_LKB592 ta where ta.id=110 and ta.fl=115  )  ,
   t.t12= ( select sum(ta.t12) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t13= ( select sum(ta.t13) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t14= ( select sum(ta.t14) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t11=nvl((select ta.moneyd  from tb2_lkb597 ta
     where ta.ifdel=0 and ta.gz='P3-P9班组' and substr(ta.dtime,1,6) =v_dt ),10000)
   where t.id = (110) and t.fl=130 ;
   
	 
	 
	 
   --分值
   update TB2_LKB592  t set t.t10=  
   ( select  round(ta.t11/ta.t09,10 ) from TB2_LKB592 ta where ta.id=110 and ta.fl=130  ) 
    where t.id = (110) and t.fl>=110 ;
    
      
   --考核返还
   update TB2_LKB592  t set 
   t.t15= t.t14-( select  round(ta.t14/12,10 ) from TB2_LKB592 ta where ta.id=110 and ta.fl=130  )
   where t.id = (110) and t.fl=110 ;
	 
   update TB2_LKB592  t set 
   t.t15= ( select sum(ta.t15) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )   
   where t.id = (110) and t.fl=115 ;
      
   update TB2_LKB592  t set 
   t.t15= ( select sum(ta.t15) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )   
   where t.id = (110) and t.fl=130 ;
      
  
  
   update TB2_LKB592  t set 
   t.t11= round(t.t10*t.t09,10), t.t16=round(t.t10*t.t09+t.t15,10),
   t.t17=round((t.t10*t.t09+t.t15)*t.t05/t.t07,10),
   t.t18=round((t.t10*t.t09+t.t15)*t.t06/t.t07,10)
   where t.id = (110) and t.fl in (110,115) ;
  
  
   /*
  select t60 id, t01 as "站点", t02 as "站点ID", t03 as "班组", t04 as "班组ID", t05 as "P3人数", t06 as "P9人数", 
  t07 as "班组总人数", t08 as "班组分数", t09 as "班组总分数", t10 as "分值", t11 as "奖金预算", t12 as "生产考核", 
  t13 as "工艺考核", t14 as "考核总数", t15 as "考核返还", t16 as "班组奖金", t17 as "P3奖金", t18 as "P9奖金" 
    from TB2_LKB592 t where t.id=110 and t.fl>105 
    order by t60*1 ;
		*/
		
		
	 
  update TB2_LKB592 t set t.t60=rownum where t.id=110 and  t.fl>105;
   
 
  
   --3台机小计值 最后算
   update TB2_LKB592  t set 
   t.t05= ( select sum(ta.t05) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t06= ( select sum(ta.t06) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t07= ( select sum(ta.t07) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t09= ( select sum(ta.t09) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t11= ( select sum(ta.t11) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t12= ( select sum(ta.t12) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t13= ( select sum(ta.t13) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t14= ( select sum(ta.t14) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t15= ( select sum(ta.t15) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t16= ( select sum(ta.t16) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t17= ( select sum(ta.t17) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t18= ( select sum(ta.t18) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  
   where t.id = (110) and t.fl=120 ;
	 
  
	 
  
   update TB2_LKB592  t set  
   t.t16= ( select sum(ta.t16) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t17= ( select sum(ta.t17) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t18= ( select sum(ta.t18) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  
   where t.id = (110) and t.fl=130 ;
   
   
   
   
   ---指标情况
   
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  120,100, 'P3-9指标情况'   from dual  );
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,
  t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47,t60 )
  ( select  120,105, '站点','zdid','bz' ,'bzid', 'name' as t05 , '工种' as t06 , '职务' as t07 ,'个人工分' as t08,
  '中包对接,开浇控棒成功' as t11, '中包对接,开浇控棒失败' as t12, '更换浸入式(控棒)成功' as t13, 
  '更换浸入式(控棒)失败' as t14, '结晶器保护浇注,捞渣监控' as t15, '协助开浇,对接,更换浸入式水口' as t16, 
  '更换喷嘴' as t17, '准备流槽' as t18, '下线中包' as t19, '上线中包' as t20, '二冷室检查清理及保护' as t21, 
  '中包验收或烘烤及监控' as t22, '浸入式水口验收及烘烤' as t23, '准备保护渣成功' as t24, '准备保护渣失败' as t25, 
  '准备乙炔' as t26, '工具准备' as t27, '开浇,对接大包操作' as t28, '连浇大包主操' as t29, '中包排渣' as t30, 
  '油缸装卸成功' as t31, '油缸装卸失败' as t32, '操作机械手套卸大包套管成功' as t33, '操作机械手套卸大包套管失败' as t34,
   '烧大包水口' as t35, '大包领航成功' as t36, '大包领航失败' as t37, '大包原材料准备' as t38, 
   '更换溢流槽及杂物清理' as t39, '事故处理' as t40, '定置卫生' as t41, '设备点检及试车' as t42, 
   '对口交接班' as t43,'结晶器更换或上,下线' as t44,'不服从指令' as t45,'出勤考核' as t46,'个人考核' as t47,'排序ID' as t46
    from dual );
   
   
   
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,
  t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47, t60)
  (select 120,110,tman.khzd,tman.khzdid,tman.khbz,tman.khbzid,tman.khman,tman.khgz,tman.khzw,tman.khgf,
  nvl(t11,0),nvl(t12,0),nvl(t13,0),nvl(t14,0),nvl(t15,0),nvl(t16,0),nvl(t17,0),nvl(t18,0),nvl(t19,0),nvl(t20,0),
  nvl(t21,0),nvl(t22,0),nvl(t23,0),nvl(t24,0),nvl(t25,0),nvl(t26,0),nvl(t27,0),nvl(t28,0),nvl(t29,0),nvl(t30,0),
  nvl(t31,0),nvl(t32,0),nvl(t33,0),nvl(t34,0),nvl(t35,0),nvl(t36,0),nvl(t37,0),nvl(t38,0),nvl(t39,0),nvl(t40,0),
  nvl(t41,0),nvl(t42,0),nvl(t43,0),nvl(t44,0),nvl(t45,0),nvl(t46,0),  nvl(tb.tc,0),    id
  from   (select rownum id, t.khzd,t.khzdid,t.khbz,t.khbzid,t.khman,t.khgz, t.khzw,t.khgf  
      from ( select t.khzd,t.khzdid,t.khbz,t.khbzid,t.khman,t.khgz, t.khzw,t.khgf  
    from tb2_lkb599 t   where t.ifdel=0  and t.dt=v_dt and t.khzdid in (11,12,13) and t.khgz in ('P3','P9') 
    and (t.khzdid=v_zd or v_zd is null ) and ( t.khbzid =v_bz or v_bz is null  ) 
		and  (t.khzw not in ('班长') or t.khzw is null ) order by t.khzdid,t.khbzid,t.khgz,t.khzw,t.khman ) t ) tman
  left join (select t.khname ,sum(t.kh11) as t11,sum(t.kh12) as t12,sum(t.kh13) as t13,sum(t.kh14) as t14,
  sum(t.kh15) as t15,sum(t.kh16) as t16,sum(t.kh17) as t17,sum(t.kh18) as t18,sum(t.kh19) as t19,sum(t.kh20) as t20,
  sum(t.kh21) as t21,sum(t.kh22) as t22,sum(t.kh23) as t23,sum(t.kh24) as t24,sum(t.kh25) as t25,sum(t.kh26) as t26,
  sum(t.kh27) as t27,sum(t.kh28) as t28,sum(t.kh29) as t29,sum(t.kh30) as t30,sum(t.kh31) as t31,sum(t.kh32) as t32,
  sum(t.kh33) as t33,sum(t.kh34) as t34,sum(t.kh35) as t35,sum(t.kh36) as t36,sum(t.kh37) as t37,sum(t.kh38) as t38,
  sum(t.kh39) as t39,sum(t.kh40) as t40,sum(t.kh41) as t41,sum(t.kh42) as t42,sum(t.kh43) as t43,sum(t.kh44) as t44,
  sum(t.kh45) as t45,sum(t.kh46) as t46  from tb2_lkb522 t where t.khdmfl=v_fldm and t.ifdel=0 
  and (  t.khzdid = v_zd or v_zd is null ) and ( t.khbzid = v_bz or v_bz is null )
  and t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','') group by t.khname ) ta on tman.khman=ta.khname  
  left join ( select ta.man , nvl(sum(ta.khje+ta.khje2),0) tc from tb2_lkb596 ta where  ta.ifbzman=2 and ta.ifseng=0 and 
  ta.khdt between replace(p_bt,'-','') and replace(p_et,'-','')  and ta.ifdel=0 and ta.khgz in ('P3','P9') 
  group by ta.man  ) tb on tb.man=tman.khman  ) ;




   
  
   
   
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  130,100, 'P3-9得分情况'   from dual  );
  
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,
  t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47,t49,t50, t60 )
  ( select  130,105, '站点','zdid','bz' ,'bzid', 'name' as t05 , '工种' as t06 , '职务' as t07 ,
  '个人工分' as t08,  '职务系数' as t09, '班组系数' as t10,
  '中包对接,开浇控棒成功' as t11, '中包对接,开浇控棒失败' as t12, '更换浸入式(控棒)成功' as t13, 
  '更换浸入式(控棒)失败' as t14, '结晶器保护浇注,捞渣监控' as t15, '协助开浇,对接,更换浸入式水口' as t16, 
  '更换喷嘴' as t17, '准备流槽' as t18, '下线中包' as t19, '上线中包' as t20, '二冷室检查清理及保护' as t21, 
  '中包验收或烘烤及监控' as t22, '浸入式水口验收及烘烤' as t23, '准备保护渣成功' as t24, '准备保护渣失败' as t25, 
  '准备乙炔' as t26, '工具准备' as t27, '开浇,对接大包操作' as t28, '连浇大包主操' as t29, '中包排渣' as t30, 
  '油缸装卸成功' as t31, '油缸装卸失败' as t32, '操作机械手套卸大包套管成功' as t33, '操作机械手套卸大包套管失败' as t34,
   '烧大包水口' as t35, '大包领航成功' as t36, '大包领航失败' as t37, '大包原材料准备' as t38, 
   '更换溢流槽及杂物清理' as t39, '事故处理' as t40, '定置卫生' as t41, '设备点检及试车' as t42, 
   '对口交接班' as t43,'结晶器更换或上,下线' as t44,'不服从指令' as t45,'出勤考核' as t46,'个人考核' as t47,
	 '基础分' as t49,'个人总分' as t50,
    '排序ID' as t60 from dual );
   
   
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,
  t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47, t60 )
  (select 130, 110, t01, t02, t03, t04, t05, t06, t07, t08,  
  (case when t.t07='主浇工' then C1101.A*1 else 1 end ) ,
  (case --班组系数
    when t.t02=11 and t.t04=1 then  B1101.A*1  when t.t02=11 and t.t04=2 then  B1102.A*1 
    when t.t02=11 and t.t04=3 then  B1103.A*1  when t.t02=11 and t.t04=4 then  B1104.A*1  
    when t.t02=12 and t.t04=1 then  B1201.A*1  when t.t02=12 and t.t04=2 then  B1202.A*1 
    when t.t02=12 and t.t04=3 then  B1203.A*1  when t.t02=12 and t.t04=4 then  B1204.A*1      
    when t.t02=13 and t.t04=1 then  B1301.A*1  when t.t02=13 and t.t04=2 then  B1302.A*1 
    when t.t02=13 and t.t04=3 then  B1303.A*1  when t.t02=13 and t.t04=4 then  B1304.A*1 
    else 1 end ) ,
   
  
  
  t11*A1103.a,t12*A1203.a,t13*A1303.a,t14*A1403.a,t15*A1503.a,t16*A1603.a,t17*A1703.a,t18*A1803.a,t19*A1903.a,t20*A2003.a,
  t21*A2103.a,t22*A2203.a,t23*A2303.a,t24*A2403.a,t25*A2503.a,t26*A2603.a,t27*A2703.a,t28*A2803.a,t29*A2903.a,t30*A3003.a,
  t31*A3103.a,t32*A3203.a,t33*A3303.a,t34*A3403.a,t35*A3503.a,t36*A3603.a,t37*A3703.a,t38*A3803.a,t39*A3903.a,t40*A4003.a,
  t41*A4103.a,t42*A4203.a,t43*A4303.a,t44*A4403.a,t45*A4503.a ,t46 ,t47 , t60     from TB2_LKB592 t,  
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1103') A1103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1203') A1203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1303') A1303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1403') A1403,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1503') A1503,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1603') A1603,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1703') A1703,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1803') A1803,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1903') A1903,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2003') A2003,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2103') A2103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2203') A2203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2303') A2303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2403') A2403,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2503') A2503,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2603') A2603,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2703') A2703,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2803') A2803,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2903') A2903,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3003') A3003,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3103') A3103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3203') A3203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3303') A3303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3403') A3403,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3503') A3503,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3603') A3603,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3703') A3703,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3803') A3803,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3903') A3903,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4003') A4003,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4103') A4103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4203') A4203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4303') A4303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4403') A4403,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4503') A4503,
  
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1101') B1101,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1102') B1102,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1103') B1103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1104') B1104,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1201') B1201,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1202') B1202,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1203') B1203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1204') B1204,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1301') B1301,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1302') B1302,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1303') B1303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1304') B1304,  
  
  (select nvl(t.khje,1.2) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='C1101') C1101
  
   
   where t.id=120 and t.fl=110   );
   
   
	--基础分
  update  TB2_LKB592 t set 
  t.t49=nvl((select ta.t01  from TB2_LKB592 ta where ta.id=99 and ta.fl=98),0)
  where t.id=130 and t.fl=110 ;
	
	 
	 
  --计算每人总分 
  update  TB2_LKB592 t set 
  t.t50=(t11+t12+t13+t14+t15+t16+t17+t18+t19+t20+t21+t22+t23+t24+t25+t26+t27+t28+t29+t30
         +t31+t32+t33+t34+t35+t36+t37+t38+t39+t40+t41+t42+t43+t44+t45+t49)
  where t.id=130 and t.fl=110 ;
  
  
  
   --分钱
   
   
   
   
   
   
   
   
   
   
   
   
   --班组内分钱
   
   
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  140,100, 'P3-9奖金分配'   from dual  );
  
   
    
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21, t51,t52, t60,t300,t301 )
  ( select  140,105, '站点','zdid','bz' ,'bzid', 'name' as t05 , '工种' as t06 , '职务' as t07 ,
	'个人工分' as t08,   '职务系数' as t09, '班组系数' as t10,'个人初始得分' as t11, '个人总分' as t12,
  '本班本工种总分' as t13, '本班总钱' as t14, '本班本工种总钱' as t15, '分值' as t16,   '个人奖金预算' as t17, 
  '个人考核' as t18, '出勤考核' as t19, '个人实得奖金' as t20, '个人系数' as t21,
	'个人系数得分' as t51, '个人考核分数' as t52,	  '排序ID' as t60 ,'满勤奖' as t300 ,'最终合计' as t301  from dual );
   
  
  
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
	t11,t18,t19,t21,t60)
  ( select 140,110, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
	
	t50 as t11,t47 as t18,t46 as t19,
	
	
  --班组内不以职务，班组区分，只取个人工分
	--t.t08,
  round(t.t08*t.t09*t.t10,10),
	
	t60 from TB2_LKB592 t 
   where t.id=130 and t.fl=110 );
   
	 --本班总钱  不分机
  update TB2_LKB592 t set 
  t.t14=( select sum(ta.t16) from TB2_LKB592 ta where ta.t04=t.t04 and ta.id=110 and ta.fl=115 )   
  where t.id=140 and t.fl=110 ; 
	
	--'本班本工种总钱' 不分机	
  update TB2_LKB592 t set  
  t.t15=( select sum(ta.t17) from TB2_LKB592 ta where ta.t04=t.t04 and ta.id=110 and ta.fl=115 )   
  where t.id=140 and t.fl=110 and t.t06='P3'; 
	
  update TB2_LKB592 t set  
  t.t15=( select sum(ta.t18) from TB2_LKB592 ta where ta.t04=t.t04 and ta.id=110 and ta.fl=115 )   
  where t.id=140 and t.fl=110 and t.t06='P9' ; 
  
	
	------------ --班组内不以职务，班组区分，只取个人工分 
  update TB2_LKB592 t set t.t51=t.t21* t.t11 , 
		t.t52=(   select  nvl(sum(ta.khje),0) khje  from TB2_LKB594 ta 
     where ta.ifdel=0 and ta.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')   
		 and (ta.khzdid = t.t02 )	 and (ta.khbbid= t.t04) and (ta.khgz= 'P3' )  
		 and ta.ifbz='个人考核' and ta.ifbzid=11 and t.t05=ta.man		  )
	   where t.id=140 and t.fl=110   ; 
		 
  update TB2_LKB592 t set t.t12=t.t51+t.t52     where t.id=140 and t.fl=110   ; 
	 
	
	------------
	
	--本班本工种总分 不分机	
  update TB2_LKB592 t set 
  t.t13=( select sum(ta.t12) from TB2_LKB592 ta where ta.t04=t.t04 
  and ta.id=140 and ta.fl=110 and ta.t06=t.t06 ) 
   where t.id=140 and t.fl=110 ; 
   
   

  update TB2_LKB592 t set       
    t.t16= FN2_cushu0(t.t15,t.t13,10), -- 分值
    t.t17= round(FN2_cushu0(t.t15,t.t13,10)*t.t12,10), --个人钱
    t.t20= round(FN2_cushu0(t.t15,t.t13,10)*t.t12+t.t18+t.t19,10)  --个人最后钱
   where t.id=140 and t.fl=110 ; 
   
  update TB2_LKB592 t set
    t.t300= 100,     --满勤奖
    t.t301= t20+100  --最终合计
   where t.id=140 and t.fl=110 ; 
   
  insert into TB2_LKB592 ( id, fl,  t05 ,
  t08,t09,t10,t11,t12,t17,t18,t19,t20,t21,t60,t300,t301 )
  ( select 140,120,  '合计', 
  sum(ta.t08), sum(ta.t09), sum(ta.t10),sum(ta.t11),sum(ta.t12),
  sum(ta.t17),sum(ta.t18), sum(ta.t19), sum(ta.t20),sum(ta.t21), (max(ta.t60*1)+1) ,sum(ta.t300), sum(ta.t301)
  from TB2_LKB592 ta where ta.id=140 and ta.fl=110 ) ;
  
   

  update TB2_LKB592 t set       
    t.t14=(select sum(t.a) a from ( select avg(ta.t14) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110 group by ta.t02,ta.t04 )t ) , -- 本班总钱
    t.t15=(select sum(t.a) a from ( select avg(ta.t15) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110 group by ta.t02,ta.t04,ta.t06 )t ) --本班本工种总钱 ,
   where t.id=140 and t.fl=120 ; 
   
   /*
  update TB2_LKB592 t set
  t.t
  t01  as "站点", t02  as "zdid", t03  as "bz", t04  as "bzid", t05  as "name", 
  t06  as "工种", t07  as "职务", t08  as "个人工分", t09  as "职务系数", t10  as "班组系数", 
  t11  as "个人初始得分", t12  as "个人系数得分", t13  as "本班本工种总分", t14  as "本班总钱", 
  t15  as "本班本工种总钱", t16  as "分值", t17  as "个人奖金预算", t18  as "个人考核", 
  t19  as "出勤考核", t20  as "个人实得奖金" */
   
   
   
  update TB2_LKB592 t set   
  t.t08=trim(to_char(trunc(nvl(t.t08,0), 2),'99999990.99')),
  t.t09=trim(to_char(trunc(nvl(t.t09,0), 2),'99999990.99')),
  t.t10=trim(to_char(trunc(nvl(t.t10,0), 2),'99999990.99')),
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
  t.t21=trim(to_char(trunc(nvl(t.t21,0), 2),'99999990.99')),
  t.t301=trim(to_char(trunc(nvl(t.t301,0), 2),'99999990.99'))
  
  where  t.id in (140) and t.fl in (110,120,130);
	
	
	
	--个人奖金只要整数
  update TB2_LKB592 t set   
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990'))
  where  t.id in (140) and t.fl in (110,120,130);
  
  update TB2_LKB592 t set   
  t.t301=trim(to_char(trunc(nvl(t.t301,0), 0),'99999990'))
  where  t.id in (140) and t.fl in (110,120,130);
  
  update TB2_LKB592 t set   
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990.00'))
  where  t.id in (140) and t.fl in (110,120,130);
  
  update TB2_LKB592 t set   
  t.t301=trim(to_char(trunc(nvl(t.t301,0), 0),'99999990.00'))
  where  t.id in (140) and t.fl in (110,120,130);
  

	
  update TB2_LKB592 t set       
	 -- 车间总钱
  t.t20=(select (t.a) a from ( select sum(ta.t20) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110  )t ) ,
  t.t300=(select (t.a) a from ( select sum(ta.t300) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110  )t ) ,		
  t.t301=(select (t.a) a from ( select sum(ta.t301) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110  )t ) ,		
  t.t14=(select sum(t.a) a from ( select avg(ta.t14) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110 group by ta.t02,ta.t04 )t ) , -- 本班总钱
  t.t15=(select sum(t.a) a from ( select avg(ta.t15) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110 group by ta.t02,ta.t04,ta.t06 )t ) --本班本工种总钱 ,
   where t.id=140 and t.fl=120 ; 
	 
	 
  update TB2_LKB592 t set   
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990.00')),
  t.t301=trim(to_char(trunc(nvl(t.t301,0), 0),'99999990.00'))
  where  t.id in (140) and t.fl in (110,120,130);
	 
	
  
  update TB2_LKB592 t set   
  t.t05=trim(to_char(trunc(nvl(t.t05,0), 2),'99999990.99')),
  t.t06=trim(to_char(trunc(nvl(t.t06,0), 2),'99999990.99')),
  t.t07=trim(to_char(trunc(nvl(t.t07,0), 2),'99999990.99')),
  t.t08=trim(to_char(trunc(nvl(t.t08,0), 2),'99999990.99')),
  t.t09=trim(to_char(trunc(nvl(t.t09,0), 2),'99999990.99')),
  t.t10=trim(to_char(trunc(nvl(t.t10,0), 2),'99999990.99')),
  t.t11=trim(to_char(trunc(nvl(t.t11,0), 2),'99999990.99')),
  t.t12=trim(to_char(trunc(nvl(t.t12,0), 2),'99999990.99')),
  t.t13=trim(to_char(trunc(nvl(t.t13,0), 2),'99999990.99')),
  t.t14=trim(to_char(trunc(nvl(t.t14,0), 2),'99999990.99')),
  t.t15=trim(to_char(trunc(nvl(t.t15,0), 2),'99999990.99')),
  t.t16=trim(to_char(trunc(nvl(t.t16,0), 2),'99999990.99')),
  t.t17=trim(to_char(trunc(nvl(t.t17,0), 2),'99999990.99')),
  t.t18=trim(to_char(trunc(nvl(t.t18,0), 2),'99999990.99'))
  where  t.id in (110) and t.fl in (110,115,120,125,130);
  
   
   
   
   
   
   
   
   
  
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_01_04;



  -- 计算  十二个班组 不分机座 的计算 
  PROCEDURE tb00_list_01_12(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    v_bt varchar2(30);
    v_et varchar2(30);
    v_zd varchar2(30);
    v_bz varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_fldm:='LKB526'; 
  v_dt:=substr(replace(p_et,'-',''),1,6);
  v_bt:=substr(replace(p_bt,'-',''),1,8);
  v_et:=substr(replace(p_et,'-',''),1,8);
  if p_zd <20 then 
  v_zd:=p_zd;
  end if ;
  
  if p_bz < 5 then 
  v_bz:=p_bz;  
  end if ;
  
  
  
  
  
  delete TB2_LKB592 ; 
	
	
	--成员基础分 每天都有基础分 要X天数 为 总基础分
	
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  99,99, 'P3P9基础分'   from dual  );
  insert into TB2_LKB592 ( id,fl,  t01  )   
	( select  99,98, nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB526' and t.sbbdm='C1201'),0)   from dual  );
	

	
 
	
  --先取出自动 每机每班 的P3班长 指标,分数 从 LKB523 中取出  
    
  PG2_LKB523.tb00_list_01(replace(p_bt,'-',''),replace(p_et,'-',''),a_cur);       
  
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  100,100, 'P3班长分数'   from dual  );
  
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10 ,t60 )
  ( select  100, fl,  t01, t02, t03, t04, t05, t06, t07, t08, t09, t30 ,rownum
    from (select  fl,  t01, t02, t03, t04, t05, t06, t07, t08, t09, t30   from tb2_lkb591 t 
    where t.id in (120) order by t.t02,t.t04 ) t );
  
  --根据P3班长分数,P3,P9本班总人数 区分各班总钱
  
  
   
    
      
   insert into  TB2_LKB592 ( id,fl,  t01  )   ( select  110,50, 'P3P9个人系数汇总'   from dual );
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10 ,  t11 )
  ( select  110,60,  '站点','zdid','bz' ,'bzid', 'name' as t05 , '工种' as t06 , '职务' as t07 ,
  '个人工分' as t08,  '职务系数' as t09, '班组系数' as t10 ,'最后系数' as t11 from dual );
   
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10 ,  t11 )
  ( select   110,70,      tman.khzd,tman.khzdid,tman.khbz,tman.khbzid,tman.khman,tman.khgz,tman.khzw,tman.khgf,
  (case when tman.khzw='主浇工' then C1101.A*1 else 1 end ) ,
  (case --班组系数
    when tman.khzdid=11 and tman.khbzid=1 then  B1101.A*1  when tman.khzdid=11 and tman.khbzid=2 then  B1102.A*1 
    when tman.khzdid=11 and tman.khbzid=3 then  B1103.A*1  when tman.khzdid=11 and tman.khbzid=4 then  B1104.A*1  
    when tman.khzdid=12 and tman.khbzid=1 then  B1201.A*1  when tman.khzdid=12 and tman.khbzid=2 then  B1202.A*1 
    when tman.khzdid=12 and tman.khbzid=3 then  B1203.A*1  when tman.khzdid=12 and tman.khbzid=4 then  B1204.A*1      
    when tman.khzdid=13 and tman.khbzid=1 then  B1301.A*1  when tman.khzdid=13 and tman.khbzid=2 then  B1302.A*1 
    when tman.khzdid=13 and tman.khbzid=3 then  B1303.A*1  when tman.khzdid=13 and tman.khbzid=4 then  B1304.A*1 
    else 1 end ) ,
   11
   from 

   (select rownum id, t.khzd,t.khzdid,t.khbz,t.khbzid,t.khman,t.khgz, t.khzw,t.khgf  
      from ( select t.khzd,t.khzdid,t.khbz,t.khbzid,t.khman,t.khgz, t.khzw,t.khgf  
    from tb2_lkb599 t   where t.ifdel=0  and t.dt=v_dt and t.khgz in ('P3','P9') and t.khzdid in (11,12,13) and 
    (t.khzw not in ('班长') or t.khzw is null ) order by t.khzdid,t.khbzid,t.khgz,t.khzw,t.khman ) t ) tman , 

    
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1101') B1101,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1102') B1102,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1103') B1103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1104') B1104,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1201') B1201,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1202') B1202,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1203') B1203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1204') B1204,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1301') B1301,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1302') B1302,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1303') B1303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1304') B1304,  
  
  (select nvl(t.khje,1.2) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='C1101') C1101 )
  
  ;
   
  update TB2_LKB592 t set t.t11=t.t08*t.t09*t.t10 where t.id=110 and t.fl=70 ; 
   
   
   --12班分钱
   
   
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  110,100, 'P3班组奖金分配'   from dual  );
  
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08, t09, t10 ,
  t11, t12, t13, t14, t15, t16, t17, t18  ,t31,t32,t33,t34,t35,t36,t37,t38 ,
	t41,t42,t43,t44,t45,t46, 	 t60)
  ( select  110,fl,  t01, t02, t03, t04, 'P3人数' as t05 ,'P9人数' as t06,'班组总人数' as t07,
  '班组分数' as t08,'班组总分数' as t09,'分值' as t10,  '奖金预算' as t11,
	'生产考核' as t12,'工艺考核' as t13,'考核总数' as t14,  '考核返还' as t15,
	
	'班组奖金' as t16,'P3奖金' as t17,'P9奖金'  as t18 ,
 --  '班组总生产考核' as t21,'班组总工艺考核' as t22,'班组总考核总数' as t23,'班组承担比例' as t24,
	
	 '生产考核' as t31, 'P3班长-生产承担比例'  as t32, 
	 '工艺考核' as t33, 'P3班长-生产承担比例'  as t34, 
	 '生产科室考核' as t35, 'P3班长-生产科室承担比例'  as t36, 
	 '工艺科室考核' as t37, 'P3班长-工艺科室承担比例'  as t38 ,
	 
	 
	 '值班正主任-科室生产考核' AS T41 ,
	 '(台上)值班副主任-科室生产考核' AS T42,
	 '(台下)值班副主任-科室生产考核' AS T43,
	 
	 '值班正主任-科室工艺考核' AS T44,	 
	 '(台上)值班副主任-科室工艺考核' AS T45,
	 '(台下)值班副主任-科室工艺考核' AS T46,
	  

	
	'PXID' as t60
   from TB2_LKB592 t where t.id in (100) and t.fl=105 );
   
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04,t05, t06, /*t07,*/ t08 , 
	t31,t32,t33,t34,t35,t36,t37,t38 , t41,t42,t43,t44,t45,t46, t60 )
  ( select  110,t.fl,  t.t01, t.t02, t.t03, t.t04, 
   tman.p3,tman.p9,/*tman.pall, */   t.t10   ,
	 
	 /*
   nvl(tkh.t31,0),nvl(tkh.t32,0),nvl(tkh.t33,0),    
   --考核比例
  (1-nvl((select sum(t.khje) a from tb2_lkb598 t where t.ifdel=0 
  and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm in ( 'A2403', 'A2404', 'A2405' ) ),0.31 )*1),
  */
	
	
  (nvl(tkh.t31,0)-nvl(tkh.t33,0)-nvl(tkh.t35,0)-nvl(tkh.t37,0)),--P3班长-生产 （除工艺外其它类）	0.13	A2444
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2444'),0.08) ,
	nvl(tkh.t33,0),--P3班长-工艺	0.13	A2443
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2443'),0.08) ,
	nvl(tkh.t35,0),--P3班长-科室生产考核	0.13	A2442
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2442'),0.08) ,	
	nvl(tkh.t37,0),  --P3班长-科室工艺考核	0.13	A2441
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2441'),0.08) ,
	
	
		/*
	
	值班正主任-科室生产考核	0.13	A2412
	(台上)值班副主任-科室生产考核	0.13	A2422
	(台下)值班副主任-科室生产考核	0.13	A2432 
	
		值班正主任-科室工艺考核	0.13	A2411
	(台上)值班副主任-科室工艺考核	0.13	A2421
	(台下)值班副主任-科室工艺考核	0.13	A2431
	
	  */
		
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2412'),0.08) t41,
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2422'),0.08) t42,
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2432'),0.08) t43,
	
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2411'),0.08) t44,
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2421'),0.08) t45,
  nvl((select to_number(t.khje) a from tb2_lkb598 t 
  where t.ifdel=0 and t.khdt=v_dt and t.sbbfl='LKB522' and t.sbbdm='A2431'),0.08) t46,
	

	
	
  t.id
   
   from  (select rownum id,fl,t01, t02, t03, t04,t10 from    
   ( select t.fl,t01, t02, t03, t04,t10 from  TB2_LKB592 t  where t.id in (100) and t.fl>=110 order by t.t02,t.t04 ) t )t
   
   left join (  select t.t02 tt02, t.t04 tt04 ,  sum(case when t.t06='P3' then t.t11*1 else 0 end ) p3, 
    sum(case when t.t06='P9' then t.t11*1 else 0 end ) p9,  sum(t.t11*1) pall  from TB2_LKB592 t 
    where t.id=110  and t.fl=70    group by t.t02 , t.t04 ) tman on tman.tt02=t.t02 and tman.tt04=t.t04
   
	 left join ( select t.khzdid t02, t.khbbid t04,  sum(nvl(t.khje,0)+nvl(t.khje2,0)) t31 ,  --总考核 (生产类+ 其它三类)
      sum(case when t.khflid=2406 then (nvl(t.khje,0)+nvl(t.khje2,0)) else 0 end ) t33, -- 工艺考核	
      sum(case when t.khflid=12823 then (nvl(t.khje,0)+nvl(t.khje2,0)) else 0 end ) t35, -- 生产科室考核
      sum(case when t.khflid=12826 then (nvl(t.khje,0)+nvl(t.khje2,0)) else 0 end ) t37  -- 工艺科室考核
			from tb2_lkb596 t  where  t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','')
         and t.ifbzman=1 and t.ifseng=0 and t.ifdel=0 and t.khgz in('P3','P9' )
				      group by t.khzdid, t.khbbid ) tkh on tkh.t02=t.t02 and tkh.t04=t.t04
    /*  
   left join ( select nvl(t.khzdid,20) khzdid,nvl(t.khbbid,5) khbzid, sum(t.khje+t.khje2) t33 ,  
      sum(case when t.khflid=2396 then (t.khje+t.khje2) else 0 end ) t31,
      sum(case when t.khflid=2406 then (t.khje+t.khje2) else 0 end ) t32 from tb2_lkb596 t   
      where  t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','')
			 and t.khbbid is not null and t.khzdid is not null
      and t.ifbzman=1 and t.ifseng=0 and t.ifdel=0 and t.khgz in ('P3','P9')
      group by cube(t.khbbid,t.khzdid) )  tkh on tkh.khzdid=t.t02 and tkh.khbzid=t.t04 */
     )   ;
   
   update TB2_LKB592  t set 
   t.t07=t.t06+t.t05 , t.t09=(t.t06+t.t05)*t.t08 ,
	 T.T12=T.T31*(1-T.T32) + t.t35*(1-t.t41-t.t42-t.t36) ,  -- -- 生产科室考核    车间考核总除工艺类的
	 T.T13=T.T33*(1-T.T34)+t.t37*(1-t.t44-t.t45-t.t38) ,
	 t.t14=T.T31*(1-T.T32) + t.t35*(1-t.t41-t.t42-t.t36)+T.T33*(1-T.T34)+t.t37*(1-t.t44-t.t45-t.t38)
   --t.t12=t.t22*t.t25 ,t.t13=t.t23*t.t25,t.t14=t.t24*t.t25
   where t.id = (110) and t.fl=110 ;
      
   
   --总计值
   update TB2_LKB592  t set  
   t.t05= ( select sum(ta.t05) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t06= ( select sum(ta.t06) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t07= ( select sum(ta.t07) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t09= ( select sum(ta.t09) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t12= ( select sum(ta.t12) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t13= ( select sum(ta.t13) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t14= ( select sum(ta.t14) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t11=nvl((select ta.moneyd  from tb2_lkb597 ta
     where ta.ifdel=0 and ta.gz='P3-P9班组' and substr(ta.dtime,1,6) =v_dt ),10000)
   where t.id = (110) and t.fl=130 ;
   
	 
	 
	 
   --分值
   update TB2_LKB592  t set t.t10=  
   ( select  round(ta.t11/ta.t09,10 ) from TB2_LKB592 ta where ta.id=110 and ta.fl=130  ) 
    where t.id = (110) and t.fl>=110 ;
    
      
   --考核返还
   update TB2_LKB592  t set 
   t.t15= t.t14-( select  round(ta.t14/12,10 ) from TB2_LKB592 ta where ta.id=110 and ta.fl=130  )
   where t.id = (110) and t.fl=110 ;
   update TB2_LKB592  t set 
   t.t15= ( select sum(ta.t15) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )   
   where t.id = (110) and t.fl=130 ;
      
  
  
   update TB2_LKB592  t set 
   t.t11= round(t.t10*t.t09,10), t.t16=round(t.t10*t.t09+t.t15,10),
   t.t17=round((t.t10*t.t09+t.t15)*t.t05/t.t07,10),
   t.t18=round((t.t10*t.t09+t.t15)*t.t06/t.t07,10)
   where t.id = (110) and t.fl=110 ;
  
  
   /*
  select t60 id, t01 as "站点", t02 as "站点ID", t03 as "班组", t04 as "班组ID", t05 as "P3人数", t06 as "P9人数", 
  t07 as "班组总人数", t08 as "班组分数", t09 as "班组总分数", t10 as "分值", t11 as "奖金预算", t12 as "生产考核", 
  t13 as "工艺考核", t14 as "考核总数", t15 as "考核返还", t16 as "班组奖金", t17 as "P3奖金", t18 as "P9奖金" 
    from TB2_LKB592 t where t.id=110 and t.fl>105 
    order by t60*1 ;
		*/
  insert into  TB2_LKB592
	( id, fl, t01, t02, t03, t04, t60)
	( select 110,125,'小计',15, t03,t04,(20+t04) from TB2_LKB599_tmp t  where t.id=100 and t.fl=110
	group by t03,t04
	  )
	;
	 
  update TB2_LKB592 t set t.t60=rownum where t.id=110 and  t.fl>105;
   
 
  
   --3台机小计值 最后算
   update TB2_LKB592  t set 
   t.t05= ( select sum(ta.t05) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t06= ( select sum(ta.t06) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t07= ( select sum(ta.t07) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t09= ( select sum(ta.t09) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t11= ( select sum(ta.t11) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t12= ( select sum(ta.t12) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t13= ( select sum(ta.t13) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t14= ( select sum(ta.t14) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t15= ( select sum(ta.t15) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t16= ( select sum(ta.t16) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t17= ( select sum(ta.t17) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  ,
   t.t18= ( select sum(ta.t18) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t02=t.t02 )  
   where t.id = (110) and t.fl=120 ;
	 
  
   --3台机小计值 最后算
   update TB2_LKB592  t set 
   t.t05= ( select sum(ta.t05) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t06= ( select sum(ta.t06) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t07= ( select sum(ta.t07) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t09= ( select sum(ta.t09) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t11= ( select sum(ta.t11) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t12= ( select sum(ta.t12) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t13= ( select sum(ta.t13) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t14= ( select sum(ta.t14) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t15= ( select sum(ta.t15) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t16= ( select sum(ta.t16) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t17= ( select sum(ta.t17) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  ,
   t.t18= ( select sum(ta.t18) from TB2_LKB592 ta where ta.id=110 and ta.fl=110 and ta.t04=t.t04 )  
   where t.id = (110) and t.fl=125 ;
	 
	 
  
   update TB2_LKB592  t set  
   t.t16= ( select sum(ta.t16) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t17= ( select sum(ta.t17) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  ,
   t.t18= ( select sum(ta.t18) from TB2_LKB592 ta where ta.id=110 and ta.fl=110  )  
   where t.id = (110) and t.fl=130 ;
   
   
   
   
   ---指标情况
   
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  120,100, 'P3-9指标情况'   from dual  );
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,
  t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47,t60 )
  ( select  120,105, '站点','zdid','bz' ,'bzid', 'name' as t05 , '工种' as t06 , '职务' as t07 ,'个人工分' as t08,
  '中包对接,开浇控棒成功' as t11, '中包对接,开浇控棒失败' as t12, '更换浸入式(控棒)成功' as t13, 
  '更换浸入式(控棒)失败' as t14, '结晶器保护浇注,捞渣监控' as t15, '协助开浇,对接,更换浸入式水口' as t16, 
  '更换喷嘴' as t17, '准备流槽' as t18, '下线中包' as t19, '上线中包' as t20, '二冷室检查清理及保护' as t21, 
  '中包验收或烘烤及监控' as t22, '浸入式水口验收及烘烤' as t23, '准备保护渣成功' as t24, '准备保护渣失败' as t25, 
  '准备乙炔' as t26, '工具准备' as t27, '开浇,对接大包操作' as t28, '连浇大包主操' as t29, '中包排渣' as t30, 
  '油缸装卸成功' as t31, '油缸装卸失败' as t32, '操作机械手套卸大包套管成功' as t33, '操作机械手套卸大包套管失败' as t34,
   '烧大包水口' as t35, '大包领航成功' as t36, '大包领航失败' as t37, '大包原材料准备' as t38, 
   '更换溢流槽及杂物清理' as t39, '事故处理' as t40, '定置卫生' as t41, '设备点检及试车' as t42, 
   '对口交接班' as t43,'结晶器更换或上,下线' as t44,'不服从指令' as t45,'出勤考核' as t46,'个人考核' as t47,'排序ID' as t46
    from dual );
   
   
   
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,
  t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47, t60)
  (select 120,110,tman.khzd,tman.khzdid,tman.khbz,tman.khbzid,tman.khman,tman.khgz,tman.khzw,tman.khgf,
  nvl(t11,0),nvl(t12,0),nvl(t13,0),nvl(t14,0),nvl(t15,0),nvl(t16,0),nvl(t17,0),nvl(t18,0),nvl(t19,0),nvl(t20,0),
  nvl(t21,0),nvl(t22,0),nvl(t23,0),nvl(t24,0),nvl(t25,0),nvl(t26,0),nvl(t27,0),nvl(t28,0),nvl(t29,0),nvl(t30,0),
  nvl(t31,0),nvl(t32,0),nvl(t33,0),nvl(t34,0),nvl(t35,0),nvl(t36,0),nvl(t37,0),nvl(t38,0),nvl(t39,0),nvl(t40,0),
  nvl(t41,0),nvl(t42,0),nvl(t43,0),nvl(t44,0),nvl(t45,0),nvl(t46,0),  nvl(tb.tc,0),    id
  from   (select rownum id, t.khzd,t.khzdid,t.khbz,t.khbzid,t.khman,t.khgz, t.khzw,t.khgf  
      from ( select t.khzd,t.khzdid,t.khbz,t.khbzid,t.khman,t.khgz, t.khzw,t.khgf  
    from tb2_lkb599 t   where t.ifdel=0  and t.dt=v_dt and t.khzdid in (11,12,13) and t.khgz in ('P3','P9') 
    and (t.khzdid=v_zd or v_zd is null ) and ( t.khbzid =v_bz or v_bz is null  ) 
		and  (t.khzw not in ('班长') or t.khzw is null ) order by t.khzdid,t.khbzid,t.khgz,t.khzw,t.khman ) t ) tman
  left join (select t.khname ,sum(t.kh11) as t11,sum(t.kh12) as t12,sum(t.kh13) as t13,sum(t.kh14) as t14,
  sum(t.kh15) as t15,sum(t.kh16) as t16,sum(t.kh17) as t17,sum(t.kh18) as t18,sum(t.kh19) as t19,sum(t.kh20) as t20,
  sum(t.kh21) as t21,sum(t.kh22) as t22,sum(t.kh23) as t23,sum(t.kh24) as t24,sum(t.kh25) as t25,sum(t.kh26) as t26,
  sum(t.kh27) as t27,sum(t.kh28) as t28,sum(t.kh29) as t29,sum(t.kh30) as t30,sum(t.kh31) as t31,sum(t.kh32) as t32,
  sum(t.kh33) as t33,sum(t.kh34) as t34,sum(t.kh35) as t35,sum(t.kh36) as t36,sum(t.kh37) as t37,sum(t.kh38) as t38,
  sum(t.kh39) as t39,sum(t.kh40) as t40,sum(t.kh41) as t41,sum(t.kh42) as t42,sum(t.kh43) as t43,sum(t.kh44) as t44,
  sum(t.kh45) as t45,sum(t.kh46) as t46  from tb2_lkb522 t where t.khdmfl=v_fldm and t.ifdel=0 
  and (  t.khzdid = v_zd or v_zd is null ) and ( t.khbzid = v_bz or v_bz is null )
  and t.khdt between  replace(p_bt,'-','') and  replace(p_et,'-','') group by t.khname ) ta on tman.khman=ta.khname  
  left join ( select ta.man , nvl(sum(ta.khje+ta.khje2),0) tc from tb2_lkb596 ta where  ta.ifbzman=2 and ta.ifseng=0 and 
  ta.khdt between replace(p_bt,'-','') and replace(p_et,'-','')  and ta.ifdel=0 and ta.khgz in ('P3','P9') 
  group by ta.man  ) tb on tb.man=tman.khman  ) ;




   
  
   
   
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  130,100, 'P3-9得分情况'   from dual  );
  
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,
  t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47,t49,t50, t60 )
  ( select  130,105, '站点','zdid','bz' ,'bzid', 'name' as t05 , '工种' as t06 , '职务' as t07 ,
  '个人工分' as t08,  '职务系数' as t09, '班组系数' as t10,
  '中包对接,开浇控棒成功' as t11, '中包对接,开浇控棒失败' as t12, '更换浸入式(控棒)成功' as t13, 
  '更换浸入式(控棒)失败' as t14, '结晶器保护浇注,捞渣监控' as t15, '协助开浇,对接,更换浸入式水口' as t16, 
  '更换喷嘴' as t17, '准备流槽' as t18, '下线中包' as t19, '上线中包' as t20, '二冷室检查清理及保护' as t21, 
  '中包验收或烘烤及监控' as t22, '浸入式水口验收及烘烤' as t23, '准备保护渣成功' as t24, '准备保护渣失败' as t25, 
  '准备乙炔' as t26, '工具准备' as t27, '开浇,对接大包操作' as t28, '连浇大包主操' as t29, '中包排渣' as t30, 
  '油缸装卸成功' as t31, '油缸装卸失败' as t32, '操作机械手套卸大包套管成功' as t33, '操作机械手套卸大包套管失败' as t34,
   '烧大包水口' as t35, '大包领航成功' as t36, '大包领航失败' as t37, '大包原材料准备' as t38, 
   '更换溢流槽及杂物清理' as t39, '事故处理' as t40, '定置卫生' as t41, '设备点检及试车' as t42, 
   '对口交接班' as t43,'结晶器更换或上,下线' as t44,'不服从指令' as t45,'出勤考核' as t46,'个人考核' as t47,
	 '基础分' as t49,'个人总分' as t50,
    '排序ID' as t60 from dual );
   
   
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,
  t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47, t60 )
  (select 130, 110, t01, t02, t03, t04, t05, t06, t07, t08,  
  (case when t.t07='主浇工' then C1101.A*1 else 1 end ) ,
  (case --班组系数
    when t.t02=11 and t.t04=1 then  B1101.A*1  when t.t02=11 and t.t04=2 then  B1102.A*1 
    when t.t02=11 and t.t04=3 then  B1103.A*1  when t.t02=11 and t.t04=4 then  B1104.A*1  
    when t.t02=12 and t.t04=1 then  B1201.A*1  when t.t02=12 and t.t04=2 then  B1202.A*1 
    when t.t02=12 and t.t04=3 then  B1203.A*1  when t.t02=12 and t.t04=4 then  B1204.A*1      
    when t.t02=13 and t.t04=1 then  B1301.A*1  when t.t02=13 and t.t04=2 then  B1302.A*1 
    when t.t02=13 and t.t04=3 then  B1303.A*1  when t.t02=13 and t.t04=4 then  B1304.A*1 
    else 1 end ) ,
   
  
  
  t11*A1103.a,t12*A1203.a,t13*A1303.a,t14*A1403.a,t15*A1503.a,t16*A1603.a,t17*A1703.a,t18*A1803.a,t19*A1903.a,t20*A2003.a,
  t21*A2103.a,t22*A2203.a,t23*A2303.a,t24*A2403.a,t25*A2503.a,t26*A2603.a,t27*A2703.a,t28*A2803.a,t29*A2903.a,t30*A3003.a,
  t31*A3103.a,t32*A3203.a,t33*A3303.a,t34*A3403.a,t35*A3503.a,t36*A3603.a,t37*A3703.a,t38*A3803.a,t39*A3903.a,t40*A4003.a,
  t41*A4103.a,t42*A4203.a,t43*A4303.a,t44*A4403.a,t45*A4503.a ,t46 ,t47 , t60     from TB2_LKB592 t,  
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1103') A1103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1203') A1203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1303') A1303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1403') A1403,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1503') A1503,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1603') A1603,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1703') A1703,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1803') A1803,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A1903') A1903,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2003') A2003,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2103') A2103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2203') A2203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2303') A2303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2403') A2403,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2503') A2503,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2603') A2603,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2703') A2703,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2803') A2803,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A2903') A2903,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3003') A3003,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3103') A3103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3203') A3203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3303') A3303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3403') A3403,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3503') A3503,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3603') A3603,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3703') A3703,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3803') A3803,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A3903') A3903,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4003') A4003,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4103') A4103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4203') A4203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4303') A4303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4403') A4403,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='A4503') A4503,
  
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1101') B1101,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1102') B1102,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1103') B1103,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1104') B1104,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1201') B1201,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1202') B1202,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1203') B1203,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1204') B1204,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1301') B1301,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1302') B1302,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1303') B1303,
  (select nvl(t.khje,0) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='B1304') B1304,  
  
  (select nvl(t.khje,1.2) a from tb2_lkb598 t where t.ifdel=0 and t.khdt=v_dt and t.sbbfl=v_fldm and t.sbbdm='C1101') C1101
  
   
   where t.id=120 and t.fl=110   );
   
   
	--基础分
  update  TB2_LKB592 t set 
  t.t49=nvl((select ta.t01  from TB2_LKB592 ta where ta.id=99 and ta.fl=98),0)
  where t.id=130 and t.fl=110 ;
	
	 
	 
  --计算每人总分 
  update  TB2_LKB592 t set 
  t.t50=(t11+t12+t13+t14+t15+t16+t17+t18+t19+t20+t21+t22+t23+t24+t25+t26+t27+t28+t29+t30
         +t31+t32+t33+t34+t35+t36+t37+t38+t39+t40+t41+t42+t43+t44+t45+t49)
  where t.id=130 and t.fl=110 ;
  
  
  
   --分钱
   
   
   
   
   
   
   
   
   
   
   
   
   --班组内分钱
   
   
  insert into TB2_LKB592 ( id,fl,  t01  )   ( select  140,100, 'P3-9奖金分配'   from dual  );
  
   
    
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
  t11,t12,t13,t14,t15,t16,t17,t18,t19,t20,t21, t51,t52, t60 )
  ( select  140,105, '站点','zdid','bz' ,'bzid', 'name' as t05 , '工种' as t06 , '职务' as t07 ,
	'个人工分' as t08,   '职务系数' as t09, '班组系数' as t10,'个人初始得分' as t11, '个人总分' as t12,
  '本班本工种总分' as t13, '本班总钱' as t14, '本班本工种总钱' as t15, '分值' as t16,   '个人奖金预算' as t17, 
  '个人考核' as t18, '出勤考核' as t19, '个人实得奖金' as t20, '个人系数' as t21,
	'个人系数得分' as t51, '个人考核分数' as t52,	  '排序ID' as t60 from dual );
   
  
  
  insert into TB2_LKB592 ( id, fl, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
	t11,t18,t19,t21,t60)
  ( select 140,110, t01, t02, t03, t04, t05, t06, t07, t08,t09,t10,
	
	t50 as t11,t47 as t18,t46 as t19,

  --班组内不以职务，班组区分，只取个人工分
	--t.t08,
  round(t.t08*t.t09*t.t10,10),
	
	t60 from TB2_LKB592 t 
   where t.id=130 and t.fl=110 );
   
  update TB2_LKB592 t set 
  t.t14=( select sum(ta.t16) from TB2_LKB592 ta where ta.t02=t.t02 and ta.t04=t.t04 and ta.id=110 and ta.fl=110 )   
  where t.id=140 and t.fl=110 ; 
	
  update TB2_LKB592 t set  
  t.t15=( select sum(ta.t17) from TB2_LKB592 ta where ta.t02=t.t02 and ta.t04=t.t04 and ta.id=110 and ta.fl=110 )   
  where t.id=140 and t.fl=110 and t.t06='P3'; 
	
  update TB2_LKB592 t set  
  t.t15=( select sum(ta.t18) from TB2_LKB592 ta where ta.t02=t.t02 and ta.t04=t.t04 and ta.id=110 and ta.fl=110 )   
  where t.id=140 and t.fl=110 and t.t06='P9' ; 
  
	
	------------ --班组内不以职务，班组区分，只取个人工分 
  update TB2_LKB592 t set t.t51=t.t21* t.t11 , 
		t.t52=(   select  nvl(sum(ta.khje),0) khje  from TB2_LKB594 ta 
     where ta.ifdel=0 and ta.khdt between replace(p_bt,'-','') and  replace(p_et,'-','')   
		 and (ta.khzdid = t.t02 )	 and (ta.khbbid= t.t04) and (ta.khgz= 'P3' )  
		 and ta.ifbz='个人考核' and ta.ifbzid=11 and t.t05=ta.man		  )
	   where t.id=140 and t.fl=110   ; 
		 
  update TB2_LKB592 t set t.t12=t.t51+t.t52     where t.id=140 and t.fl=110   ; 
	 
	
	------------
	
	
  update TB2_LKB592 t set 
  t.t13=( select sum(ta.t12) from TB2_LKB592 ta where ta.t02=t.t02 and ta.t04=t.t04 
  and ta.id=140 and ta.fl=110 and ta.t06=t.t06 ) 
   where t.id=140 and t.fl=110 ; 
   
   

  update TB2_LKB592 t set       
    t.t16= FN2_cushu0(t.t15,t.t13,10), -- 分值
    t.t17= round(FN2_cushu0(t.t15,t.t13,10)*t.t12,10), --个人钱
    t.t20= round(FN2_cushu0(t.t15,t.t13,10)*t.t12+t.t18+t.t19,10)  --个人最后钱
   where t.id=140 and t.fl=110 ; 
   
  insert into TB2_LKB592 ( id, fl,  t05 ,
  t08,t09,t10,t11,t12,t17,t18,t19,t20,t21,t60 )
  ( select 140,120,  '合计', 
  sum(ta.t08), sum(ta.t09), sum(ta.t10),sum(ta.t11),sum(ta.t12),
  sum(ta.t17),sum(ta.t18), sum(ta.t19), sum(ta.t20),sum(ta.t21), (max(ta.t60*1)+1)  
  from TB2_LKB592 ta where ta.id=140 and ta.fl=110 ) ;
  
   

  update TB2_LKB592 t set       
    t.t14=(select sum(t.a) a from ( select avg(ta.t14) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110 group by ta.t02,ta.t04 )t ) , -- 本班总钱
    t.t15=(select sum(t.a) a from ( select avg(ta.t15) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110 group by ta.t02,ta.t04,ta.t06 )t ) --本班本工种总钱 ,
   where t.id=140 and t.fl=120 ; 
   
   /*
  update TB2_LKB592 t set
  t.t
  t01  as "站点", t02  as "zdid", t03  as "bz", t04  as "bzid", t05  as "name", 
  t06  as "工种", t07  as "职务", t08  as "个人工分", t09  as "职务系数", t10  as "班组系数", 
  t11  as "个人初始得分", t12  as "个人系数得分", t13  as "本班本工种总分", t14  as "本班总钱", 
  t15  as "本班本工种总钱", t16  as "分值", t17  as "个人奖金预算", t18  as "个人考核", 
  t19  as "出勤考核", t20  as "个人实得奖金" */
   
   
   
  update TB2_LKB592 t set   
  t.t08=trim(to_char(trunc(nvl(t.t08,0), 2),'99999990.99')),
  t.t09=trim(to_char(trunc(nvl(t.t09,0), 2),'99999990.99')),
  t.t10=trim(to_char(trunc(nvl(t.t10,0), 2),'99999990.99')),
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
  t.t21=trim(to_char(trunc(nvl(t.t21,0), 2),'99999990.99'))
  where  t.id in (140) and t.fl in (110,120,130);
	
	
	
	--个人奖金只要整数
  update TB2_LKB592 t set   
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990'))
  where  t.id in (140) and t.fl in (110,120,130);
  update TB2_LKB592 t set   
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990.00'))
  where  t.id in (140) and t.fl in (110,120,130);
	
  update TB2_LKB592 t set       
	 -- 车间总钱
  t.t20=(select (t.a) a from ( select sum(ta.t20) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110  )t ) ,		
  t.t14=(select sum(t.a) a from ( select avg(ta.t14) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110 group by ta.t02,ta.t04 )t ) , -- 本班总钱
  t.t15=(select sum(t.a) a from ( select avg(ta.t15) a from TB2_LKB592 ta where  ta.id=140 and ta.fl=110 group by ta.t02,ta.t04,ta.t06 )t ) --本班本工种总钱 ,
   where t.id=140 and t.fl=120 ; 
	 
	 
  update TB2_LKB592 t set   
  t.t20=trim(to_char(trunc(nvl(t.t20,0), 0),'99999990.00'))
  where  t.id in (140) and t.fl in (110,120,130);
	 
	
  
  update TB2_LKB592 t set   
  t.t05=trim(to_char(trunc(nvl(t.t05,0), 2),'99999990.99')),
  t.t06=trim(to_char(trunc(nvl(t.t06,0), 2),'99999990.99')),
  t.t07=trim(to_char(trunc(nvl(t.t07,0), 2),'99999990.99')),
  t.t08=trim(to_char(trunc(nvl(t.t08,0), 2),'99999990.99')),
  t.t09=trim(to_char(trunc(nvl(t.t09,0), 2),'99999990.99')),
  t.t10=trim(to_char(trunc(nvl(t.t10,0), 2),'99999990.99')),
  t.t11=trim(to_char(trunc(nvl(t.t11,0), 2),'99999990.99')),
  t.t12=trim(to_char(trunc(nvl(t.t12,0), 2),'99999990.99')),
  t.t13=trim(to_char(trunc(nvl(t.t13,0), 2),'99999990.99')),
  t.t14=trim(to_char(trunc(nvl(t.t14,0), 2),'99999990.99')),
  t.t15=trim(to_char(trunc(nvl(t.t15,0), 2),'99999990.99')),
  t.t16=trim(to_char(trunc(nvl(t.t16,0), 2),'99999990.99')),
  t.t17=trim(to_char(trunc(nvl(t.t17,0), 2),'99999990.99')),
  t.t18=trim(to_char(trunc(nvl(t.t18,0), 2),'99999990.99'))
  where  t.id in (110) and t.fl in (110,120,125,130);
  
   
   
   
   
   
   
   
   
  
  commit;
  
  
  OPEN P_CUR FOR
  
  select '' a from dual ;

 


  end tb00_list_01_12;





  PROCEDURE tb00_list_02(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    v_zd varchar2(30);
    v_bz varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN
  
    
  PG2_LKB525.tb00_list_01(replace(p_bt,'-',''),replace(p_et,'-',''),p_zd,p_bz,a_cur);   
  
	
  
	
	commit;
  OPEN P_CUR FOR
   
    
    
     select *  from TB2_LKB592 t
		 order by t.id,t.fl
		  ; 
 

 


  end tb00_list_02;

   
	
	
	
	
  --将奖金存入人员表
  PROCEDURE tb00_list_03(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间 
                          P_CUR OUT V_CUR) as
    v_stra varchar2(300);
    v_fldm varchar2(30);
    v_dt varchar2(30);
    a_CUR   V_CUR ; 
    
  BEGIN 
  
  v_dt:=substr(replace(p_et,'-',''),1,6);
  
  pg2_lkb525.tb00_list_01(replace(p_bt,'-',''),replace(p_et,'-',''),20,5,a_cur);
  
  
  --根据查询结果,更新人员名单表中的奖金预算值 
  update TB2_LKB599 t set 
  /*t.moneya=t.moneya+nvl((select tb.t20 from  TB2_LKB592 tb */
  t.moneya=nvl((select (tb.t20+100) from  TB2_LKB592 tb 
  where  tb.t04=t.khbzid and tb.t02=t.khzdid  and tb.t05=t.khman 
  and (tb.id in (140) and tb.fl in (110 ) ) ),0),
	t.personal_score=(   select   tb.t12    from  TB2_LKB592 tb 
     where  tb.t04=t.khbzid and tb.t02=t.khzdid  and tb.t05=t.khman  and (tb.id in (140) and tb.fl in (110 ) )  ),
  t.personal_buckle=(   select   (tb.t18 +tb.t300)   from  TB2_LKB592 tb 
     where  tb.t04=t.khbzid and tb.t02=t.khzdid  and tb.t05=t.khman  and (tb.id in (140) and tb.fl in (110 ) ) ),
  t.personal_attrition = (   select   tb.t19    from  TB2_LKB592 tb 
     where  tb.t04=t.khbzid and tb.t02=t.khzdid  and tb.t05=t.khman  and (tb.id in (140) and tb.fl in (110 ) ) )
  
  
  where t.ifdel=0    and t.dt=v_dt 
  and t.khman in (select ta.t05 from  TB2_LKB592 ta where (ta.id in (140) and ta.fl in (110 ) ) ) ;
  
    
  commit; 

  
  OPEN P_CUR FOR    
    
  select '' a from dual ; 
    
  /*
  select id,fl,
  t.t60*1 as id,
  t01  as "站点", t02  as "zdid", t03  as "bz", t04  as "bzid", t05  as "name",  
   t20  as "个人实得奖金" 
    from TB2_LKB592 t where t.id=140 and t.fl>105
    order by t.t60*1;*/

  end tb00_list_03;



  -- 测试数据
  PROCEDURE tb00_test(p_bt IN varchar2, --查询时间
                         p_et IN varchar2, --查询时间
                         p_zd IN varchar2, --zd
                         p_bz IN varchar2, --bz
                          P_CUR OUT V_CUR) as

    v_stra varchar2(300);
    v_KHDMFL varchar2(30); 
    a_cur V_CUR; 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_KHDMFL:='LKB526'; 
  tb00_list_01_04(p_bt,p_et,p_zd,p_bz,a_cur);
	delete tb2_lkb599_tmp ;
	insert into tb2_lkb599_tmp 
	(id,  fl,  fldm,  t01,  t02,  t03,  t04,  t05,  t06,  t07,  t08,  t09,  t10,  t11,  t12,  t13,  t14,  t15,  t16,  t17,  t18,  t19,  t20,  t21,  t22,  t23,  t24,  t25,  t26,  t27,  t28,  t29,  t30,  t31,  t32,  t33,  t34,  t35,  t36,  t37,  t38,  t39,  t40,  t41,  t42,  t43,  t44,  t45,  t46,  t47,  t48,  t49,  t50,  t51,  t52,  t53,  t54,  t55,  t56,  t57,  t58,  t59,  t60,  t61,  t62,  t63,  t64,  t65,  t66,  t67,  t68,  t69,  t70,  t71,  t72,  t73,  t74,  t75,  t76,  t77,  t78,  t79,  t80,  t81,  t82,  t83,  t84,  t85,  t86,  t87,  t88,  t89,  t90,  t91,  t92,  t93,  t94,  t95,  t96,  t97,  t98,  t99,  t100,  t101,  t102,  t103,  t104,  t105,  t106,  t107,  t108,  t109,  t110,  t111,  t112,  t113,  t114,  t115,  t116,  t117,  t118,  t119,  t120,  t121,  t122,  t123,  t124,  t125,  t126,  t127,  t128,  t129,  t130,  t131,  t132,  t133,  t134,  t135,  t136,  t137,  t138,  t139,  t140,  t141,  t142,  t143,  t144,  t145,  t146,  t147,  t148,  t149,  t150,  t151,  t152,  t153,  t154,  t155,  t156,  t157,  t158,  t159,  t160,  t161,  t162,  t163,  t164,  t165,  t166,  t167,  t168,  t169,  t170,  t171,  t172,  t173,  t174,  t175,  t176,  t177,  t178,  t179,  t180,  t181,  t182,  t183,  t184,  t185,  t186,  t187,  t188,  t189,  t190,  t191,  t192,  t193,  t194,  t195,  t196,  t197,  t198,  t199)
	(select id,  fl,  fldm,  t01,  t02,  t03,  t04,  t05,  t06,  t07,  t08,  t09,  t10,  t11,  t12,  t13,  t14,  t15,  t16,  t17,  t18,  t19,  t20,  t21,  t22,  t23,  t24,  t25,  t26,  t27,  t28,  t29,  t30,  t31,  t32,  t33,  t34,  t35,  t36,  t37,  t38,  t39,  t40,  t41,  t42,  t43,  t44,  t45,  t46,  t47,  t48,  t49,  t50,  t51,  t52,  t53,  t54,  t55,  t56,  t57,  t58,  t59,  t60,  t61,  t62,  t63,  t64,  t65,  t66,  t67,  t68,  t69,  t70,  t71,  t72,  t73,  t74,  t75,  t76,  t77,  t78,  t79,  t80,  t81,  t82,  t83,  t84,  t85,  t86,  t87,  t88,  t89,  t90,  t91,  t92,  t93,  t94,  t95,  t96,  t97,  t98,  t99,  t100,  t101,  t102,  t103,  t104,  t105,  t106,  t107,  t108,  t109,  t110,  t111,  t112,  t113,  t114,  t115,  t116,  t117,  t118,  t119,  t120,  t121,  t122,  t123,  t124,  t125,  t126,  t127,  t128,  t129,  t130,  t131,  t132,  t133,  t134,  t135,  t136,  t137,  t138,  t139,  t140,  t141,  t142,  t143,  t144,  t145,  t146,  t147,  t148,  t149,  t150,  t151,  t152,  t153,  t154,  t155,  t156,  t157,  t158,  t159,  t160,  t161,  t162,  t163,  t164,  t165,  t166,  t167,  t168,  t169,  t170,  t171,  t172,  t173,  t174,  t175,  t176,  t177,  t178,  t179,  t180,  t181,  t182,  t183,  t184,  t185,  t186,  t187,  t188,  t189,  t190,  t191,  t192,  t193,  t194,  t195,  t196,  t197,  t198,  t199 from tb2_lkb592)
	;
	commit;
   
  OPEN P_CUR FOR
  
  select * from tb2_lkb599_tmp ;
 


  end tb00_test;


  -- 班组分钱情况
  PROCEDURE tb01_list(  P_CUR OUT V_CUR) as

    v_stra varchar2(300);
    v_KHDMFL varchar2(30); 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_KHDMFL:='LKB526'; 
  
   
  OPEN P_CUR FOR
   
  select rownum id , t.* from (
	 select  t01 as "站点", t02 as "站点ID", t03 as "班组", t04 as "班组ID", t05 as "P3人数", t06 as "P9人数", 
  t07 as "班组总人数", t08 as "班组分数", t09 as "班组总分数", t10 as "分值", t11 as "奖金预算", t12 as "生产考核", 
  t13 as "工艺考核", t14 as "考核总数", t15 as "考核返还", t16 as "班组奖金", t17 as "P3奖金", t18 as "P9奖金" 
    from TB2_LKB592 t  where t.id =110  and t.fl> 105  
   order by id,fl, t02,t04  ) t
	 ;


  end tb01_list;


  -- 指标情况
  PROCEDURE tb02_list( 
                          P_CUR OUT V_CUR) as

    v_stra varchar2(300);
    v_KHDMFL varchar2(30); 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_KHDMFL:='LKB526'; 
  
  OPEN P_CUR FOR
  
  
  select rownum id , t.* from (
	 select  
    t01 as "站点", t02 as "zdid", t03 as "bz", t04 as "bzid", t05 as "name", t06 as "工种", t07 as "职务", t08 as "个人工分",  t11 as "中包对接,开浇控棒成功", t12 as "中包对接,开浇控棒失败", t13 as "更换浸入式(控棒)成功", t14 as "更换浸入式(控棒)失败", t15 as "结晶器保护浇注,捞渣监控", t16 as "协助开浇,对接,更换浸入式水口", t17 as "更换喷嘴", t18 as "准备流槽", t19 as "下线中包", t20 as "上线中包", t21 as "二冷室检查清理及保护", t22 as "中包验收或烘烤及监控", t23 as "浸入式水口验收及烘烤", t24 as "准备保护渣成功", t25 as "准备保护渣失败", t26 as "准备乙炔", t27 as "工具准备", t28 as "开浇,对接大包操作", t29 as "连浇大包主操", t30 as "中包排渣", t31 as "油缸装卸成功", t32 as "油缸装卸失败", t33 as "操作机械手套卸大包套管成功", t34 as "操作机械手套卸大包套管失败", t35 as "烧大包水口", t36 as "大包领航成功", t37 as "大包领航失败", t38 as "大包原材料准备", t39 as "更换溢流槽及杂物清理", t40 as "事故处理", t41 as "定置卫生", t42 as "设备点检及试车", t43 as "对口交接班", t44 as "结晶器更换或上,下线", t45 as "不服从指令"
    from TB2_LKB592 t where t.id=120 and t.fl>105 
		
		order by id,fl,t04  , t02,t06,t07,t05 ) t
   ;

 


  end tb02_list;


  -- 分数情况
  PROCEDURE tb03_list( 
                          P_CUR OUT V_CUR) as

    v_stra varchar2(300);
    v_KHDMFL varchar2(30); 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_KHDMFL:='LKB526'; 
  
  
  OPEN P_CUR FOR
  
  
  select rownum id , t.* from (
	 select  
    t01 as "站点", t02 as "zdid", t03 as "bz", t04 as "bzid", t05 as "name", t06 as "工种", t07 as "职务", t08 as "个人工分",  t11 as "中包对接,开浇控棒成功", t12 as "中包对接,开浇控棒失败", t13 as "更换浸入式(控棒)成功", t14 as "更换浸入式(控棒)失败", t15 as "结晶器保护浇注,捞渣监控", t16 as "协助开浇,对接,更换浸入式水口", t17 as "更换喷嘴", t18 as "准备流槽", t19 as "下线中包", t20 as "上线中包", t21 as "二冷室检查清理及保护", t22 as "中包验收或烘烤及监控", t23 as "浸入式水口验收及烘烤", t24 as "准备保护渣成功", t25 as "准备保护渣失败", t26 as "准备乙炔", t27 as "工具准备", t28 as "开浇,对接大包操作", t29 as "连浇大包主操", t30 as "中包排渣", t31 as "油缸装卸成功", t32 as "油缸装卸失败", t33 as "操作机械手套卸大包套管成功", t34 as "操作机械手套卸大包套管失败", t35 as "烧大包水口", t36 as "大包领航成功", t37 as "大包领航失败", t38 as "大包原材料准备", t39 as "更换溢流槽及杂物清理", t40 as "事故处理", t41 as "定置卫生", t42 as "设备点检及试车", t43 as "对口交接班", t44 as "结晶器更换或上,下线", t45 as "不服从指令", t50 as "个人总分"
    from TB2_LKB592 t where t.id=130 and t.fl>105
    
   order by id,fl,t04  , t02,t06,t07,t05 ) t
   ;

 


  end tb03_list;



  
  -- 奖金分配情况
  PROCEDURE tb04_list( 
                          P_CUR OUT V_CUR) as

    v_stra varchar2(300);
    v_KHDMFL varchar2(30); 
    
  BEGIN
  
  v_stra:='                                                  @';
  v_KHDMFL:='LKB526'; 
  
  
  OPEN P_CUR FOR
  
  
  select rownum id , t.* from (
	 select  
  t01  as "站点", t02  as "zdid", t03  as "bz", t04  as "bzid", t05  as "name", t06  as "工种", t07  as "职务",
   t08  as "个人工分", t09  as "职务系数", t10  as "班组系数", 
   t11  as "个人初始得分", 
	 t51  as "个人系数得分",  t52  as "个人考核分数", 
	 t12  as "个人总分", 
   t13  as "本班本工种总分", t14  as "本班总钱", t15  as "本班本工种总钱", t16  as "分值", t17  as "个人奖金预算", t18  as "个人考核", t19  as "出勤考核",  t20  as "个人实得奖金" ,t21 as  "个人系数" ,
   t300 as  "满勤奖",t301 as  "最终合计" 
    from TB2_LKB592 t where t.id=140 and t.fl>105
    
   order by id,fl,t04 , t02,t06,t07,t05  ) t
   ;


  end tb04_list;



  

  /*AAAAA,*/
  PROCEDURE AAA(P_CUR OUT V_CUR) as
  BEGIN
  
  
    SGLGZB.P_CALL('pg2_cos100', 'AAA');
    
    OPEN P_CUR FOR
      select t.MAT_CD,
             t.MAT_NAME,
             to_date(t.mod_dtime, 'yyyymmddhh24miss'),
             t.last_man
        from tb2_cos01_mat_name t
       where t.ifdel = 0
       order by t.mat_cd;

 





  end AAA;
 

 END PG2_LKB525;
 
 
 
/
