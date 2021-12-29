source("code/fonctionsThermo.r")

energies <- read.table("data/energiesPartLibres.txt", header=TRUE)
energies <- energies$Energies

temperatures <- 1:298

partitions <- lapply(temperatures, calcul.partition, valeurs=energies)
partitions <- unlist(partitions)

write.table(partitions, "data/partitionsTemperatureFreePart.txt", row.names=FALSE, col.names=FALSE)
