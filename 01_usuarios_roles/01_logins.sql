USE master;
GO
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'djrp_admin')
    CREATE LOGIN djrp_admin
    WITH PASSWORD = 'Admin_2026',
         CHECK_POLICY = ON, CHECK_EXPIRATION = OFF,
         DEFAULT_DATABASE = TURISMOPERU_djrp;
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'djrp_vendedor')
    CREATE LOGIN djrp_vendedor
    WITH PASSWORD = 'Vendedor_2026',
         CHECK_POLICY = ON, CHECK_EXPIRATION = OFF,
         DEFAULT_DATABASE = TURISMOPERU_djrp;
IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = 'djrp_analista')
    CREATE LOGIN djrp_analista
    WITH PASSWORD = 'Analista_2026',
         CHECK_POLICY = ON, CHECK_EXPIRATION = OFF,
         DEFAULT_DATABASE = TURISMOPERU_djrp;