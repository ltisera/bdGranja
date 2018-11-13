create index indiceClientePorFactura on Factura(cliente);

create index indiceProductosPorEmpaque on producto(cantidad);

create index indiceLocalidad on domicilio(localidad);

create index indiceGalponFecha on planilla(galpon, fecha);

create index indiceGallinasFecha on planilla(fecha);

create index indiceCantidadAlimentoConsumido on planilla(cantidadAlimento, fecha);

create index indicePlantelPorGenetica on plantel(genetica);

create index indiceGeneticaPorCabaña on genetica(cabaña);