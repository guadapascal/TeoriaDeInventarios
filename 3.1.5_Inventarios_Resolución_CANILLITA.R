#----------------------------------------------------------------
#Resolución Inventarios - Demanda aleatoria 1 período: EL PROBLEMA DEL CANILLITA
#Investigación Operativa - Facultad de Ingeniería - UNLZ
#----------------------------------------------------------------
#
#Contexto:
#Un canillita tiene que realizar el pedido de diarios para el próximo domingo. 
#Según datos de semanas anteriores, sabe que la demanda promedio es 3100 unidades con desvío estándar 320. 
#El precio de venta es $ 250 y el costo es $ 110.
# a. ¿Cuántos diarios debería pedir?
# b. ¿Cuál debería ser su stock de seguridad?
# c. ¿Cuál sería su nivel de servicio?

#----------------------------------------------------------------
# Requiere cargar el paquete SCPerf: (Tools->Install Packages->SCPerf)
library(SCperf)
#En el siguiente link se encuentra la informaci?n sobre dicho paquete
#https://www.rdocumentation.org/packages/SCperf/versions/1.1.1
#----------------------------------------------------------------
#EL PROBLEMA DEL CANILLITA
m<-3100 #media
sd<-320 #Desvío standard
p<-250 #Precio unitario
c<-110 #Costo unitario
model<-Newsboy(m,sd,p,c)
model
#Q        SS      ExpC      ExpP        CV        CR        FR         z 
#3148.31     48.31  31553.74 402446.26      0.10      0.56      0.97      0.15 
#
#Q	= Optimal order-up-to quantity
#SS = Safety stock
#ExpC = Expected cost
#ExpP = Expected profit
#CV = Coefficient of variation of the demand
#FR	= Fill rate, the fraction of demand served from stock
#z	= Safety factor
#
#
#a) Respuesta: La cantidad a pedir es 3148
#b) Respuesta: El stock de seguridad debería ser 48 unidades
#c) El nivel de servicio sería del 97%
