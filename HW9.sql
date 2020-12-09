#1
START TRANSACTION; 
INSERT INTO sample.users SELECT * FROM shop.users WHERE id = 1;
COMMIT;

#2
CREATE VIEW prod_cat (prod_name, cat_name)
AS SELECT products.name, catalogs.name
FROM products
	LEFT JOIN catalogs
	ON products.catalog_id=catalogs.id;
	
select * from prod_cat;

#3.1
# ??????? Hello
DELIMITER //

DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello ()
RETURNS TEXT DETERMINISTIC
begin
	DECLARE @hours int, @greeting TEXT;
	SET @hours = HOUR(NOW());

  	IF @hours between 6 and 12 THEN
		set @greeting = "?????? ????";
  	ELSEIF @hours between 12 and 18 THEN
		set @greeting = "?????? ????";
	ELSEIF @hours between 18 and 0 THEN
		set @greeting = "?????? ?????";
	ELSEIF @hours between 0 and 6 THEN
		set @greeting = "?????? ????";
  	END IF;
  
  	return @greeting;
end//

CALL hello()

# 3.2

DELIMITER //
drop trigger if exists name_description;
CREATE TRIGGER name_description BEFORE INSERT ON products
FOR EACH ROW 
BEGIN
  IF NEW.name IS NULL AND NEW.description is NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Name or Description mustn not be NULL'; 
  END IF;
END//

