matriceH <- matrix(0, ncol=400, nrow=400)

for(i in 1:20){
	for(j in 1:20){
		matriceH[((i - 1) * 20 + j), ((i - 1) * 20 + j)] <- 2 #Signe dans l'hamiltonien
		if(i > 1){
			matriceH[((i - 1) * 20 + j), ((i - 2) * 20 + j)] <- -0.5
		}
		if(i < 20){
			matriceH[((i - 1) * 20 + j), (i * 20 + j)] <- -0.5
		}
		if(j > 1){
			matriceH[((i - 1) * 20 + j), ((i - 1) * 20 + j - 1)] <- -0.5
		}
		if(j < 20){
			matriceH[((i - 1) * 20 + j), ((i - 1) * 20 + j + 1)] <- -0.5
		}
	}
}

decomposition <- eigen(matriceH)

sortie <- data.frame("Energies"=decomposition$values)

write.table(sortie, "data/energiesPartLibres.txt", row.names=FALSE)