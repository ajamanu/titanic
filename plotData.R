
# Plot of age data by Survived
ggplot(titanic_train, aes(Age)) +
      geom_histogram(binwidth = 10) +
      facet_wrap(~ Survived)


# Plot of age data by Survived
ggplot(titanic_train, aes(Age)) +
      geom_histogram(binwidth = 10) +
      facet_wrap(~ Survived)