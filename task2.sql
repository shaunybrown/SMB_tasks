CREATE TABLE noRowNumber AS
SELECT * FROM testDataset1
UNION ALL 
SELECT * FROM testDataset2;

CREATE TABLE withRowNumber AS SELECT rowid AS row_number, * FROM noRowNumber ORDER BY Predictions DESC;
CREATE TABLE rankedWithRowNumber AS SELECT rowid AS rank, * FROM withRowNumber;

-- HAD TO USE OF AN OLD VERSION OF SQLITE (3.15)(I ONLY HAD MY WORK LAPTOP AVAILABLE) 
-- SO COULD NOT USE RANK() AND ROW_NUMBER() WINDOW QUERYS AS ONLY BECOME AVAILABLE IN SQLITE 3.25

-- If able to use window query something like

CREATE TABLE withRowNumber AS SELECT rowid AS row_number, * FROM noRowNumber;
CREATE TABLE rankedWithRowNumber AS SELECT * FROM (SELECT *, RANK() OVER (ORDER BY Predictions DESC) rank FROM withRowNumber);
