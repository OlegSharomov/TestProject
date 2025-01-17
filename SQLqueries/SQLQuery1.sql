DROP TABLE #users;
DROP TABLE #companies;
DROP TABLE #periods;
DROP TABLE #accruals;

CREATE TABLE #users (
id			INT PRIMARY KEY,
surname		VARCHAR(127)	NOT NULL,
name		VARCHAR(127)	NOT NULL,
patronymic	VARCHAR(127)
);
INSERT INTO #users
VALUES
(1, '������', '����', '��������'),
(2, '������', '����', '��������'),
(3, '�������', '������', '���������')
;
CREATE TABLE #companies (
id			INT PRIMARY KEY,
name		VARCHAR(255)	NOT NULL,
);
INSERT INTO #companies
VALUES
(1, '����������'),
(2, '������'),
(3, '���������')
;
CREATE TABLE #periods (
    id INT PRIMARY KEY,
    first_day_of_month DATE,
    last_day_of_month DATE
);

DECLARE @i INT = 1;
WHILE @i <= 3
BEGIN
    INSERT INTO #periods (id, first_day_of_month, last_day_of_month) VALUES
        (@i, DATEADD(MONTH, @i, '2021-01-12'), EOMONTH(DATEADD(MONTH, @i, '2021-01-12')));
        
    SET @i = @i + 1;
END;

SELECT * FROM #periods;
SELECT * FROM #users;
SELECT * FROM #companies;


CREATE TABLE #accruals (
id_company		INT,
id_user			INT,
id_period		INT,
accruals_sum	INT
);


DECLARE @min_company_id INT;
SET @min_company_id = (SELECT MIN(id) FROM #companies);
WHILE @min_company_id IS NOT NULL
BEGIN
	INSERT INTO #accruals (id_company, id_user, id_period, accruals_sum)
	SELECT c.id, u.id, p.id, CASE 
		WHEN u.surname = '������' THEN 500
		WHEN u.surname = '������' THEN 1000
		WHEN u.surname = '�������' THEN 1500
	END
	FROM #periods AS p
	CROSS JOIN #companies AS c  
	INNER JOIN #users AS u ON c.id = u.id
	WHERE c.id = @min_company_id;

	SET @min_company_id = (SELECT MIN(id) FROM #companies WHERE id > @min_company_id);
END;


SELECT * FROM #accruals;


SELECT c.name AS '�����������', CAST(CONCAT(u.surname, ' ', u.name, ' ', u.patronymic) AS VARCHAR(127)) AS '���', p.first_day_of_month AS '���� ������ �������', SUM(a.accruals_sum) AS '����� ����������'
FROM #accruals AS a
LEFT JOIN #companies AS c ON a.id_company = c.id
LEFT JOIN #users AS u ON a.id_user = u.id
LEFT JOIN #periods AS p ON a.id_period = p.id 
GROUP BY c.name, p.first_day_of_month, u.surname, u.name, u.patronymic, c.id
ORDER BY c.id;


SELECT c.name AS '�����������', SUM(accruals_sum) AS '����� ����������'
FROM #accruals AS a
LEFT JOIN #companies AS c ON a.id_company = c.id
LEFT JOIN #periods AS p ON a.id_period = p.id
WHERE p.id <= 2
GROUP BY c.name, c.id
ORDER BY c.id;
