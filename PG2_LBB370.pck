create or replace package PG2_LBB370 is

  
  -- Author  : WENGPING
  -- Created : 2013-04-26 14:14:38
  -- Purpose : ���������������ۺϱ���

  type v_cur is ref cursor;
  procedure REPROT1(P_DAY in varchar2, p_cur out v_cur); 



end PG2_LBB370;

 
/
create or replace package body PG2_LBB370 is

/*
20131031  xyz LKB522Ҫ���ñ�������,�޸ĳ� �������������ʱ���� �Է�����ȡֵ 
*/

  procedure REPROT1(P_DAY in varchar2, p_cur out v_cur) AS
     V_MON_WGT NUMBER(14,3); 
  BEGIN
  SELECT SUM(T.������) INTO V_MON_WGT FROM ELGZGLG.TB2_REPORT_LZ T WHERE T.�������� BETWEEN (SUBSTR(P_DAY, 1, 6) || '01') AND P_DAY; 
  
  delete tb2_lkb590 t   ;	
	
	--����ÿ������
	
  insert into tb2_lkb590
  ( id, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50 )
  (select 0, 
	'����', '������', '��������', '��������', '¯��', '���ۼ�¯��', '������', '���ۼƸ�����', '��ˮ��', '���ۼƸ�ˮ��', '�����յ���', '���ۼ������յ���', '����', 'ƽ�����', '���ۼ��а�����', '�а�����', '�а���', '���ۼ���©����', '��©����', '�����©����', '������Ʒ��', 'ұ����', '�ϸ���', '����', '����', '����', '������', '�ع��յ���', '���ۼƶԽӴ���', '�ԽӴ���', '���ۼ�����', '����', '����¯��', '�����Խ�ʧ�ܴ���', '�����Խ��ܴ���', '�����Խӳɹ���', '������������', '�Ǽƻ�ͣ��', '��¯��', '��¯����' from dual ) ;
 
 --��ԭ�������������ʱ����
  insert into tb2_lkb590
  ( id, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50 )
  (select 1,
  tt.����, tt.������, tt.��������, tt.��������, tt.¯��, tt.���ۼ�¯��, tt.������, tt.���ۼƸ�����, tt.��ˮ��, tt.���ۼƸ�ˮ��, tt.�����յ���, tt.���ۼ������յ���, tt.����, tt.ƽ�����, tt.���ۼ��а�����, tt.�а�����, tt.�а���, tt.���ۼ���©����, tt.��©����, tt.�����©����, tt.������Ʒ��, tt.ұ����, tt.�ϸ���, tt.����, tt.����, tt.����, tt.������, tt.�ع��յ���, tt.���ۼƶԽӴ���, tt.�ԽӴ���, tt.���ۼ�����, tt.����, tt.����¯��, tt.�����Խ�ʧ�ܴ���, tt.�����Խ��ܴ���, tt.�����Խӳɹ���, tt.������������, tt.�Ǽƻ�ͣ��, tt.��¯��, tt.��¯����   from 
  (
  SELECT LZ1.���� AS ����,
           LZ1.������,
           LZ1.�������� AS ��������,
           LZ1.�������� AS ��������,
           LZ2.¯�� AS ¯��,
           LZ1.¯�� AS ���ۼ�¯��,
           LZ2.������ AS ������,
           LZ1.������ AS ���ۼƸ�����,
           LZ2.��ˮ�� AS ��ˮ��,
           LZ1.��ˮ�� AS ���ۼƸ�ˮ��,
           LZ2.�����յ��� AS �����յ���,
           LZ1.�����յ��� AS ���ۼ������յ���,
           LZ1.����   AS ����,
           LZ1.ƽ����� AS ƽ�����,
           LZ1.�а����� AS ���ۼ��а�����,
           LZ2.�а����� AS �а�����,
           LZ1.�а���   AS �а���,
           LZ1.��©���� AS ���ۼ���©����,
           LZ2.��©���� AS ��©����,
           round(LZ1.��©����*10000/LZ1.������,2) AS �����©����,
           LZ1.������Ʒ�� AS ������Ʒ��,
           LZ1.ұ���� AS ұ����,
           round((LZ1.������ - nvl(LZ1.������Ʒ��,0))/LZ1.������*100,2)  AS �ϸ���,
           LZ1.����  AS ����,
           LZ1.����  AS ����,
           LZ1.����  AS ����,
           LZ1.������ AS ������,
           round(LZ1.������/(nvl(LZ1.������,0)+LZ1.������+nvl(LZ1.ұ����,0))*100,2) AS �ع��յ���,
           LZ1.�ԽӴ��� AS ���ۼƶԽӴ���,
           LZ2.�ԽӴ��� AS �ԽӴ���,
           LZ1.�а����� - nvl(LZ1.�ԽӴ���,0) AS ���ۼ�����,
           LZ2.�а����� - nvl(LZ2.�ԽӴ���,0) AS ����,
           ROUND(LZ1.¯��/(LZ1.�а����� - nvl(LZ1.�ԽӴ���,0)),2) AS ����¯��,
           LZ1.�����Խ�ʧ�� AS �����Խ�ʧ�ܴ���,
           nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0) AS �����Խ��ܴ���,
           ROUND(nvl(LZ1.�����Խӳɹ�,0)/decode((nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0)),'0','9999999999',(nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0)))*100,2)  AS �����Խӳɹ���,
           LZ1.������������ AS ������������,
           LZ1.�Ǽƻ�ͣ�� AS �Ǽƻ�ͣ��,
           LZ1.��¯�� AS ��¯��,
           LZ1.��¯���� AS ��¯����
     FROM (SELECT 1 AS ����,SGLGZB.GF_COMMNAMEFIND('G0004',��������, '2') AS ��������,SGLGZB.GF_COMMNAMEFIND('Q0177',��������, '2') AS ��������,�������� AS ������,
           COUNT(1) AS ¯��,
           TRIM(TO_CHAR(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON),'999999990.000')) AS ������,
           TRIM(TO_CHAR(SUM(��ˮ��),'999999990.000')) AS ��ˮ��,
           TRIM(TO_CHAR(ROUND((SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON))/SUM(��ˮ��)*100,2),'999999990.00')) AS �����յ���,
           COUNT(DISTINCT ��������) ����,
           TRIM(TO_CHAR(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/COUNT(DISTINCT ��������),'999999990.000')) ƽ�����,
           round(sum(1 / ZB.MAX_TD_AGE), 2) �а�����,
           round(count(1) / sum(1 / ZB.MAX_TD_AGE), 2) �а���,
           SUM(LZ65.B) ��©����,
           SUM(LB21.ZLKH_WGT) ������Ʒ��,
           SUM(LB22.A) ұ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           MAX(LB31.������) ������,
           MAX(LB31.�ԽӴ���) �ԽӴ���,
           MAX(LB31.�����Խӳɹ�) �����Խӳɹ�,
           MAX(LB31.�����Խ�ʧ��) �����Խ�ʧ��,
           MAX(LB31.������������) ������������,
           MAX(LB31.�Ǽƻ�ͣ��) �Ǽƻ�ͣ��,
           MAX(LB31.��¯��) ��¯��,
           MAX(LB31.��¯����) ��¯����
      FROM TB2_REPORT_LZ
      LEFT JOIN SGLGZB.TB2_REPORT_SAVE LG2WGT ON LG2WGT.SMS_DATE = P_DAY AND LG2WGT.FAC = 'LG2'
      LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.ұ�����
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "�а�����"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.¯��               
     LEFT JOIN (select * from TB2_LBB210 t where t.zlkh_type = '3' and t.zlkh_lz like 'LG2H%') LB21 ON LB21.L2_CH_NO = TB2_REPORT_LZ.¯��
      LEFT JOIN (select distinct t.l2_ch_no,max(t.zlkh_reason) ����,round(sum(q.slab_wgt_total)/sum(q.slab_amount)*max(t.zlkh_wgt),2) AS "A" from TB2_LBB210 t left join elgzgzl.tb2_qc230 q on q.l2_ch_no = t.l2_ch_no
      where t.zlkh_type = '4' and t.zlkh_lz like 'LG2H%'
      group by t.l2_ch_no) LB22 ON LB22.L2_CH_NO = TB2_REPORT_LZ.¯�� 
      LEFT JOIN (SELECT t.bof_no,group_cd,
sum(case when t.project = '������' then num end) "������",
sum(case when t.project = '�ԽӴ���' then num end) "�ԽӴ���",
sum(case when t.project = '�����Խӳɹ�' then num end) "�����Խӳɹ�",
sum(case when t.project = '�����Խ�ʧ��' then num end) "�����Խ�ʧ��",
sum(case when t.project = '������������' then num end) "������������",
sum(case when t.project = '�Ǽƻ�ͣ��' then num end) "�Ǽƻ�ͣ��",
sum(case when t.project = '��¯��' then num end) "��¯��",
sum(case when t.project = '��¯����' then num end) "��¯����",
sum(case when t.project = 'ͭ��֧��' then num end) "ͭ��֧��"
FROM TB2_LBB311 t WHERE t.kh_type = '�ۺϱ���' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
group by bof_no,group_cd) LB31   ON LB31.BOF_NO = TB2_REPORT_LZ.�������� AND LB31.GROUP_CD = TB2_REPORT_LZ.�������� 
     WHERE �������� BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
     GROUP BY ��������,��������) LZ1 
    LEFT JOIN
    (SELECT 1 AS ����,SGLGZB.GF_COMMNAMEFIND('G0004',��������, '2') AS ��������,SGLGZB.GF_COMMNAMEFIND('Q0177',��������, '2') AS ��������,�������� AS ������,
           COUNT(1) AS ¯��,
           TRIM(TO_CHAR(SUM(������),'999999990.000')) AS ������,
           TRIM(TO_CHAR(SUM(��ˮ��),'999999990.000')) AS ��ˮ��,
           TRIM(TO_CHAR(ROUND(SUM(������)/SUM(��ˮ��)*100,2),'999999990.00')) AS �����յ���,
           round(sum(1 / ZB.MAX_TD_AGE), 2) �а�����,
           SUM(LZ65.B) ��©����,
           MAX(LB31.�ԽӴ���) �ԽӴ���
      FROM TB2_REPORT_LZ
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.ұ�����
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "�а�����"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.¯�� 
    LEFT JOIN (SELECT t.bof_no,group_cd,
sum(case when t.project = '�ԽӴ���' then num end) "�ԽӴ���"
FROM TB2_LBB311 t WHERE t.kh_type = '�ۺϱ���' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date = P_DAY
group by bof_no,group_cd) LB31   ON LB31.BOF_NO = TB2_REPORT_LZ.�������� AND LB31.GROUP_CD = TB2_REPORT_LZ.��������
     WHERE �������� = P_DAY
     GROUP BY ��������,��������) LZ2 ON LZ2.�������� = LZ1.�������� AND LZ2.�������� = LZ1.��������
     UNION
    SELECT LZ1.���� AS ����,
           LZ1.������,
           LZ1.�������� AS ��������,
           LZ1.�������� AS ��������,
           LZ2.¯�� AS ¯��,
           LZ1.¯�� AS ���ۼ�¯��,
           LZ2.������ AS ������,
           LZ1.������ AS ���ۼƸ�����,
           LZ2.��ˮ�� AS ��ˮ��,
           LZ1.��ˮ�� AS ���ۼƸ�ˮ��,
           LZ2.�����յ��� AS �����յ���,
           LZ1.�����յ��� AS ���ۼ������յ���,
           LZ1.����   AS ����,
           LZ1.ƽ����� AS ƽ�����,
           LZ1.�а����� AS ���ۼ��а�����,
           LZ2.�а����� AS �а�����,
           LZ1.�а���   AS �а���,
           LZ1.��©���� AS ���ۼ���©����,
           LZ2.��©���� AS ��©����,
           round(LZ1.��©����*10000/LZ1.������,2) AS �����©����,
           LZ1.������Ʒ�� AS ������Ʒ��,
           LZ1.ұ���� AS ұ����,
           round((LZ1.������ - nvl(LZ1.������Ʒ��,0))/LZ1.������*100,2)  AS �ϸ���,
           LZ1.����  AS ����,
           LZ1.����  AS ����,
           LZ1.����  AS ����,
           LZ1.������ AS ������,
           round(LZ1.������/(nvl(LZ1.������,0)+LZ1.������+nvl(LZ1.ұ����,0))*100,2) AS �ع��յ���,
           LZ1.�ԽӴ��� AS ���ۼƶԽӴ���,
           LZ2.�ԽӴ��� AS �ԽӴ���,
           LZ1.�а����� - nvl(LZ1.�ԽӴ���,0) AS ���ۼ�����,
           LZ2.�а����� - nvl(LZ2.�ԽӴ���,0) AS ����,
           ROUND(LZ1.¯��/(LZ1.�а����� - nvl(LZ1.�ԽӴ���,0)),2) AS ����¯��,
           LZ1.�����Խ�ʧ�� AS �����Խ�ʧ�ܴ���,
           nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0) AS �����Խ��ܴ���,
           ROUND(nvl(LZ1.�����Խӳɹ�,0)/decode((nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0)),'0','9999999999',(nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0)))*100,2)  AS �����Խӳɹ���,
           LZ1.������������ AS ������������,
           LZ1.�Ǽƻ�ͣ�� AS �Ǽƻ�ͣ��,
           LZ1.��¯�� AS ��¯��,
           LZ1.��¯���� AS ��¯����
      FROM (SELECT 1 AS ����,SGLGZB.GF_COMMNAMEFIND('G0004',��������, '2') AS ��������,'����ϼ�' AS ��������,�������� AS ������,
           COUNT(1) AS ¯��,
           TRIM(TO_CHAR(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON),'999999990.000')) AS ������,
           TRIM(TO_CHAR(SUM(��ˮ��),'999999990.000')) AS ��ˮ��,
           TRIM(TO_CHAR(ROUND((SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON))/SUM(��ˮ��)*100,2),'999999990.00')) AS �����յ���,
           COUNT(DISTINCT ��������) ����,
           TRIM(TO_CHAR(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/COUNT(DISTINCT ��������),'999999990.000')) ƽ�����,
           round(sum(1 / ZB.MAX_TD_AGE), 2) �а�����,
           round(count(1) / sum(1 / ZB.MAX_TD_AGE), 2) �а���,
           SUM(LZ65.B) ��©����,
           SUM(LB21.ZLKH_WGT) ������Ʒ��,
           SUM(LB22.A) ұ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           MAX(LB31.������) ������,
           MAX(LB31.�ԽӴ���) �ԽӴ���,
           MAX(LB31.�����Խӳɹ�) �����Խӳɹ�,
           MAX(LB31.�����Խ�ʧ��) �����Խ�ʧ��,
           MAX(LB31.������������) ������������,
           MAX(LB31.�Ǽƻ�ͣ��) �Ǽƻ�ͣ��,
           MAX(LB31.��¯��) ��¯��,
           MAX(LB31.��¯����) ��¯����
      FROM TB2_REPORT_LZ
      LEFT JOIN SGLGZB.TB2_REPORT_SAVE LG2WGT ON LG2WGT.SMS_DATE = P_DAY AND LG2WGT.FAC = 'LG2'
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.ұ�����
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "�а�����"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.¯��  
     LEFT JOIN (select * from TB2_LBB210 t where t.zlkh_type = '3' and t.zlkh_lz like 'LG2H%') LB21 ON LB21.L2_CH_NO = TB2_REPORT_LZ.¯��
      LEFT JOIN (select distinct t.l2_ch_no,max(t.zlkh_reason) ����,round(sum(q.slab_wgt_total)/sum(q.slab_amount)*max(t.zlkh_wgt),2)  "A" from TB2_LBB210 t left join elgzgzl.tb2_qc230 q on q.l2_ch_no = t.l2_ch_no
      where t.zlkh_type = '4' and t.zlkh_lz like 'LG2H%'
      group by t.l2_ch_no) LB22 ON LB22.L2_CH_NO = TB2_REPORT_LZ.¯��  
       LEFT JOIN (SELECT group_cd,
sum(case when t.project = '������' then num end) "������",
sum(case when t.project = '�ԽӴ���' then num end) "�ԽӴ���",
sum(case when t.project = '�����Խӳɹ�' then num end) "�����Խӳɹ�",
sum(case when t.project = '�����Խ�ʧ��' then num end) "�����Խ�ʧ��",
sum(case when t.project = '������������' then num end) "������������",
sum(case when t.project = '�Ǽƻ�ͣ��' then num end) "�Ǽƻ�ͣ��",
sum(case when t.project = '��¯��' then num end) "��¯��",
sum(case when t.project = '��¯����' then num end) "��¯����",
sum(case when t.project = 'ͭ��֧��' then num end) "ͭ��֧��"
FROM TB2_LBB311 t WHERE t.kh_type = '�ۺϱ���' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
group by group_cd) LB31   ON  LB31.GROUP_CD = TB2_REPORT_LZ.��������
     WHERE �������� BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
     GROUP BY ��������) LZ1 
     LEFT JOIN
    (SELECT 1 AS ����,SGLGZB.GF_COMMNAMEFIND('G0004',��������, '2') AS �������� ,'����ϼ�' AS ��������,�������� AS ������,
           COUNT(1) AS ¯��,
           TRIM(TO_CHAR(SUM(������),'999999990.000')) AS ������,
           TRIM(TO_CHAR(SUM(��ˮ��),'999999990.000')) AS ��ˮ��,
           TRIM(TO_CHAR(ROUND(SUM(������)/SUM(��ˮ��)*100,2),'999999990.00')) AS �����յ���,
           round(sum(1 / ZB.MAX_TD_AGE), 2) �а�����,
           SUM(LZ65.B) ��©����,
           MAX(LB31.�ԽӴ���) �ԽӴ���
      FROM TB2_REPORT_LZ
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.ұ�����
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "�а�����"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
      LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.¯��
     LEFT JOIN (SELECT group_cd,
sum(case when t.project = '�ԽӴ���' then num end) "�ԽӴ���"
FROM TB2_LBB311 t WHERE t.kh_type = '�ۺϱ���' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date = P_DAY
group by bof_no,group_cd) LB31   ON  LB31.GROUP_CD = TB2_REPORT_LZ.��������
     WHERE �������� = P_DAY
     GROUP BY ��������) LZ2 ON LZ2.�������� = LZ1.�������� AND LZ2.�������� = LZ1.��������
     UNION
    SELECT LZ1.���� AS ����,
           LZ1.������,
           LZ1.�������� AS ��������,
           LZ1.�������� AS ��������,
           LZ2.¯�� AS ¯��,
           LZ1.¯�� AS ���ۼ�¯��,
           LZ2.������ AS ������,
           LZ1.������ AS ���ۼƸ�����,
           LZ2.��ˮ�� AS ��ˮ��,
           LZ1.��ˮ�� AS ���ۼƸ�ˮ��,
           LZ2.�����յ��� AS �����յ���,
           LZ1.�����յ��� AS ���ۼ������յ���,
           LZ1.����   AS ����,
           LZ1.ƽ����� AS ƽ�����,
           LZ1.�а����� AS ���ۼ��а�����,
           LZ2.�а����� AS �а�����,
           LZ1.�а���   AS  �а���,
           LZ1.��©���� AS ���ۼ���©����,
           LZ2.��©���� AS ��©����,
           round(LZ1.��©����*10000/LZ1.������,2) AS �����©����,
           LZ1.������Ʒ�� AS ������Ʒ��,
           LZ1.ұ���� AS ұ����,
           round((LZ1.������ - nvl(LZ1.������Ʒ��,0))/LZ1.������*100,2)  AS �ϸ���,
           LZ1.����  AS ����,
           LZ1.����  AS ����,
           LZ1.����  AS ����,
           LZ1.������ AS ������,
           round(LZ1.������/(nvl(LZ1.������,0)+LZ1.������+nvl(LZ1.ұ����,0))*100,2) AS �ع��յ���,
           LZ1.�ԽӴ��� AS ���ۼƶԽӴ���,
           LZ2.�ԽӴ��� AS �ԽӴ���,
           LZ1.�а����� - nvl(LZ1.�ԽӴ���,0) AS ���ۼ�����,
           LZ2.�а����� - nvl(LZ2.�ԽӴ���,0) AS ����,
           ROUND(LZ1.¯��/(LZ1.�а����� - nvl(LZ1.�ԽӴ���,0)),2) AS ����¯��,
           LZ1.�����Խ�ʧ�� AS �����Խ�ʧ�ܴ���,
           nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0) AS �����Խ��ܴ���,
           ROUND(nvl(LZ1.�����Խӳɹ�,0)/decode((nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0)),'0','9999999999',(nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0)))*100,2)  AS �����Խӳɹ���,
           LZ1.������������ AS ������������,
           LZ1.�Ǽƻ�ͣ�� AS �Ǽƻ�ͣ��,
           LZ1.��¯�� AS ��¯��,
           LZ1.��¯���� AS ��¯����
      FROM (SELECT 2 AS ����,'�����ϼ�' AS ��������,SGLGZB.GF_COMMNAMEFIND('Q0177',��������, '2') AS ��������,'' AS ������,
           COUNT(1) AS ¯��,
           TRIM(TO_CHAR(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON),'999999990.000')) AS ������,
           TRIM(TO_CHAR(SUM(��ˮ��),'999999990.000')) AS ��ˮ��,
           TRIM(TO_CHAR(ROUND((SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON))/SUM(��ˮ��)*100,2),'999999990.00')) AS �����յ���,
           COUNT(DISTINCT ��������) ����,
           TRIM(TO_CHAR(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/COUNT(DISTINCT ��������),'999999990.000')) ƽ�����,
           round(sum(1 / ZB.MAX_TD_AGE), 2) �а�����,
           round(count(1) / sum(1 / ZB.MAX_TD_AGE), 2) �а���,
           SUM(LZ65.B) ��©����,
           SUM(LB21.ZLKH_WGT) ������Ʒ��,
           SUM(LB22.A) ұ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           MAX(LB31.������) ������,
           MAX(LB31.�ԽӴ���) �ԽӴ���,
           MAX(LB31.�����Խӳɹ�) �����Խӳɹ�,
           MAX(LB31.�����Խ�ʧ��) �����Խ�ʧ��,
           MAX(LB31.������������) ������������,
           MAX(LB31.�Ǽƻ�ͣ��) �Ǽƻ�ͣ��,
           MAX(LB31.��¯��) ��¯��,
           MAX(LB31.��¯����) ��¯����
      FROM TB2_REPORT_LZ
      LEFT JOIN SGLGZB.TB2_REPORT_SAVE LG2WGT ON LG2WGT.SMS_DATE = P_DAY AND LG2WGT.FAC = 'LG2'
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.ұ�����
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "�а�����"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.¯��
    LEFT JOIN (select * from TB2_LBB210 t where t.zlkh_type = '3' and t.zlkh_lz like 'LG2H%') LB21 ON LB21.L2_CH_NO = TB2_REPORT_LZ.¯��
      LEFT JOIN (select distinct t.l2_ch_no,max(t.zlkh_reason) ����,round(sum(q.slab_wgt_total)/sum(q.slab_amount)*max(t.zlkh_wgt),2)  "A" from TB2_LBB210 t left join elgzgzl.tb2_qc230 q on q.l2_ch_no = t.l2_ch_no
      where t.zlkh_type = '4' and t.zlkh_lz like 'LG2H%'
      group by t.l2_ch_no) LB22 ON LB22.L2_CH_NO = TB2_REPORT_LZ.¯��  
       LEFT JOIN (SELECT t.bof_no,
sum(case when t.project = '������' then num end) "������",
sum(case when t.project = '�ԽӴ���' then num end) "�ԽӴ���",
sum(case when t.project = '�����Խӳɹ�' then num end) "�����Խӳɹ�",
sum(case when t.project = '�����Խ�ʧ��' then num end) "�����Խ�ʧ��",
sum(case when t.project = '������������' then num end) "������������",
sum(case when t.project = '�Ǽƻ�ͣ��' then num end) "�Ǽƻ�ͣ��",
sum(case when t.project = '��¯��' then num end) "��¯��",
sum(case when t.project = '��¯����' then num end) "��¯����",
sum(case when t.project = 'ͭ��֧��' then num end) "ͭ��֧��"
FROM TB2_LBB311 t WHERE t.kh_type = '�ۺϱ���' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
group by bof_no) LB31   ON LB31.BOF_NO = TB2_REPORT_LZ.�������� 
     WHERE �������� BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY
     GROUP BY �������� ) LZ1 
    LEFT JOIN
    (SELECT 2 AS ����,'�����ϼ�' AS ��������,SGLGZB.GF_COMMNAMEFIND('Q0177',��������, '2') AS ��������,'' AS ������,
           COUNT(1) AS ¯��,
           TRIM(TO_CHAR(SUM(������),'999999990.000')) AS ������,
           TRIM(TO_CHAR(SUM(��ˮ��),'999999990.000')) AS ��ˮ��,
           TRIM(TO_CHAR(ROUND(SUM(������)/SUM(��ˮ��)*100,2),'999999990.00')) AS �����յ���,
           round(sum(1 / ZB.MAX_TD_AGE), 2) �а�����,
           SUM(LZ65.B) ��©����,
           MAX(LB31.�ԽӴ���) �ԽӴ���
      FROM TB2_REPORT_LZ
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.ұ�����
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "�а�����"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.¯��
     LEFT JOIN (SELECT t.bof_no,
sum(case when t.project = '�ԽӴ���' then num end) "�ԽӴ���"
FROM TB2_LBB311 t WHERE t.kh_type = '�ۺϱ���' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date = P_DAY
group by bof_no) LB31   ON LB31.BOF_NO = TB2_REPORT_LZ.��������
     WHERE �������� = P_DAY
     GROUP BY ��������) LZ2 ON LZ2.�������� = LZ1.�������� AND LZ2.�������� = LZ1.��������
     UNION
    SELECT LZ1.���� AS ����,
           LZ1.������,
           LZ1.�������� AS ��������,
           LZ1.�������� AS ��������,
           LZ2.¯�� AS ¯��,
           LZ1.¯�� AS ���ۼ�¯��,
           LZ2.������ AS ������,
           LZ1.������ AS ���ۼƸ�����,
           LZ2.��ˮ�� AS ��ˮ��,
           LZ1.��ˮ�� AS ���ۼƸ�ˮ��,
           LZ2.�����յ��� AS �����յ���,
           LZ1.�����յ��� AS ���ۼ������յ���,
           LZ1.����   AS ����,
           LZ1.ƽ����� AS ƽ�����,
           LZ1.�а����� AS ���ۼ��а�����,
           LZ2.�а����� AS �а�����,
           LZ1.�а���   AS  �а���,
           LZ1.��©���� AS ���ۼ���©����,
           LZ2.��©���� AS ��©����,
           round(LZ1.��©����*10000/LZ1.������,2) AS �����©����,
           LZ1.������Ʒ�� AS ������Ʒ��,
           LZ1.ұ���� AS ұ����,
           round((LZ1.������ - nvl(LZ1.������Ʒ��,0))/LZ1.������*100,2)  AS �ϸ���,
           LZ1.����  AS ����,
           LZ1.����  AS ����,
           LZ1.����  AS ����,
           LZ1.������ AS ������,
           round(LZ1.������/(nvl(LZ1.������,0)+LZ1.������+nvl(LZ1.ұ����,0))*100,2) AS �ع��յ���,
           LZ1.�ԽӴ��� AS ���ۼƶԽӴ���,
           LZ2.�ԽӴ��� AS �ԽӴ���,
           LZ1.�а����� - nvl(LZ1.�ԽӴ���,0) AS ���ۼ�����,
           LZ2.�а����� - nvl(LZ2.�ԽӴ���,0) AS ����,
           ROUND(LZ1.¯��/(LZ1.�а����� - nvl(LZ1.�ԽӴ���,0)),2) AS ����¯��,
           LZ1.�����Խ�ʧ�� AS �����Խ�ʧ�ܴ���,
           nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0) AS �����Խ��ܴ���,
           ROUND(nvl(LZ1.�����Խӳɹ�,0)/decode((nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0)),'0','9999999999',(nvl(LZ1.�����Խ�ʧ��,0) + nvl(LZ1.�����Խӳɹ�,0)))*100,2)  AS �����Խӳɹ���,
           LZ1.������������ AS ������������,
           LZ1.�Ǽƻ�ͣ�� AS �Ǽƻ�ͣ��,
           LZ1.��¯�� AS ��¯��,
           LZ1.��¯���� AS ��¯����
      FROM (SELECT 3 AS ����,'�ܺϼ�' AS ��������,' ' AS ��������,'' AS ������,
           COUNT(1) AS ¯��,
           TRIM(TO_CHAR(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON),'999999990.000')) AS ������,
           TRIM(TO_CHAR(SUM(��ˮ��),'999999990.000')) AS ��ˮ��,
           TRIM(TO_CHAR(ROUND(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/SUM(��ˮ��)*100,2),'999999990.00')) AS �����յ���,
           COUNT(DISTINCT ��������) ����,
           TRIM(TO_CHAR(SUM(������)/V_MON_WGT*MAX(LG2WGT.WGT_MON)/COUNT(DISTINCT ��������),'999999990.000')) ƽ�����,
           round(sum(1 / ZB.MAX_TD_AGE), 2) �а�����,
           round(count(1) / sum(1 / ZB.MAX_TD_AGE), 2) �а���,
           SUM(LZ65.B) ��©����,
           SUM(LB21.ZLKH_WGT) ������Ʒ��,
           SUM(LB22.A) ұ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           sum(case when LB22.���� = '����' then '1' end) ����,
           MAX(LB31.������) ������,
           MAX(LB31.�ԽӴ���) �ԽӴ���,
           MAX(LB31.�����Խӳɹ�) �����Խӳɹ�,
           MAX(LB31.�����Խ�ʧ��) �����Խ�ʧ��,
           MAX(LB31.������������) ������������,
           MAX(LB31.�Ǽƻ�ͣ��) �Ǽƻ�ͣ��,
           MAX(LB31.��¯��) ��¯��,
           MAX(LB31.��¯����) ��¯����
      FROM TB2_REPORT_LZ
      LEFT JOIN SGLGZB.TB2_REPORT_SAVE LG2WGT ON LG2WGT.SMS_DATE = P_DAY AND LG2WGT.FAC = 'LG2'
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.ұ�����
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "�а�����"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
     LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.¯��   
    LEFT JOIN (select * from TB2_LBB210 t where t.zlkh_type = '3' and t.zlkh_lz like 'LG2H%') LB21 ON LB21.L2_CH_NO = TB2_REPORT_LZ.¯��
      LEFT JOIN (select distinct t.l2_ch_no,max(t.zlkh_reason) ����,round(sum(q.slab_wgt_total)/sum(q.slab_amount)*max(t.zlkh_wgt),2)  "A" from TB2_LBB210 t left join elgzgzl.tb2_qc230 q on q.l2_ch_no = t.l2_ch_no
      where t.zlkh_type = '4' and t.zlkh_lz like 'LG2H%'
      group by t.l2_ch_no) LB22 ON LB22.L2_CH_NO = TB2_REPORT_LZ.¯��  
       LEFT JOIN (SELECT 
sum(case when t.project = '������' then num end) "������",
sum(case when t.project = '�ԽӴ���' then num end) "�ԽӴ���",
sum(case when t.project = '�����Խӳɹ�' then num end) "�����Խӳɹ�",
sum(case when t.project = '�����Խ�ʧ��' then num end) "�����Խ�ʧ��",
sum(case when t.project = '������������' then num end) "������������",
sum(case when t.project = '�Ǽƻ�ͣ��' then num end) "�Ǽƻ�ͣ��",
sum(case when t.project = '��¯��' then num end) "��¯��",
sum(case when t.project = '��¯����' then num end) "��¯����",
sum(case when t.project = 'ͭ��֧��' then num end) "ͭ��֧��"
FROM TB2_LBB311 t WHERE t.kh_type = '�ۺϱ���' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY) LB31 ON 1 = 1
     WHERE �������� BETWEEN SUBSTR(P_DAY,1,6)||'01' AND  P_DAY) LZ1 
    LEFT JOIN
    (SELECT 3 AS ����,'�ܺϼ�' AS ��������,' ' AS ��������,'' AS ������,
           COUNT(1) AS ¯��,
           TRIM(TO_CHAR(SUM(������),'999999990.000')) AS ������,
           TRIM(TO_CHAR(SUM(��ˮ��),'999999990.000')) AS ��ˮ��,
           TRIM(TO_CHAR(ROUND(SUM(������)/SUM(��ˮ��)*100,2),'999999990.00')) AS �����յ���,
           round(sum(1 / ZB.MAX_TD_AGE), 2) �а�����,
           SUM(LZ65.B) ��©����,
           MAX(LB31.�ԽӴ���) �ԽӴ���
      FROM TB2_REPORT_LZ
       LEFT JOIN TB2_LLZ00 LZ00 ON LZ00.CAST_NO = TB2_REPORT_LZ.ұ�����
      LEFT JOIN (select max(td_age) AS "MAX_TD_AGE",
                                 t.cd AS "TD_CD",
                                 ROUND((TO_DATE(max(T.End_Time),
                                                'YYYY-MM-DD HH24:MI:SS') -
                                       TO_DATE(max(T.Begin_Time),
                                                'YYYY-MM-DD HH24:MI:SS')) * 24,
                                       2) AS "�а�����"
                            from TB2_LLZ60 t
                            left join tb2_llz00 z
                              on z.td_cd = t.cd
                           group by t.cd) ZB
                  ON ZB.TD_CD = LZ00.TD_CD
    LEFT JOIN (select distinct t.l2_ch_no,count(1) AS "B" from TB2_LLZ65 t group by t.l2_ch_no) LZ65 ON LZ65.L2_CH_NO = TB2_REPORT_LZ.¯��  
    LEFT JOIN (SELECT 
sum(case when t.project = '�ԽӴ���' then num end) "�ԽӴ���"
FROM TB2_LBB311 t WHERE t.kh_type = '�ۺϱ���' AND t.fac = 'LG2H' AND t.flag_id = '0'
and kh_date = P_DAY) LB31   ON 1 = 1
     WHERE �������� = P_DAY) LZ2 ON LZ2.�������� = LZ1.�������� AND LZ2.�������� = LZ1.��������		 
		 
     ORDER BY ����,������ 
	) tt  )
	;
	
	commit;
	
  OPEN P_CUR FOR	
    
		 select  t.t11	����,  t.t12	������,  t.t13	��������,  t.t14	��������,  t.t15	¯��,  t.t16	���ۼ�¯��,  t.t17	������,  t.t18	���ۼƸ�����,  t.t19	��ˮ��,  t.t20	���ۼƸ�ˮ��,  t.t21	�����յ���,  t.t22	���ۼ������յ���,  t.t23	����,  t.t24	ƽ�����,  t.t25	���ۼ��а�����,  t.t26	�а�����,  t.t27	�а���,  t.t28	���ۼ���©����,  t.t29	��©����,  t.t30	�����©����,  t.t31	������Ʒ��,  t.t32	ұ����,  t.t33	�ϸ���,  t.t34	����,  t.t35	����,  t.t36	����,  t.t37	������,  t.t38	�ع��յ���,  t.t39	���ۼƶԽӴ���,  t.t40	�ԽӴ���,  t.t41	���ۼ�����,  t.t42	����,  t.t43	����¯��,  t.t44	�����Խ�ʧ�ܴ���,  t.t45	�����Խ��ܴ���,  t.t46	�����Խӳɹ���,  t.t47	������������,  t.t48	�Ǽƻ�ͣ��,  t.t49	��¯��,  t.t50	��¯����  	
		 from tb2_lkb590 t  where t.id=1  order by t.t11,t.t12,t14
		 ;
		 
		 
  END REPROT1;




end PG2_LBB370;
/
