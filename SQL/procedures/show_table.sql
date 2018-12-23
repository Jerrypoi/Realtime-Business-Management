DROP PROCEDURE IF EXISTS show_table;
DELIMITER //
CREATE  PROCEDURE `show_table`(IN tab_name VARCHAR(40) )
BEGIN
 SET @t1 =CONCAT('SELECT * FROM ',tab_name );
 PREPARE stmt3 FROM @t1;
 EXECUTE stmt3;
 DEALLOCATE PREPARE stmt3;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS report_monthly_sale;
DELIMITER //
CREATE PROCEDURE report_monthly_sale(IN product_name VARCHAR(40))
BEGIN
  SET @t1 := CONCAT('SELECT pro.pid as id,',
  'pro.pname as name, DATE_FORMAT(pur.ptime,''%b'') as month, year(pur.ptime) as year,',
  'sum(pur.qty)as quantity, sum(pur.total_price) as total_price,',
  'sum(pur.total_price) / sum(pur.qty) as average_price FROM purchases pur,products pro where pro.pid ="', product_name,
  '" and pro.pid = pur.pid group by month(pur.ptime),year(pur.ptime) order by year(pur.ptime)');
  PREPARE stmt3 FROM @t1;
  EXECUTE stmt3;
  DEALLOCATE PREPARE stmt3;
END //
DELIMITER ;

