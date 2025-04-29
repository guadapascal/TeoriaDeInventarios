#----------------------------------------------------------------
#Resolución Inventarios - Cantidad económica de fabricación
#Investigación Operativa - Facultad de Ingeniería - UNLZ
#----------------------------------------------------------------
# Requiere cargar el paquete SCPerf: (Tools->Install Packages->SCPerf)
library(SCperf)
#En el siguiente link se encuentra la información sobre dicho paquete
#https://www.rdocumentation.org/packages/SCperf/versions/1.1.1
#----------------------------------------------------------------
d<-15000000 #unidades/año
p<-2200000 #unidades/mes
p_año<-p*12
p_año #unidades/año
k<-85000 #$/orden de fabricación
h<-7 #$/unidad/mes
h_año<-h*12
h_año
c_unit<-4.5 #$/Unidad
#
model<-EPQ(d,p_año,k,h_año)
model
#q           t           T           I          TC 
#8.38455e+04 3.17597e-02 5.58970e-02 3.62060e+04 3.04131e+06 
#
#a)
q<-8.38455*10^4 
q
#[1] 83845.5
#Respuesta: El lote económico de producción es 83845 unidades
#
#b)
T_entre_lotes<-5.58970*10^(-2)*365
T_entre_lotes
#[1] 20.4024
#Respuesta: El tiempo entre órdenes de producción es de aproximadamente 20 días
#
#c)
cant_lotes<-d/q
cant_lotes
#[1] 17.89
#Respuesta: La cantidad de lotes que se realizarán por año es 17,89 lotes.
#
#d)
inv_max<-3.62060*10^4
inv_max
#[1] 36206
#Respuesta: El inventario máximo es 36206 unidades
#
#e)
CV<-3.04131*10^6 #El costo variable anual es $3.041.310
CV
#[1] 3041310
#
#f)
c_total<-c_unit*d+CV #El costo total anual es de $9.791.310
c_total