CREATE SCHEMA IF not EXISTS Minimarket;
CREATE table `Minimarket`.`proveedor`(
`proveedor_id` int not null auto_increment,
`nombre` varchar(40) not null,
`rut` varchar(25) not null,
primary key (`proveedor_id`));

CREATE table `Minimarket`.`factura`(
`factura_id` int not null auto_increment,
`fecha` date not null,
primary key (`factura_id`));

CREATE table `Minimarket`.`detalle`(
`detalle_id` int not null auto_increment,
`cantidad` int not null,
primary key (`detalle_id`));


CREATE table `Minimarket`.`precioCompra`(
`precioCompra_id` int not null auto_increment,
`sku` int not null,
`valor` int not null,
primary key (`precioCompra_id`));


CREATE table `Minimarket`.`productoCompra`(
`productoCompra_id` int not null auto_increment,
`nombre` varchar(25) not null,
primary key (`productoCompra_id`));


CREATE table `Minimarket`.`tipoProducto`(
`tipoProducto_id` int not null auto_increment,
`categoria` varchar(25) not null,
`area` varchar(25) not null,
primary key (`tipoProducto_id`));


CREATE table `Minimarket`.`producto`(
`producto_id` int not null auto_increment,
`nombre` varchar(25) not null,
primary key (`producto_id`));


CREATE table `Minimarket`.`precioVenta`(
`precioVenta_id` int not null auto_increment,
`sku` int not null,
`valor` int not null,
primary key (`precioVenta_id`));


CREATE table `Minimarket`.`carroCompra`(
`carro_id` int not null auto_increment,
primary key (`carro_id`));


CREATE table `Minimarket`.`cliente`(
`cliente_id` int not null auto_increment,
`tipoCliente` varchar(15) not null,
`nombre` varchar(40) not null,
`rut` varchar(25) not null,
primary key (`cliente_id`));


CREATE table `Minimarket`.`boleta`(
`boleta_id` int not null auto_increment,
`fecha` date not null,
`precioTot` int not null,
primary key (`boleta_id`));


#############**FACTURA***########################## FK PROVEEDOR
alter table minimarket.factura add proveedor_id int not null;
ALTER TABLE minimarket.factura ADD CONSTRAINT facturaProveedor FOREIGN KEY(proveedor_id) REFERENCES minimarket.proveedor(proveedor_id);

alter table minimarket.factura add detalle_id int not null;
ALTER TABLE minimarket.factura ADD CONSTRAINT facturaDetalle FOREIGN KEY(detalle_id) REFERENCES minimarket.detalle(detalle_id);
select * from minimarket.factura;
#*****************************************************************************************************
##############*****DETALLE****################################### FK factura id, FK productocompra_id, FK preciocompra_id

alter table minimarket.detalle add productoCompra_id int not null;
ALTER TABLE minimarket.detalle ADD CONSTRAINT detalleProducto FOREIGN KEY(productoCompra_id) REFERENCES minimarket.productoCompra(productoCompra_id);
#***********************************************************************************************
##############***PRODUCTOCOMPRA*############################################## TIPOPRODUCTO_ID, DETALLE_ID
alter table minimarket.productoCompra add tipoProducto_id int not null;
ALTER TABLE minimarket.productoCompra ADD CONSTRAINT compraTipo FOREIGN KEY(tipoProducto_id) REFERENCES minimarket.tipoProducto(tipoProducto_id);
alter table minimarket.productoCompra add precioCompra_id int not null;
ALTER TABLE minimarket.productoCompra ADD CONSTRAINT productoCompraPrecio FOREIGN KEY(precioCompra_id) REFERENCES minimarket.precioCompra(precioCompra_id);

select * from minimarket.productoCompra;
#*****************************************************************************************
#####################***PRODUCTO***############################TIPOPRODUCTO_ID, PRECIOVENTA_ID
alter table minimarket.producto add tipoProducto_id int not null;
ALTER TABLE minimarket.producto ADD CONSTRAINT productoTipo FOREIGN KEY(tipoProducto_id) REFERENCES minimarket.tipoProducto(tipoProducto_id);

