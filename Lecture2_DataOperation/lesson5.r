# An example of custom axes
x <- c(1:10) 
y <- x 
z <- 10/x 
opar <- par(no.readonly=TRUE)
par(mar=c(5, 4, 4, 8) + 0.1) 
plot(x, y, type="b", pch=21, col="red", yaxt="n", lty=3, ann=FALSE) 
lines(x, z, type="b", pch=22, col="blue", lty=2) 
axis(2, at=x, labels=x, col.axis="red", las=2) 
axis(4, at=z, labels=round(z, digits=2), 
    col.axis="blue", las=2, cex.axis=0.7)

# Legend Example
attach(mtcars)
boxplot(mpg~cyl, main="Milage by Car Weight",
yaxt="n", xlab="Milage", horizontal=TRUE, col=terrain.colors(3))
legend("topright", inset=.05, title="Number of Cylinders",
    c("4","6","8"), fill=terrain.colors(3), horiz=TRUE)
