--update interface record for X31R

CREATE PROCEDURE z_reverseX31( @ddsn 	char(8)	)
AS

DECLARE 
	@rowcount	int

SELECT @rowcount = 	(
	SELECT COUNT(*) 
	FROM di03_outgoing_intfc
	WHERE key_1 = @ddsn AND SUBSTRING(data_1, 137, 1) LIKE 'N'
)

IF (@rowcount) = 1
BEGIN
	UPDATE di03_outgoing_intfc
	SET	data_1 = SUBSTRING(data_1, 1, 136) + 'Y' + SUBSTRING(data_1, 138, 117)
	WHERE key_1 = @ddsn AND SUBSTRING(data_1, 137, 1) LIKE 'N'
END
ELSE 
	IF (@rowcount) > 1
		PRINT 'Multiple rows found in interface for DDSN %1!! Update aborted.', @ddsn
	ELSE
		PRINT 'No row found in interface for DDSN %1!. No changes made.', @ddsn