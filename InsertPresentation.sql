ALTER PROCEDURE insertPresentation @speaker VARCHAR(255), @presentation VARCHAR(255)
	BEGIN
		INSERT INTO Person VALUES (@speaker , @speaker , NULL , NULL , NULL , NULL , NULL );
		INSERT INTO Presentation VALUES (@presentation, NULL);
	END
END
		