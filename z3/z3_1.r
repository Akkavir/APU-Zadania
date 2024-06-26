# Tworzenie danych treningowych
traininginput <- as.data.frame(runif(100, min = 1, max = 100))
trainingoutput <- traininginput^3 + (2 * traininginput)

# Definicja funkcji normalizuj�cej
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

# ��czenie danych treningowych w jedn� ramk� danych
data <- cbind(traininginput, trainingoutput)
colnames(data) <- c("input", "output")

# Normalizacja danych
normalized <- as.data.frame(lapply(data, normalize))

# Podzia� na zbi�r treningowy i testowy
traindata <- normalized[1:80, ]
testdata <- normalized[81:100, ]

# Tworzenie sieci neuronowej
net.sqrt <- neuralnet(output ~ input, traindata, hidden = 10, threshold = 0.01, 
                      linear.output = TRUE)

# Wy�wietlanie informacji o sieci neuronowej
print(net.sqrt)

# Wykres sieci neuronowej
plot(net.sqrt, rep = "best")

# Obliczanie wynik�w dla zbioru testowego
net.results <- compute(net.sqrt, testdata)

# Wy�wietlanie wynik�w sieci neuronowej
print(net.results$net.result)

# Por�wnanie wynik�w rzeczywistych z przewidywanymi
comparison <- data.frame(actual = testdata[, 2], prediction = net.results$net.result)
comparison