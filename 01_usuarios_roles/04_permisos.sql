USE TURISMOPERU_djrp;
GO

/* ========== rol_vendedor_djrp ========== */
GRANT SELECT, INSERT ON djrp.cliente      TO rol_vendedor_djrp;
GRANT SELECT, INSERT ON djrp.reserva      TO rol_vendedor_djrp;
GRANT SELECT         ON djrp.alojamiento  TO rol_vendedor_djrp;
GRANT SELECT         ON djrp.habitacion   TO rol_vendedor_djrp;

-- Denegar explícitamente lo que no debe hacer
DENY DELETE ON djrp.cliente TO rol_vendedor_djrp;
DENY DELETE ON djrp.reserva TO rol_vendedor_djrp;

-- No puede administrar usuarios, roles ni backups
DENY ALTER ANY USER  TO rol_vendedor_djrp;
DENY ALTER ANY ROLE  TO rol_vendedor_djrp;
DENY BACKUP DATABASE TO rol_vendedor_djrp;
DENY BACKUP LOG      TO rol_vendedor_djrp;

/* ========== rol_analista_djrp ========== */
GRANT SELECT ON djrp.cliente         TO rol_analista_djrp;
GRANT SELECT ON djrp.reserva         TO rol_analista_djrp;
GRANT SELECT ON djrp.pago            TO rol_analista_djrp;
GRANT SELECT ON djrp.alojamiento     TO rol_analista_djrp;
GRANT SELECT ON djrp.habitacion      TO rol_analista_djrp;
GRANT SELECT ON djrp.paquete         TO rol_analista_djrp;
GRANT SELECT ON djrp.lugar_turistico TO rol_analista_djrp;

-- Solo lectura: se niega modificar cualquier tabla del esquema
DENY INSERT, UPDATE, DELETE ON SCHEMA::djrp TO rol_analista_djrp;

DENY ALTER ANY USER  TO rol_analista_djrp;
DENY ALTER ANY ROLE  TO rol_analista_djrp;
DENY BACKUP DATABASE TO rol_analista_djrp;
DENY BACKUP LOG      TO rol_analista_djrp;
GO