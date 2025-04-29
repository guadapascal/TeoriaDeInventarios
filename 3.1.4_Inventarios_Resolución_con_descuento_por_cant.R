#----------------------------------------------------------------
#Resolución Inventarios - Modelo básico con descuento por cantidad
#Investigación Operativa - Facultad de Ingeniería - UNLZ
#----------------------------------------------------------------
#
#Contexto:
#La gerencia general de una papelera ha decidido, por cuestiones de simplicidad, realizar compras mensuales de papel libro de 70 gramos, ya que infiere que es lo más conveniente por tener demanda constante en el tiempo. 
#Esta demanda es de 10 toneladas mensuales. Sin embargo, el área de compras le sugiere cambiar la política de abastecimiento, señalando que esto disminuiría los costos totales de gestión de inventarios. 
#La gerencia le pide a compras que elabore una propuesta en donde se demuestre que efectivamente los costos bajarían, y cuánto dinero se ahorraría anualmente. 
#El precio de compra de la tonelada es $ 2.300.000, el costo de pedido es $ 500.000 y el costo de mantenimiento se estima en un 15% del valor de la tonelada. 
#Además, existe un costo de $55.000 en concepto de alquiler de espacio físico.

#----------------------------------------------------------------
# Requiere cargar el paquete SCPerf: (Tools->Install Packages->SCPerf)
library(SCperf)
#En el siguiente link se encuentra la informaci?n sobre dicho paquete
#https://www.rdocumentation.org/packages/SCperf/versions/1.1.1
#----------------------------------------------------------------
d<-120 #ton/a?o
k<-500000 #$/orden
c_alq<-55000 #$
p_ton<-2300000 #$/Unidad
h<-p_ton*0.15+c_alq #$/ton/a?o
h
model<-EOQ(d,k,h)
model
#Q          T        TVC 
#17.32       0.14 6928203.23 
#a) Calcular la cantidad y frecuencia óptima de cada pedido.
0.14*365
#[1] 51
#Respuesta: la cantidad y frec. óptima de pedido es 17.32 toneladas cada 51 días
#
#b) Calcular cuánto se ahorraría la empresa por costos de gestión de inventarios con la nueva política propuesta por compras. 
#Ayuda: El costo por gestión de inventarios es el costo total variable; no el costo de la cantidad por el precio de compra.
cv_antes<-k*12+h*(10/2)
cv_antes
#[1] 8000000
cv_nuevo<-6928203.23
cv_nuevo
#[1] 6928203
#
ahorro<-cv_antes-cv_nuevo
ahorro
#[1] 1071797
options(digits = 4)
ahorro/cv_antes
#[1] 0.134
#Respuesta: La empresa se ahorrará casi $1.1 millones, equivalente al 13,4% 
#
#c) Calcular el costo total anual
ct<-p_ton*d+6928203.23 #Respuesta: El costo total anual es $282.928.203
ct
#[1] 282928203
#
#d) El área de compras también podría negociar un descuento del 5% en el valor de la tonelada si la empresa decidiera realizar pedidos por 50 toneladas. 
#Esto requeriría duplicar el espacio físico necesario y, en consecuencia, duplicar los costos fijos de alquiler de espacio de almacenaje. 
#¿Es conveniente esta alternativa?
p_ton2<-p_ton*0.95
c_alq2<-c_alq*2
h2<-p_ton2*0.15+c_alq2
ct2<-p_ton2*d+k*(d/50)+h2*(50/2)
ct2
#[1] 274343750
ahorro2<-ct-ct2
ahorro2
#[1] 8584453
ahorro2/ct
#[1] 0.03034
#Respuesta: Sí, esta alternativa es conveniente, ya que se ahorrarán $8.584.453
#Este valor equivale a un 3,034% de los costos totales anuales
#
#e) Si la empresa quisiera realizar compras anuales (es decir, de 120 toneladas), podría acceder a un descuento del 10%, pero los costos por espacio físico se multiplicarían por 6 respecto al valor inicial. 
#¿Es conveniente esta alternativa?
p_ton3<-p_ton*0.90
c_alq3<-c_alq*6
h3<-h<-p_ton3*0.15+c_alq3
h3
ct3<-p_ton3*d+k*(d/120)+h3*(120/2)
ct3
#[1] 287330000
ahorro3<-ct-ct3
ahorro3
#[1] -4401797
ahorro3/ct
#[1] -0.01556
#Respuesta: No, no es conveniente realizar una compra anual, ya que el costo
#total anual se elevarían en un 1.556%, lo que equivale una pérdida de más de
#$4 millones.