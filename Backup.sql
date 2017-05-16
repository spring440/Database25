BACKUP DATABASE s17guest32
    TO DISK = '\s17guest25.Bak'
      WITH FORMAT,
	MEDIANAME = 'Z_SQLServerBackups',
        NAME = 'Backup of s17guest25';
GO