alter table minimarket.producto add precioVenta_id int not null;
ALTER TABLE minimarket.producto ADD CONSTRAINT productoPrecioV FOREIGN KEY(precioVenta_id) REFERENCES minimarket.precioVenta(precioVenta_id);
select * from minimarket.producto;
#******************************************************************************
##################***carroCompra****#############################PRODDUCTO_ID, CLIENTE_ID
alter table minimarket.carroCompra add producto_id int not null;
ALTER TABLE minimarket.carroCompra ADD CONSTRAINT carroProducto FOREIGN KEY(producto_id) REFERENCES minimarket.producto(producto_id);

alter table minimarket.carroCompra add cliente_id int not null;
ALTER TABLE minimarket.carroCompra ADD CONSTRAINT carroCliente FOREIGN KEY(cliente_id) REFERENCES minimarket.cliente(cliente_id);
select * from minimarket.carroCompra;
#************************************************************************************
################***BOLETA***#####################################CARRO_ID
alter table minimarket.boleta add carro_id int not null;
ALTER TABLE minimarket.boleta ADD CONSTRAINT boletaCarro FOREIGN KEY(carro_id) REFERENCES minimarket.carroCompra(carro_id);
select * from minimarket.boleta;


########**SE INSERTAN LOS PRECIOS DE VENTA*** ####################################
insert into minimarket.precioVenta(sku,valor) values(1,1500);
insert into minimarket.precioVenta(sku,valor) values(2,1300);
insert into minimarket.precioVenta(sku,valor) values(3,2000);
insert into minimarket.precioVenta(sku,valor) values(4,1000);
insert into minimarket.precioVenta(sku,valor) values(5,2000);
insert into minimarket.precioVenta(sku,valor) values(6,2300);
insert into minimarket.precioVenta(sku,valor) values(7,1700);
select * from minimarket.precioVenta;

########**SE INSERTAN LOS TIPOS DE PRODUCTOS*** ####################################
insert into minimarket.tipoProducto(categoria,area) values('fruta','ffvv');
insert into minimarket.tipoProducto(categoria,area) values('verdura','ffvv');
insert into minimarket.tipoProducto(categoria,area) values('limpieza','aseo y limpieza');
insert into minimarket.tipoProducto(categoria,area) values('cuidado personal','aseo y limpieza');
insert into minimarket.tipoProducto(categoria,area) values('abarrote','despensa');
insert into minimarket.tipoProducto(categoria,area) values('postres','congelado');
insert into minimarket.tipoProducto(categoria,area) values('refrescos','botilleria');
select * from minimarket.tipoproducto;

##########***SE INSERTAN PRODUCTOS ***#############################################
insert into minimarket.producto(nombre, tipoProducto_id, precioVenta_id) values('manzana kg',1,1);
insert into minimarket.producto(nombre, tipoProducto_id, precioVenta_id) values('tomate kg',2,3);
insert into minimarket.producto(nombre, tipoProducto_id, precioVenta_id) values('cloro 500ml',3,4);
insert into minimarket.producto(nombre, tipoProducto_id, precioVenta_id) values('shampoo 200ml',4,5);
insert into minimarket.producto(nombre, tipoProducto_id, precioVenta_id) values('arroz kg',5,2);
insert into minimarket.producto(nombre, tipoProducto_id, precioVenta_id) values('helado 1lts',6,6);
insert into minimarket.producto(nombre, tipoProducto_id, precioVenta_id) values('bebida 2lts',7,7);
select * from minimarket.producto;

##########***GENERO LA CONSULTA DE LOS PRODUCTOS CON SU VALOR Y TIPO DE LA SECCION DE PROVEEDOR***##########
SELECT productoCompra.nombre, precioCompra.valor, tipoProducto.categoria
FROM minimarket.productocompra
left JOIN minimarket.precioCompra on minimarket.productocompra.precioCompra_id = minimarket.preciocompra.precioCompra_id
left join minimarket.TipoProducto on minimarket.productocompra.tipoProducto_id = minimarket.tipoproducto.categoria;


##########***GENERO LA CONSULTA DE LOS PRODUCTOS CON SU VALOR Y TIPO DE LA SECCION DE VENTA***##########
SELECT producto_id,producto.nombre, precioventa.valor, tipoProducto.categoria
FROM minimarket.producto
left 	JOIN minimarket.precioVenta on minimarket.producto.precioVenta_id = minimarket.precioventa.precioventa_id
left 	join minimarket.tipoProducto on minimarket.producto.tipoProducto_id = minimarket.tipoproducto.tipoProducto_id;
    
select * from minimarket.precioVenta;
select * from minimarket.tipoproducto;
select * from minimarket.producto;
