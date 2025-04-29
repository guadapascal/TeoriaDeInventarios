#----------------------------------------------------------------
#Resolución Inventarios - Modelo básico
#Investigación Operativa - Facultad de Ingeniería - UNLZ
#----------------------------------------------------------------
#
#Contexto:
#Una empresa comercializa agujas hipodérmicas indoloras en los hospitales del Área Metropolitana de Buenos Aires (AMBA), insumo que debe ser importado ya que no se elabora en el país. 
#La demanda anual estimada es de 500.000 unidades, y el costo de adquisición para cada compra es de U$D 8.000; valor que no varía con el tiempo ni por volumen de compra. 
#El costo de mantenimiento por unidad es de U$D 1,5 por unidad por año. 
#La empresa pretende reducir sus costos de inventario mediante la determinación del número de agujas que debe obtener en cada orden.

#----------------------------------------------------------------
# Requiere cargar el paquete SCPerf: (Tools->Install Packages->SCPerf)
library(SCperf)
#En el siguiente link se encuentra la informaci?n sobre dicho paquete
#https://www.rdocumentation.org/packages/SCperf/versions/1.1.1
#----------------------------------------------------------------
d<-500000 #unidades/a?o
k<-8000 #$/orden
h<-1.5 #$/unidad/a?o
#
model<-EOQ(d,k,h)
model
#Q         T       TVC 
#73029.67      0.15 109544.51 
#Q = Cantidad económica de pedido
#T = Cantidad de períodos que dura el inventario ( tiempo de reposición)
#TVC = costo total variable
#
#a) Calcular la cantidad óptima de cada pedido
Q<-73029.67 #Respuesta: Cantidad óptima de cada pedido = 73030
Q
#[1] 73030
#Verificación: Q = raiz(2*k*d/h)
Q_verif<-sqrt(2*k*d/h)
Q_verif
#[1] 73030
#
#b) Calcular cada cuántos días se debe realizar un pedido
t<-0.15*365 #Respuesta: Tiempo entre pedidos: 55 d?as
t
#
#c) Calcular cuántas ordenes se deberán realizar en un año
options(digits = 4)
p_a?o<-d/Q #Respuesta: órdenes(pedidos) por a?o = 6.847 (7 pedidos por a?o)
p_a?o
#[1] 6.847
#
#d) Calcular el costo variable total de gestión de inventarios
TVC<-109544.51 #Respuesta: Costo total variable (anual) = 109545
TVC
#[1] 109545
#Verificación: TVC = k*(d/Q) + h*(Q/2)
TVC_verif<- k*p_a?o + h*(Q/2)    
TVC_verif
#[1] 109545