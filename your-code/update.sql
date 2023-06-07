UPDATE customer
SET idcustomer  = 10001
WHERE idcustomer = 1001 ;

UPDATE customer
SET email = 'ppicasso@gmail.com'
WHERE idcustomer = 1001 ;

UPDATE customer
SET email = 'lincoln@us.gov' 
WHERE idcustomer = 20001;

UPDATE customer
SET email = 'hello@napoleon.me' 
WHERE idcustomer = 30001;


select * from customer