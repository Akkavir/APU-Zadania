dataset <- read.csv("smartfony.csv")

normalize <- function(x) return (x / max(x))
dataset_normalized <- as.data.frame(lapply(dataset, normalize))
dataset_normalized <- dataset_normalized[sample(1:nrow(dataset_normalized)), ]

n <- nrow(dataset_normalized)
train_data_precent <- 0.7
train_data <- dataset_normalized[1:(n * train_data_precent),]
test_data <- dataset_normalized[(n * train_data_precent + 1):n,]

set.seed(2)
nn <- neuralnet(cena ~., data=train_data, hidden=c(100, 50 ,25), threshold=0.001, linear.output = F)
plot(nn)

result <- compute(nn, test_data[-which(names(test_data) == "cena")])
calculated_y <- result$net.result

actual_y <- test_data$cena * max(dataset$cena) # denormalizacja cen

plot(actual_y, calculated_y)

error <- sqrt(sum((actual_y - calculated_y)^2)/length(calculated_y))