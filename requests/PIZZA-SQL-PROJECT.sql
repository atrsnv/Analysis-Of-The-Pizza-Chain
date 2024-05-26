USE sales;

SELECT * FROM pizza;

ALTER TABLE pizza
ALTER COLUMN total_price FLOAT
ALTER TABLE pizza
ALTER COLUMN quantity INT;



-- Сколько всего продукта было продано?

SELECT
	SUM(quantity) AS 'Количество проданной пиццы'
FROM 
	pizza;



-- Общее количество заказов

SELECT
	COUNT(DISTINCT order_id) AS 'Общее число заказов'
FROM
	pizza;


-- Cредняя стоимость заказа

SELECT 
	SUM(total_price) / COUNT(DISTINCT order_id) AS 'Cредняя стоимость заказа'
FROM
	pizza;



-- Общая cтоимость заказов

SELECT 
	SUM(total_price) AS 'Общая стоимость заказов' 
FROM 
	pizza;

-- Среднее количество продукта за заказ

SELECT 
	SUM(quantity) / COUNT(DISTINCT order_id) AS 'Среднее количество пиц за заказ'
FROM pizza;

-- Количество заказов по дням недели

SELECT
	DATENAME(weekday, order_date) AS 'День заказа',
	COUNT(DISTINCT order_id) AS 'Количество заказов'
FROM 
	pizza
GROUP BY
	DATENAME(weekday, order_date)
ORDER BY 'Количество заказов';


-- Количество заказов по часам

SELECT
	DATEPART(HOUR, order_time) AS 'Время заказа', 
	COUNT(DISTINCT order_id) AS 'Количество заказов'
FROM 
	pizza
GROUP BY
	DATEPART(HOUR, order_time)
ORDER BY
	'Время заказа'
	
-- Какие типы пицц продаются лучше, а какие хуже?

SELECT
	pizza_category AS 'Тип пиццы',
	SUM(quantity) AS 'Количество продаж'
FROM 
	pizza
GROUP BY 
	pizza_category
ORDER BY 
	'Количество продаж' ASC;


-- Какие пиццы продаются лучше всего?

SELECT
	TOP 6 pizza_name AS 'Название пиццы',
	SUM(quantity) AS 'Количество продаж'
FROM 
	pizza
GROUP BY
	 pizza_name
ORDER BY 'Количество продаж' DESC;

-- Какие пиццы продаются хуже всего?

SELECT
	TOP 6 pizza_name AS 'Название пиццы',
	SUM(quantity) AS 'Количество продаж'
FROM 
	pizza
GROUP BY
	 pizza_name
ORDER BY 'Количество продаж' ASC;