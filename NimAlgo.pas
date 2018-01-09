ALGORITHME : jeu de Nim 2 joueurs
//But : écrire un algorithme qui permet à deux joueurs de jouer au jeu de Nim, qui consiste à un jeu où on a un tas de 21 allumettes. Chaque tour on en retire 1,2 ou 3, et le joueur qui retire
//la dernière a perdu 
//Principe : On demande à un joueur de choisir le nombre d'allumettes à retirer, puis on retire et on regarde le nombre restant, puis enfin on demande la même chose à l'autre joueur, jusqu'à ce
//ne reste plus aucune Alumette de disponible.Dans une boucle REPETER, on retire au tas d'allumettes la saisie de l'utilisateur, et on vérifiera que le nombre d'allumettes à retirer est correct.
//Entrées : nombres d'allumettes à retirer.
//Sorties : nombres d'allumettes restantes, et message en cas de défaite.

VAR :

retirerAllumettes, allumettes : ENTIER

DEBUT
//Jeu d'essai : on teste un tour de boucle.

retirerAllumettes<- 0
allumettes<- 21

ECRIRE "Bienvenue dans le jeu des allumettes. Chaque joueur joue à son tour en retirant 1,2 ou 3 allumettes, et celui qui retire la dernière allumette fait gagner son adversaire. Bonne chance !"
REPETER
	ECRIRE "Retirer 1, 2 ou 3 allumettes ?"

//Ici, l'utilisateur inscrit 3

	LIRE retirerAllumettes
		SI ((retirerAllumettes<1)OU(retirerAllumettes>3)) ALORS
		ECRIRE "Nombre d'allumettes retirées incorrect."
		SINON
		allumettes<-allumettes-retirerAllumettes
			SI (allumettes < 0) ALORS
				CAS retirerAllumettes PARMI
				2 : allumettes<- allumettes +2
					ECRIRE "Nombre d'allumettes retirées incorrect"
				3 : allumettes<- allumettes +3
					ECRIRE "Nombre d'allumettes retirées incorrect"
				FINCASPARMI
//on entre donc dans le cas 3, et on retire 3 à allumettes, donc il reste 18 comme valeur de allumettes

		FINSI
JUSQU A ((allumettes=1)OU (allumettes=0))
ECRIRE "Victoire de l'autre joueur, dommage !"
FIN
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALGORITHME : jeu de Nim vs ordinateur
//But : écrire un algorithme qui jouera contre un joueur au jeu de Nim.
//Principe : l'ordinateur choisira aléatoirement son jeu, et il ne pourra enlever qu'entre 1 et 3 bâtons (pas de triche), le joueur devra, quand à lui, est soumis également aux règles du jeu de Nim,
//et on vérifiera que le nombre d'allumettes à retirer est correct.
//Entrées : nombres d'allumettes à retirer pour l'utilisateur.
//Sorties : les actions de l'ordinateur, le nombre d'allumettes restantes et un message à la fin.

VAR : 
retirerAllumettes, allumettes : ENTIER
ordi : BOOLEEN

DEBUT
//Jeu d'essai : on teste un tour de boucle.
Aléatoire

retirerAllumettes<- 0
allumettes<- 21
ordi<- FAUX


ECRIRE "Bienvenue dans le jeu des allumettes.Vous allez affronter l'ordinateur. Chacun joue à son tour en retirant 1,2 ou 3 allumettes, et celui qui retire la dernière allumette fait gagner son adversaire. Bonne chance !"
REPETER
	ECRIRE "Retirer 1, 2 ou 3 allumettes ?"

//Ici l'utilisateur rentre 2.
	LIRE retirerAllumettes
		SI ((retirerAllumettes<1)OU(retirerAllumettes>3)) ALORS
		ECRIRE "Nombre d'allumettes retirées incorrect."
		SINON
		allumettes<-allumettes-retirerAllumettes
//On retire donc au nombre de base d'allumettes, soit 21, la saisie utilisateur, donc 21-2 = 19, et > 0 donc on entre pas dans le SI.
			SI (allumettes < 0) ALORS
				CAS retirerAllumettes PARMI
				2 : allumettes<- allumettes +2
					ECRIRE "Nombre d'allumettes retirées incorrect"
				3 : allumettes<- allumettes +3
					ECRIRE "Nombre d'allumettes retirées incorrect"
				FINCASPARMI

		FINSI

//Jusqu'ici, c'est pour permettre à l'utilisateur de jouer. Maintenant on fait jouer l'ordinatuer.
	REPETER
		REPETER 
			retirerAllumettes<- aléatoire(3)
		JUSQU A ((retirerAllumettes>0)ET(retirerAllumettes<4))
//Pour simuler l'aléatoire du choix de l'ordinateur.
		allumettes<-allumettes-retirerAllumettes 
			SI (allumettes <= 0) ALORS
//On écrit la commande "allumettes <= 0" pour éviter que l'ordi ne s'handicape lui même et retire la dernière allumette alors qu'il en reste plus d'une.
				CAS retirerAllumettes PARMI
				2 : allumettes<-allumettes +2
				3 : allumettes<-allumettes +3
			SINON
				ordi<- VRAI
	JUSQU A (ordi = VRAI)
	ECRIRE "Allumettes restantes : ", allumettes
//On ajoute un autre "REPETER" pour vérifier que l'ordinateur ne réduit pas le tas d'allumettes à un nombre négatif.
JUSQU A ((allumettes=1)OU (allumettes=0))
ECRIRE "Victoire de l'autre joueur, dommage !"
FIN

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALGORITHME : jeu de Nim par lignes
//But : écrire un algorithme qui permet à l'utilisateur de jouer contre l'ordinateur. Les règles changent légèrement du jeu de Nim classique, on classe les allummettes sur des lignes différenciées.
//On ajoute donc une notion de lignes en plus. De façon arbitraire on détermine les lignes et leur contenance en terme d'allumettes.					
