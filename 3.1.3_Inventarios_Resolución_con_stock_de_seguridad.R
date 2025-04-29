#----------------------------------------------------------------
#Resolución Inventarios - Modelo básico con stock de seguridad
#Investigación Operativa - Facultad de Ingeniería - UNLZ
#----------------------------------------------------------------
#
#Contexto:
#Un famoso restaurante posee un vino de la casa de marca propia, el cual es pedido a una bodega ubicada en Mendoza. 
#Según los datos históricos, la demanda estimada es de 4500 unidades por año, con un desvío estándar de 200 unidades. 
#El costo de almacenamiento por unidad es de $ 15,5 por año y el costo de ordenar una compra es de $ 5300, incluyendo el envío. 
#El compromiso del proveedor es que el insumo es entregado a los 5 días desde que se coloca el pedido, y cada vino tiene un costo unitario de $ 80 y se vende a $ 210. 
#El restaurante trabaja de miércoles a domingos y cierra 15 días al año.

#----------------------------------------------------------------
# Requiere cargar el paquete SCPerf: (Tools->Install Packages->SCPerf)
library(SCperf)
#En el siguiente link se encuentra la informaci?n sobre dicho paquete
#https://www.rdocumentation.org/packages/SCperf/versions/1.1.1
#----------------------------------------------------------------
d<-4500 #unidades/a?o
sd<-200 #unidades
k<-5300 #$/orden
h<-15.5 #$/unidad/a?o
c_unit<-80 #$/Unidad
p_unit<-210 #$/Unidad
LT<-5 #D?as (Lead Time)
SL<-0.95 #Nivel de servicio
semanas_a?o<-50
dias_semana<-5
dias_a?o<-semanas_a?o*dias_semana
dias_a?o
#[1] 250
#
model<-EOQ(d,k,h)
model
#Q        T      TVC 
#1754.26     0.39 27190.99 
#a) Calcular la cantidad y frecuencia óptima de cada pedido. Ayuda: Es necesario calcular la cantidad de días al año que abre el restaurante.
0.39*dias_a?o
#Respuesta: la cantidad y frec. óptima de pedido es 1754 unidades cada 98 días.
#
#b) Calcular el stock de seguridad si se acepta tener un 5% de clientes insatisfechos por no disponer del vino de la casa (nivel de servicio = 0.95).
s_seg<-SS(SL,sd,LT) #Respuesta: El stock de seguridad es 736 unidades
s_seg
#[1] 736
#
#c) Calcular el punto de reorden
d_diaria<-d/dias_a?o
d_diaria #unidades/día
p_reorden<-ROP(SL,d_diaria,sd,LT) #Respuesta: El punto de reorden es 826 unid.
p_reorden
#[1] 826
#
#d) Calcular los costos totales anuales
c_tot<-c_unit*d+27190.99 #Respuesta: El costo total anual es $387.191
c_tot
#[1] 387191
#verificaci?n TVC = k*(d/Q) + h*(Q/2)
#Q<-1754.26
#k*(d/Q)+h*(Q/2)
#
#e) Calcular los beneficios totales anuales
beneficio_tot<-p_unit*d-c_tot #Respuesta: El beneficio total es $557.809
beneficio_tot
#[1] 557809