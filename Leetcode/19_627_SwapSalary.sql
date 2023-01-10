UPDATE Salary SET sex = (
	CASE WHEN sex = 'm' THEN 'f' ELSE 'm' END);

    /*
    UPDATE [TABLE] SET[COLUMN] = '변경할 값' WHERE [조건]
    */