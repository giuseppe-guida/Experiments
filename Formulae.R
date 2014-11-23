

rm(list=ls()); #clear memeory
data_source = "C:/Users/g.guida/workspace/Linear_regression/ex1data1.txt";
ex1 = read.table(data_source, header = TRUE, sep = ",", dec = ".", colClasses = c("numeric", "numeric"));

#Source Matrix
data <- ex1;
#<- do.call(cbind, ex1);
summary(M);

plot(Profit ~ Population, data = ex1);
fit1 = lm(Profit ~ Population, ex1) #fits a linear model
plot(Profit ~ Population, data = ex1);
abline(fit1) #puts line on plot
fit2 = lm(Profit ~ I(1/2*Population^2) + Population, ex1) #fits a model with a quadratic term
fit2line = predict(fit2, data.frame(Population = -10:130))
par(new=T);
plot(-10:130, fit2line, type="l")

# replace coefficients with new values, use whole name which is coefficients:
fit$coefficients[2:3] <- c(5, 1)