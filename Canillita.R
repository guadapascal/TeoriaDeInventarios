#Problema del canillita - Newsvendor problem
#
#Es un modelo matemático típico de la gestión de operaciones utilizado para determinar niveles óptimos de inventario
#Usualmente con precios fijos y demanda incierta de un producto perecedero.
#
#1 Período con demanda estocástica
#
#Decidir cuántos diarios comprar para stock
#antes de conocer cuál será la demanda
#
#Existen costos por ordenar demasiado y también por ordenar de menos.
#
#Es básicamente el problema de decidir una cantidad a comprar para una única órden
#que debe ser efectuada antes de observar la demanda
#
#Este problema es particularmente importante para ítems con
#altos grados de incertidumbre en la demanda y altos costos
#de mantenimiento en stock y desabastecimiento
#
#PENSADO PARA DISTRIBUCIÓN NORMAL, PERO SE PODRÍA MODIFICAR.
#
#
#
#When the demand is a random variable with normal distribution,
#the optimal stocking quantity that minimize the expected cost is: Q=m+z*sd,
#where z is known as the safety factor and Q - m=z*sd is known as the safety stock.
#'Note that the newsboy problem is not formulated in terms of per unit holding
#'# cost h=c-s and penalty cost b=p-c.
m<-100 #media
sd<-30 #Desvío standard
p<-4 #Precio unitario
c<-1 #Costo unitario
canillita<-Newsboy(m,sd,p,c)
canillita
#> canillita
#Q     SS   ExpC   ExpP     CV     CR     FR      z 
#120.23  20.23  38.13 261.87   0.30   0.75   0.96   0.67 
#
#Q	= Optimal order-up-to quantity
#SS = Safety stock
#ExpC = Expected cost
#ExpP = Expected profit
#CV = Coefficient of variation of the demand
#FR	= Fill rate, the fraction of demand served from stock
#z	= Safety factor
#
