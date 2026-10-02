USE TURISMOPERU_djrp;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'rol_vendedor_djrp' AND type = 'R')
    CREATE ROLE rol_vendedor_djrp;

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'rol_analista_djrp' AND type = 'R')
    CREATE ROLE rol_analista_djrp;
GO

-- Asignar usuarios a sus roles
ALTER ROLE rol_vendedor_djrp ADD MEMBER djrp_vendedor;
ALTER ROLE rol_analista_djrp ADD MEMBER djrp_analista;

-- El administrador gestiona la base de datos (respaldo, restauración y administración)
ALTER ROLE db_owner ADD MEMBER djrp_admin;
GO