{\rtf1\ansi\ansicpg1250\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww16320\viewh13180\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #for file in *.png;do convert -intensity average -colorspace Gray $file $file; done \
\
\
im <- load.image('/Users/DawidKucharski/Library/Mobile Documents/com~apple~CloudDocs/Dokumenty/Projekty/Bankowa_2018/Hardness/Huta_odciski_foto_przyklady/B4J_D1.png')\
\
dimension<-dim(im)\
\
x1<-dimension[1]\
\
\
\
im_blur<-isoblur(im,2)\
plot(im_blur)\
\
\
row_blue<-imrow(im_blur, x1/2)\
plot(row_blue, type="l", col=1, ylab = 'I [j.u]', xlab = 'piksele')\
\
\
\
fit1<-smooth.spline(row_blue, y = NULL, w = NULL, df=30)\
lines(fit1,col='blue',lwd=2)\
\
pts<-peaks(fit1, minPH=0.2, minPW=8)\
\
points(pts,col="red",cex=1.5, pch=10)\
radius<-abs(pts[2,1]-pts[1,1])\
radius\
\
pdf(file = "/Users/DawidKucharski/Library/Mobile Documents/com~apple~CloudDocs/Dokumenty/Projekty/Bankowa_2018/Hardness/Huta_odciski_foto_przyklady/plots/B4J_D1_0deg_df30.pdf\'94, width=4, height=4)\
plot(im_blur)\
\
\
dev.off()\
\
\
pdf(file = "/Users/DawidKucharski/Library/Mobile Documents/com~apple~CloudDocs/Dokumenty/Projekty/Bankowa_2018/Hardness/Huta_odciski_foto_przyklady/plots/B4J_D1_plot_0deg_df30.pdf\'94, width=4, height=4)\
plot(row_blue, type="l", col=1, ylab = 'I [j.u]', xlab = 'piksele')\
lines(fit1,col='blue',lwd=1)\
points(pts,col="red",cex=1.5, pch=10)\
dev.off()}