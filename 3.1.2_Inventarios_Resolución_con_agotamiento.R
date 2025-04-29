#----------------------------------------------------------------
#Resolución Inventarios - Modelo básico con agotamiento
#Investigación Operativa - Facultad de Ingeniería - UNLZ
#----------------------------------------------------------------
#
#Contexto:
#Una tienda de artículos para el hogar tiene una demanda anual aproximada de 18000 televisores. 
#El costo de colocación de un pedido es $ 25000 y el costo de mantenimiento en inventario es de $ 450 por unidad por año.

#----------------------------------------------------------------
# Requiere cargar el paquete SCPerf: (Tools->Install Packages->SCPerf)
library(SCperf)
#En el siguiente link se encuentra la informaci?n sobre dicho paquete
#https://www.rdocumentation.org/packages/SCperf/versions/1.1.1
#----------------------------------------------------------------
d<-18000 #unidades/a?o
k<-25000 #$/orden
h<-450 #$/unidad/a?o
#
model<-EOQ(d,k,h)
model
#Q          T        TVC 
#1414.214      0.079 636396.103 
#a) Calcular la cantidad y frecuencia óptima de cada pedido
Q<-1414 #Respuesta: Cantidad óptima de cada pedido = 1414 televisores
Q
#
t<-0.079*365 #Respuesta: Frecuencia de pedido: cada 29 d?as
t
#[1] 29
#
#b) Repetir los pasos del punto anterior si existiera un costo de penalización para cada pedio pendiente de $ 1500.
b<-1500 #$/unidad
model2<-EOQ(d,k,h,b)
model2
#        Q         T         S       TVC 
#1612.45      0.09    372.10 558156.31 
#Q2 = 1612 = Cantidad ?ptima de pedidos con agotamiento admitido
t2<-0.09*365 #Respuesta: Frecuencia de pedido: cada 33 d?as
t2
#[1] 33
#
#c) Cantidad máxima de pedidos pendientes
S<-372 #Respuesta: Cantidad máxima de pedidos pendientes = 372
S
#[1] 372