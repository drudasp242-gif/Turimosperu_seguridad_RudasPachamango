USE TURISMOPERU_djrp;
GO
IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'djrp_admin')
    CREATE USER djrp_admin FOR LOGIN djrp_admin;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'djrp_vendedor')
    CREATE USER djrp_vendedor FOR LOGIN djrp_vendedor;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'djrp_analista')
    CREATE USER djrp_analista FOR LOGIN djrp_analista;
GO