boltzmann <- 3.167e-6 #hartree/K

calcul.partition <- function(valeurs, temperature){
	expo <- exp(-valeurs/(temperature * boltzmann))
	return(sum(expo))
}

calcul.energie <- function(valeurs, temperature){
	derivee <- (calcul.partition(valeurs, temperature + 1) - calcul.partition(valeurs, temperature - 1)) / 2 #Premier ordre, dT = 1
	energie <- 2 * boltzmann * temperature^2 * derivee
	energie <- energie + min(valeurs) #Energie de point 0
	return(energie)
}