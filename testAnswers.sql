SQL> --WAQTD NAME AND SAL OF THE EMPLOYEES IF THE EMPLOYEES ARE WORKING IN DEPTNO 10 AND 20 AS A MANAGER OR A ANALYST(USING LOGICAL OPERATOR)
SQL> select ename,sal
  2  from
  3  emp
  4  where (deptno=10 or deptno = 20) and (JOB = 'MANAGER' OR JOB = 'ANALYST');

ENAME             SAL                                                                               
---------- ----------                                                                               
JONES            2975                                                                               
CLARK            2450                                                                               
SCOTT            3000                                                                               
FORD             3000                                                                               

SQL> -- WAQTD DETAILS OF THE EMPLOYEES IF THE EMPLOYEES NAME DOES NOT START WITH VOWELS ?
SQL> SELECT * FROM EMP
  2  WHERE ENAME NOT LIKE '%A',
  3  ENAME NOT LIKE '%E';
WHERE ENAME NOT LIKE '%A',
                         *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> SELECT * FROM EMP
  2  WHERE ENAME NOT LIKE '%A',
  3  ENAME NOT LIKE '%E';
WHERE ENAME NOT LIKE '%A',
                         *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> SELECT * FROM EMP
  2  WHERE ENAME NOT LIKE '%A',
  3  ENAME ENAME NOT LIKE '%E';
WHERE ENAME NOT LIKE '%A',
                         *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> SELECT * FROM EMP
  2  WHERE ENAME NOT LIKE '%A';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

14 rows selected.

SQL> SELECT ENAME FROM EMP
  2  WHERE ENAME NOT LIKE '%A';

ENAME                                                                                               
----------                                                                                          
SMITH                                                                                               
ALLEN                                                                                               
WARD                                                                                                
JONES                                                                                               
MARTIN                                                                                              
BLAKE                                                                                               
CLARK                                                                                               
SCOTT                                                                                               
KING                                                                                                
TURNER                                                                                              
ADAMS                                                                                               
JAMES                                                                                               
FORD                                                                                                
MILLER                                                                                              

14 rows selected.

SQL> SELECT EMP.*;
SELECT EMP.*
           *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT EMP.*
  2  FROM EMP;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7788 SCOTT      ANALYST         7566 19-APR-87       3000                    20               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7876 ADAMS      CLERK           7788 23-MAY-87       1100                    20               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

14 rows selected.

SQL> SPOOL OFF
