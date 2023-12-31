SELECT 
  a.DATE AS DATE
  ,d.ID AS DEPARTMENT_ID
  ,SUM(a.VACATION) AS ON_VACATIONS

FROM
  ATTENDANCE AS a INNER JOIN EMPLOYEE AS e ON
    a.EMP_ID = e.ID
  INNER JOIN TEAM AS t ON
    e.GROUP_ID = t.ID
  INNER JOIN DEPARTMENT AS d ON
    t.DEPARTMENT_ID = d.ID

GROUP BY a.DATE,d.ID;