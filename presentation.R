set.seed(123)
n <- 1000
b0 <- 1
b1 <- 2
pc <- rnorm(1000, 1, 0.25)
mu <- exp(b0 + b1 * pc)
index <- rpois(1000, mu)
data <- data.frame(pc = pc, index = index)

mod.glm <- glm(index ~ pc, family = poisson(link = "log"), data = data)

library(stargazer)
library(GGally)

ggcoef(mod.glm, exponentiate = FALSE) + 
  theme_minimal() +
  ggtitle("Model Coefficients Plot")

stargazer(mod.glm, type = "html", out = "model_summary.html")
browseURL("model_summary.html")
