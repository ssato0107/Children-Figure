#The following code was used for the analyses reported in:
#Sato, S., Fujii, S., & Savage, P. E. (2019). Automatic comparison of children and adult world songs supports a sensorimotor hypothesis of scale origin. Folk Music Analysis (FMA)


#The following packages must be installed/loaded
library(maps)

#set working drive
setwd("/Users/ShoichiroSato/Project/plotdata")


##Mapping approximate geographical distribution (Fig.1)

#Import data
chad<-read.csv("child_adult lonlat 100.csv",header=TRUE,row.names=1)
chad.x<-chad$Lon
chad.y<-chad$Lat

#USING MAPS, labeling according to singer's age
map("world", fill=TRUE, col="gray92", bg="white", ylim=c(-60, 90), mar=c(0,0,0,0)) 
points(chad.x,chad.y,col=NA, bg=c(rep("#2a9dfa",50), rep("#F48328",50)),pch=21, cex=1)
legend(-180,-25, c("Adult", "Children"),pch=21, pt.bg=c("#2a9dfa","#F48328"),col=NA,cex=.9)



##Example of measuring melodic range (Fig.2)

#import data
MR<-read.csv("92 Nature_ Plou i fa sol_annotations.csv",header=TRUE)

#Plot data
plot(MR[,1],MR[,1+1],type="l",xlim=c(0,17),xaxp=c(0, 17,17),ylim=c(220,440),tcl=-0.25, yaxt="n",
     bg="black",xlab="time (seconds)", ylab="Cents above 220 Hz (=A4)",col="green")
axis(side=2, at=c(220,240,260,280,300,320,340,360,380,400,420,440),labels=F,las=2)
axis(side=2,at=c(220,440),las=2)

#Drawing lines of melodic range
axis(side=2,tck=1.0,lty="dotted",col="red",las=2,at=c(248,387))



##example of tuned interval (Fig.4)

#import data
Confidence100<-read.csv("Exapmle child-adult.csv",header=TRUE)

#Plot data
plot(Confidence100[,1],Confidence100[,1+2],type="l", xaxs="i",xlim=c(-49,1150),ylim=c(0,2.5),xaxt="n", bg="black",xlab="Ptich class (cents)", ylab="Frequency of annotation (%)")
+axis(side=1, at=c(-50,0,100,200,300,400,500,600,700,800,900,1000,1100,1150),cex.axis=1,tck=1.0,lty="dotted",col="grey")
+axis(side=2,tck=1.0,lty="dotted",ylim=c(0,2.5),col="grey")
lines(Confidence100[,1],Confidence100[,1+2],type="l",col="#e67e22",lwd=1.5)
lines(Confidence100[,1],Confidence100[,1+1],type="l",col="#2980b9",lwd=1.5)

#legend
legend("topright", legend = c("Adult: Geaftai Bhaile Bui", "Children: Jong bura ii"), col = c("#2980b9","#d35400"), bty = "n", lty = 1:1,cex=0.8)



