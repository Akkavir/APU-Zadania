
# Define the criteria
criteria <- c("performance", "quality", "style", "price")

# Pairwise comparison matrix for criteria
criteria_matrix <- matrix(1, nrow = length(criteria), ncol = length(criteria))
rownames(criteria_matrix) <- colnames(criteria_matrix) <- criteria

# Populate the matrix with pairwise comparisons
criteria_matrix["performance", "quality"] <- 3   # Example values, you can adjust these based on actual comparisons
criteria_matrix["performance", "style"] <- 2
criteria_matrix["performance", "price"] <- 5
criteria_matrix["quality", "style"] <- 4
criteria_matrix["quality", "price"] <- 3
criteria_matrix["style", "price"] <- 2

# Reflect the values across the diagonal
criteria_matrix <- reflect(criteria_matrix)

# Calculate the weights for criteria
criteria_weights <- calc_w(criteria_matrix)

# Print the criteria weights
criteria_weights



# Define the smartphones and their attributes
smartphones <- c("Samsung S23", "Samsung S24", "Samsung S21 FE", "Samsung M15", "Samsung M55", "Samsung A54", "Samsung A55", "Samsung A15", "Samsung M34", "Samsung A34")
attributes <- data.frame(
  display = c(6.1, 6.2, 6.4, 6.5, 6.7, 6.4, 6.6, 6.5, 6.5, 6.6),
  ram = c(8, 8, 6, 4, 8, 8, 8, 4, 6, 6),
  rom = c(256, 128, 128, 128, 128, 128, 128, 128, 128, 128),
  camera = c(50, 50, 32, 50, 50, 50, 50, 50, 50, 48),
  price = c(3000, 3800, 1900, 700, 1700, 1700, 2100, 900, 1000, 1300)
)
rownames(attributes) <- smartphones

# Define the criteria weights (replace with actual values)
criteria_weights <- list(
  performance = 0.4,
  quality = 0.3,
  style = 0.2,
  price = 0.1
)

# Calculate overall scores for each smartphone
overall_scores <- rowSums(attributes * sapply(criteria_weights, rep, nrow(attributes)))

# Rank smartphones based on overall scores
ranked_smartphones <- smartphones[order(overall_scores, decreasing = TRUE)]

# Print the ranked smartphones
ranked_smartphones



