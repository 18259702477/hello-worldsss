create or replace package PG2_LBB375 is

  -- Author  : WPING
  -- Created : 2013-05-07 09:59:02
  -- Purpose : �����������ۺϱ���(��)
  
  type v_cur is ref cursor;
  procedure REPROT1(P_DAY in varchar2, p_cur out v_cur);
	

end PG2_LBB375;

 
/
create or replace package body PG2_LBB375 is


/*
20131101  xyz LKB522Ҫ���ñ�������,�޸ĳ� �������������ʱ���� �Է�����ȡֵ 

*/

  procedure REPROT1(P_DAY in varchar2, p_cur out v_cur) AS
	
  BEGIN 
	
  
  delete tb2_lkb590 t ;	
	 
  
  --����ÿ������
  
  insert into tb2_lkb590
  ( id, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24  )
  (select 0,
  'GROUP_CD', '����', 'ML������', 'ML������', 'ML������', '�и�̼������', '�и�̼������', '�и�̼������', 
  'Ʒ�ֹ�����', 'Ʒ��������', 'Ʒ��������', '����֧��', '������', '������' from dual ) ;
 

 --��ԭ�������������ʱ����
  
  insert into tb2_lkb590
  ( id,t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24  )
  (select 1,
  t.GROUP_CD, t.����, t.ML������, t.ML������, t.ML������, t.�и�̼������, t.�и�̼������,   t.�и�̼������, t.Ʒ�ֹ�����, 
  t.Ʒ��������, t.Ʒ��������, t.����֧��, t.������, t.������  from 
  ( SELECT A.GROUP_CD,
             decode(A.GROUP_CD, '1', '��', '2', '��', '3', '��', '4', '��')  AS "����",
             A.������ AS "ML������",
             A.������ AS "ML������",
             A.������ AS "ML������",
             B.������ AS "�и�̼������",
             B.������ AS "�и�̼������",
             B.������ AS "�и�̼������",
             NVL(A.������,0) + NVL(B.������,0) AS "Ʒ�ֹ�����",
             NVL(A.������,0) + NVL(B.������,0) AS "Ʒ��������",
             round((1 - (NVL(A.������,0) + NVL(B.������,0)) / (NVL(A.������,0) + NVL(B.������,0)))*100, 2) AS "Ʒ��������",
             C.����֧��,
             C.������,
             C.������
        FROM (SELECT T.GROUP_CD,
                     sum(T.GYP_NUM) ������,
                     sum(T.CUT_NUM) ������,
                     ROUND((1 - sum(T.GYP_NUM) / sum(T.CUT_NUM)) * 100, 2) ������
                FROM TB2_SRS20 T
               WHERE T.CCM_NO = 'LG2H1'
                 AND T.STL_GRD like 'ML%'
                 AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                     SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY
               GROUP BY T.GROUP_CD) A
        LEFT JOIN (SELECT T.GROUP_CD,
                          sum(T.GYP_NUM) ������,
                          sum(T.CUT_NUM) ������,
                          ROUND((1 - sum(T.GYP_NUM) / sum(T.CUT_NUM)) * 100,
                                2) ������
                     FROM TB2_SRS20 T
                    WHERE T.CCM_NO = 'LG2H1'
                      AND (T.STL_GRD like '40%' OR T.STL_GRD like '45%' OR
                          T.STL_GRD like '60%' OR T.STL_GRD like '65%')
                      AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                          SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY
                    GROUP BY T.GROUP_CD) B
          ON B.GROUP_CD = A.GROUP_CD
        LEFT JOIN (SELECT T.GROUP_CD,
                          sum(T.TABLE_ROLLER_NUM_SUM) ����֧��,
                          sum(T.CUT_NUM) ������,
                          ROUND(sum(T.TABLE_ROLLER_NUM_SUM) / sum(T.CUT_NUM) * 100,
                                2) ������
                     FROM TB2_SRS20 T
                    WHERE T.CCM_NO = 'LG2H2'
                      AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                          SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY
                    GROUP BY T.GROUP_CD) C
          ON C.GROUP_CD = A.GROUP_CD
         -- 
         UNION
         ( SELECT '5',
             '�ۼ�' AS "����",
             A.������ AS "ML������",
             A.������ AS "ML������",
             A.������ AS "ML������",
             B.������ AS "�и�̼������",
             B.������ AS "�и�̼������",
             B.������ AS "�и�̼������",
             NVL(A.������,0) + NVL(B.������,0) AS "Ʒ�ֹ�����",
             NVL(A.������,0) + NVL(B.������,0) AS "Ʒ��������",
             round((1 - (NVL(A.������,0) + NVL(B.������,0)) / (NVL(A.������,0) + NVL(B.������,0)))*100, 2) AS "Ʒ��������",
             C.����֧��,
             C.������,
             C.������
        FROM (SELECT  sum(T.GYP_NUM) ������,
                     sum(T.CUT_NUM) ������,
                     ROUND((1 - sum(T.GYP_NUM) / sum(T.CUT_NUM)) * 100, 2) ������
                FROM TB2_SRS20 T
               WHERE T.CCM_NO = 'LG2H1'
                 AND T.STL_GRD like 'ML%'
                 AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                     SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY) A
        LEFT JOIN (SELECT sum(T.GYP_NUM) ������,
                          sum(T.CUT_NUM) ������,
                          ROUND((1 - sum(T.GYP_NUM) / sum(T.CUT_NUM)) * 100,
                                2) ������
                     FROM TB2_SRS20 T
                    WHERE T.CCM_NO = 'LG2H1'
                      AND (T.STL_GRD like '40%' OR T.STL_GRD like '45%' OR
                          T.STL_GRD like '60%' OR T.STL_GRD like '65%')
                      AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                          SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY) B
          ON 1 = 1
        LEFT JOIN (SELECT   sum(T.TABLE_ROLLER_NUM_SUM) ����֧��,
                          sum(T.CUT_NUM) ������,
                          ROUND(sum(T.TABLE_ROLLER_NUM_SUM) / sum(T.CUT_NUM) * 100,
                                2) ������
                     FROM TB2_SRS20 T
                    WHERE T.CCM_NO = 'LG2H2'
                      AND SUBSTR(T.OCCR_TIME, 1, 8) BETWEEN
                          SUBSTR(P_DAY, 1, 6) || '01' AND P_DAY) C
          ON 1 = 1)
         ORDER BY GROUP_CD) t
     ) ;
  
  commit;
    OPEN P_CUR FOR
    
  select t.t11 GROUP_CD , t.t12 ���� , t.t13 ML������ , t.t14 ML������ , t.t15 ML������ , t.t16 �и�̼������ , 
  t.t17 �и�̼������ , t.t18 �и�̼������ , t.t19 Ʒ�ֹ����� , t.t20 Ʒ�������� , t.t21 Ʒ�������� , t.t22 ����֧�� , 
  t.t23 ������ , t.t24 ������
  from  tb2_lkb590 t where t.id=1	  order by t.t11				 
				 ;
				 
				 
  END REPROT1;


 

end PG2_LBB375;
/
