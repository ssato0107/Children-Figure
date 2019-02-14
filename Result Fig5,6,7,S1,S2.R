#The following code was used for the analyses reported in:
#Sato, S., Fujii, S., & Savage, P. E. (2019). Automatic comparison of children and adult world songs supports a sensorimotor hypothesis of scale origin. Folk Music Analysis (FMA)


#The following packages must be installed/loaded
library(beeswarm)


##Plotting comparison of melodic range measurement (Fig.5)

#Import data
x<-c(1206,1473,1452,1302,873,1581,2132,520,1299,2007,1284,1059,1350,1503,1533,
     2035,1167,1200,1467,	1044,1680,690,1395,1575,576,615,1257,1242,1071,1395,
     657,1236,1239,780,1698,2403,1362,1200,2037,1512,1917,1674,1287,1200,1095,
     1290,1260,1461,1671,2156)
y<-c(786,957,792,696,423,704,1284,1200,702,1365,993,861,1107,669,429,	576,1404,
     525,902,702,821,819,1200,1020,1517,1200,1503,459,840,819,816,777,858,1200,
     1371,1200,662,1299,732,819,927,693,792,864,1173,1532,684,1050,771,1584)
 
#boxplot and scater plot
boxplot(x, y, ylim=c(0,3000), yaxp=c(0, 3000, 3),names=c("Adult songs (N=50)","Children songs (N=50)"),
        ps = 30,cex.lab=1.5,cex.axis=1.3,ylab="Melodic range (cents)",font.lab=2)
beeswarm(list(x, y), ylim=c(0,3000), col = c("#2980b9", "#e67e22"), method = "square", pch = 16, add = TRUE)




##Plotting comparison of number of scale degrees (Fig.6A)

#Import data
x <- cbind(c(3, 8, 24, 9, 5, 1), c(9, 15, 18, 6, 2, 0))

#Labeling
colnames(x) <- c("Adult (N=50)", "Children (N=50)")
rownames(x) <- c("3", "4", "5", "6", "7", "8")

#plotting distribution of number of scale degrees 
barplot(t(x), beside = TRUE, ylim=c(0,25),xlab = "number of scale degrees", ylab = "Frequency",
        col=c("#2980b9", "#e67e22"),legend=c("Adult songs (N=50)","Children songs (N=50)"),
        cex.axis=1.5,cex.names=1.3,cex.lab=1.5)




##Plotting comparison of averaged vocal imprecision (Fig.6B)

#Import data
Ave<-read.csv("average of imprecision.csv",header=TRUE)

#Setting average and standard deviation 
m.data<-c(0.661076464,0.594906702)
sd.data<-c(0.27217925,0.280178166)
yRoof=round(max(m.data+sd.data)*1.3, 1)　　 

#Plotting bar graph of averaged vocal imprecision
graph1<- barplot(m.data, ylim=c(0,yRoof),cex.lab=1.5,cex.names=1.3,col=c("#2980b9","#e67e22",8),
                 names=c("Adult songs","Children songs"),ylab="Average of vocal imprecision")

#Adding error bar
arrows(graph1,m.data,graph1,m.data+sd.data,angle=90,length=0.1,lwd=2)
arrows(graph1,m.data,graph1,m.data-sd.data,angle=90, length=0.1,lwd=2)




##Plotting comparison of tuning interval(Fig.7)

#Import data
Confidence100<-read.csv("100 childlen-adult data.csv",header=TRUE)

#Plotting average of tuned pitch class histram
plot(Confidence100[,1],Confidence100[,1+2],type="l",main="Comparison of children and adult songs (50+50)", 
     xaxs="i",xlim=c(-49,1150),ylim=c(0,1.5),xaxt="n", bg="black",xlab="Ptich class (cents)", ylab="Frequency of annotation (%)")

#Labeling
+axis(side=1, at=c(-50,0,100,200,300,400,500,600,700,800,900,1000,1100,1150),cex.axis=1,tck=1.0,lty="dotted",col="grey")
+axis(side=2,tck=1.0,lty="dotted",ylim=c(0,1.5),col="grey")

#Adding confidense interval
polygon(c(Confidence100[,1], rev(Confidence100[,1])) , c(Confidence100[,1+5] , rev(Confidence100[,1+7])) , col = "#3742fa30" , border = NA)
polygon(c(Confidence100[,1], rev(Confidence100[,1])) , c(Confidence100[,1+6] , rev(Confidence100[,1+8])) , col = "#ff634840" , border = NA)
lines(Confidence100[,1],Confidence100[,1+1],type="l",col="#2980b9",lwd=1.5)
lines(Confidence100[,1],Confidence100[,1+2],type="l",col="#e67e22",lwd=1.5)






##Supplemental Information

##Plotting Correlation of number od scale degrees and vocal imprecision (Fig.S1)

#Import data
imprecision<-read.csv("Corr.csv",header=TRUE)
y<- imprecision[,1]
x<- imprecision[,2]

