set.seed(123)
n <- 1000
b0 <- 1
b1 <- 2
pc <- rnorm(1000, 1, 0.25)
mu <- exp(b0 + b1 * pc)
index <- rpois(1000, mu)
data <- data.frame(pc = pc, index = index)

library(ggplot2)

# Data exploration
hist(pc)
hist(index)
class(pc)
class(index)
plot(index ~ pc)

ggplot(data = data, aes(x = pc, y = index)) + geom_point(size = 3) + 
  stat_smooth(method = lm)

ggplot(data = data, aes(x = pc, y = index)) + geom_point(size = 3) + 
  stat_smooth(method = glm,method.args = list(family = poisson(link = "log"))) 

x <- c()
for(i in 1 : 1000){
  x[i] <- ifelse(pc[i] < mean(pc), "Yes", "No")
}
table(x)

