TABLE: costume_tb 
transaction_id (UUID) *PK* сама транзакция
id (UUID) костюм
lease_date (timestamp) когда взяли 
recv (text) кто взял
event_addres (text) место выдачи
costume_name (text) название костюма
condition (boolean) состояние

DATABASE: lab_one