#Plotting scattergraph
plot(x,y,type="n", xlab="Number of scale degrees", ylab="Singing imprecision",cex.lab=1.5,cex.axis=1.3,legend=c("Adult songs (N=50)","Children songs (N=50)"))
points(x,y, col=c(rep("#2980b9",50), rep("#e67e22",50)),pch=18, cex=1.7,legend=c("Adult songs (N=50)","Children songs (N=50)"))

#Regression line
abline(m,col="red")



##Plotting other comparison of tuning intervals  (Fig.S2)

#Import data
ConfidenceSUB<-read.csv("100 childlen-adult corpus - SE CI sub.csv",header=TRUE)

#Both Total
plot(ConfidenceSUB[,1],ConfidenceSUB[,1+1],type="l",main="Total: Both adult and children songs", xaxs="i",xlim=c(-48,1149),ylim=c(0,1.5),xaxt="n", bg="black",xlab="Ptich class (cents)", ylab="Frequency of annotation (%)")
+axis(side=1, at=c(-50,0,100,200,300,400,500,600,700,800,900,1000,1100,1150),cex.axis=1,tck=1.0,lty="dotted",col="grey")
+axis(side=2,tck=1.0,lty="dotted",ylim=c(0,1.5),col="grey")
polygon(c(ConfidenceSUB[,1], rev(ConfidenceSUB[,1])) , c(ConfidenceSUB[,1+11] ,rev(ConfidenceSUB[,1+12])) , col = '#03B30040' , border = NA)
lines(ConfidenceSUB[,1],ConfidenceSUB[,1+1],type="l",col="#03B300")
legend("topright", legend = c("Total(N=50+50)"),win.graph(7, 1) ,col = c("#03B300"),  lty = 1:1,cex=1,bty = "n",inset = c(0, 0.01))


#Adult Wester-NonWesern
plot(ConfidenceSUB[,1],ConfidenceSUB[,1+2],type="l",main="Aduld songs: Western vs Non-Western (N=50)", 
     xaxs="i",xlim=c(-49,1150),ylim=c(0,1.5),xaxt="n", bg="black",xlab="Ptich class (cents)", ylab="Frequency of annotation (%)")
+axis(side=1, at=c(-50,0,100,200,300,400,500,600,700,800,900,1000,1100,1150),cex.axis=1,tck=1.0,lty="dotted",col="grey")
+axis(side=2,tck=1.0,lty="dotted",ylim=c(0,1.5),col="grey")
polygon(c(ConfidenceSUB[,1], rev(ConfidenceSUB[,1])) , c(ConfidenceSUB[,1+13], rev(ConfidenceSUB[,1+14])) , col = "#2980b930" , border = NA)
polygon(c(ConfidenceSUB[,1], rev(ConfidenceSUB[,1])) , c(ConfidenceSUB[,1+15], rev(ConfidenceSUB[,1+16])) , col = "#e74c3c30" , border = NA)
lines(ConfidenceSUB[,1],ConfidenceSUB[,1+2],type="l",col="#2980b9",lwd=1.5)
lines(ConfidenceSUB[,1],ConfidenceSUB[,1+3],type="l",col="#c0392b",lwd=1.5)
legend("topright", legend = c("Western", "Non-Western"),win.graph(7, 1) ,col = c("#2980b9","#d35400"),  lty = 1:1,cex=0.9,bty = "n",inset = c(0, 0.01))

#Child Western-NonWestern
plot(ConfidenceSUB[,1],ConfidenceSUB[,1+4],type="l",main="Children songs: Western vs Non-Western (N=50)", 
     xaxs="i",xlim=c(-49,1150),ylim=c(0,1.5),xaxt="n", bg="black",xlab="Ptich class (cents)", ylab="Frequency of annotation (%)")
+axis(side=1, at=c(-50,0,100,200,300,400,500,600,700,800,900,1000,1100,1150),cex.axis=1,tck=1.0,lty="dotted",col="grey")
+axis(side=2,tck=1.0,lty="dotted",ylim=c(0,1.5),col="grey")
polygon(c(ConfidenceSUB[,1], rev(ConfidenceSUB[,1])) , c(ConfidenceSUB[,1+17] , rev(ConfidenceSUB[,1+18])) , col = "#3498db30" , border = NA)
polygon(c(ConfidenceSUB[,1], rev(ConfidenceSUB[,1])) , c(ConfidenceSUB[,1+19] , rev(ConfidenceSUB[,1+20])) , col = "#e74c3c30" , border = NA)
lines(ConfidenceSUB[,1],ConfidenceSUB[,1+4],type="l",col="#2980b9",lwd=1.5)
lines(ConfidenceSUB[,1],ConfidenceSUB[,1+5],type="l",col="#c0392b",lwd=1.5)
legend("topright", legend = c("Western", "Non-Western"),win.graph(7, 1) ,col = c("#2980b9","#d35400"),  lty = 1:1,cex=0.9,bty = "n",inset = c(0, 0.01))