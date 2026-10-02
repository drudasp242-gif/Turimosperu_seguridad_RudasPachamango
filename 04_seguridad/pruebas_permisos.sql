USE TURISMOPERU_djrp;
GO

/* =====================================================
   PRUEBAS DEL ANALISTA (solo lectura)
   ===================================================== */
EXECUTE AS USER = 'djrp_analista';
SELECT USER_NAME() AS usuario_actual;

-- Prueba 1: SELECT permitido
SELECT TOP 5 * FROM djrp.cliente;
SELECT TOP 5 * FROM djrp.pago;

-- Prueba 2: INSERT rechazado
BEGIN TRY
    INSERT INTO djrp.pago DEFAULT VALUES;
    PRINT 'ERROR: el analista pudo insertar (no debería)';
END TRY
BEGIN CATCH
    PRINT 'INSERT rechazado: ' + ERROR_MESSAGE();
END CATCH;

-- Prueba 3: UPDATE rechazado
BEGIN TRY
    UPDATE djrp.cliente SET id_persona = id_persona WHERE 1 = 0;
    PRINT 'ERROR: el analista pudo actualizar (no debería)';
END TRY
BEGIN CATCH
    PRINT 'UPDATE rechazado: ' + ERROR_MESSAGE();
END CATCH;

-- Prueba 4: DELETE rechazado
BEGIN TRY
    DELETE FROM djrp.cliente WHERE 1 = 0;
    PRINT 'ERROR: el analista pudo eliminar (no debería)';
END TRY
BEGIN CATCH
    PRINT 'DELETE rechazado: ' + ERROR_MESSAGE();
END CATCH;

REVERT;
GO

/* =====================================================
   PRUEBAS DEL VENDEDOR
   ===================================================== */
EXECUTE AS USER = 'djrp_vendedor';
SELECT USER_NAME() AS usuario_actual;

-- Prueba 5: SELECT permitido
SELECT TOP 5 * FROM djrp.reserva;

-- Prueba 6: DELETE rechazado
BEGIN TRY
    DELETE FROM djrp.cliente WHERE 1 = 0;
    PRINT 'ERROR: el vendedor pudo eliminar (no debería)';
END TRY
BEGIN CATCH
    PRINT 'DELETE rechazado: ' + ERROR_MESSAGE();
END CATCH;

-- Prueba 7: no puede acceder a pagos (no tiene permiso)
BEGIN TRY
    EXEC('SELECT TOP 1 * FROM djrp.pago;');
    PRINT 'ERROR: el vendedor pudo leer pagos (no debería)';
END TRY
BEGIN CATCH
    PRINT 'SELECT en pago rechazado: ' + ERROR_MESSAGE();
END CATCH;

-- Prueba 8: no puede crear usuarios
BEGIN TRY
    CREATE USER prueba_no_permitida WITHOUT LOGIN;
    PRINT 'ERROR: el vendedor pudo crear usuarios (no debería)';
END TRY
BEGIN CATCH
    PRINT 'CREATE USER rechazado: ' + ERROR_MESSAGE();
END CATCH;

REVERT;
GO