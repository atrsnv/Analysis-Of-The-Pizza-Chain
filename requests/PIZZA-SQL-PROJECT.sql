USE sales;

SELECT * FROM pizza;

ALTER TABLE pizza
ALTER COLUMN total_price FLOAT
ALTER TABLE pizza
ALTER COLUMN quantity INT;



-- ������� ����� �������� ���� �������?

SELECT
	SUM(quantity) AS '���������� ��������� �����'
FROM 
	pizza;



-- ����� ���������� �������

SELECT
	COUNT(DISTINCT order_id) AS '����� ����� �������'
FROM
	pizza;


-- C������ ��������� ������

SELECT 
	SUM(total_price) / COUNT(DISTINCT order_id) AS 'C������ ��������� ������'
FROM
	pizza;



-- ����� c�������� �������

SELECT 
	SUM(total_price) AS '����� ��������� �������' 
FROM 
	pizza;

-- ������� ���������� �������� �� �����

SELECT 
	SUM(quantity) / COUNT(DISTINCT order_id) AS '������� ���������� ��� �� �����'
FROM pizza;

-- ���������� ������� �� ���� ������

SELECT
	DATENAME(weekday, order_date) AS '���� ������',
	COUNT(DISTINCT order_id) AS '���������� �������'
FROM 
	pizza
GROUP BY
	DATENAME(weekday, order_date)
ORDER BY '���������� �������';


-- ���������� ������� �� �����

SELECT
	DATEPART(HOUR, order_time) AS '����� ������', 
	COUNT(DISTINCT order_id) AS '���������� �������'
FROM 
	pizza
GROUP BY
	DATEPART(HOUR, order_time)
ORDER BY
	'����� ������'
	
-- ����� ���� ���� ��������� �����, � ����� ����?

SELECT
	pizza_category AS '��� �����',
	SUM(quantity) AS '���������� ������'
FROM 
	pizza
GROUP BY 
	pizza_category
ORDER BY 
	'���������� ������' ASC;


-- ����� ����� ��������� ����� �����?

SELECT
	TOP 6 pizza_name AS '�������� �����',
	SUM(quantity) AS '���������� ������'
FROM 
	pizza
GROUP BY
	 pizza_name
ORDER BY '���������� ������' DESC;

-- ����� ����� ��������� ���� �����?

SELECT
	TOP 6 pizza_name AS '�������� �����',
	SUM(quantity) AS '���������� ������'
FROM 
	pizza
GROUP BY
	 pizza_name
ORDER BY '���������� ������' ASC;