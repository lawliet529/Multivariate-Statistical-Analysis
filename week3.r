# Tuần 3: Ellipsoid #

library(ellipse)
library(MASS)
library(mnormt)

## Bài 1 ##

x <- rnorm(1200, 165, 21.2)
y <- rnorm(1200, 175, 25.2)
data <- data.frame(x, y)
S <- cov(data)
cm <- colMeans(data)

plot(ellipse(S, centre = cm))

## Bài 2 ##

S <- matrix(c(1, 0, 0, 1), nrow = 2)
cm <- c(21.2, 25.5)
X <- mvrnorm(1000, cm, S)

shapiro.test(X[, 1])
# 	Shapiro-Wilk normality test
#
# data:  X[, 1]
# W = 0.99855, p-value = 0.5905

shapiro.test(X[, 2])
# 	Shapiro-Wilk normality test
#
# data:  X[, 2]
# W = 0.99822, p-value = 0.3872

# p-value > 0.05
# => X có phân bố chuẩn

## Bài 3 ##

x <- seq(-10, 10, 0.1)
y <- seq(-10, 30, 0.2)
mu <- c(0, 0)
sigma <- matrix(c(1, 0, 0, 1), nrow = 2)
f <- function(x, y) dmnorm(cbind(x, y), mu, sigma)
z <- outer(x, y, f)

contour(x, y, z)