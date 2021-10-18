/* Partie1 */


/* 
CodePays est une chaine de 3 caractères qui ne peut être nulle et clé primaire
Langue est une chaine de 30 caractères  ne peut être nulle et qui est une clé primaire
EstOfficielle est une liste de deux caractères T ou F non nuls dont la valeur par défaut est F
Pourcentage est un décimal de 4 chiffres et un après la virgule non nul dont la valeur par défaut est 0

Puisque plusieurs langues sont parlées dans le pays et une même langue parlée dans d'autres pays, on doit avoit pour chaque enregistrement le code du pays
 et la langue afin d'identifier de manière unique la langue parlée dans le pays. --3

*/

SELECT * FROM Pays; -- 4

SELECT Nom,Code,Continent FROM Pays; -- 5

SELECT Nom,Code,ChefEtat as TeteExecutif FROM Pays; -- 6

SELECT Distinct LanguePays.CodePays FROM LanguePays WHERE LanguePays.Langue='Français';--7
SELECT Distinct LanguePays.CodePays FROM LanguePays WHERE LanguePays.Langue='Anglais'; --8
S
SELECT Distinct LanguePays.CodePays FROM LanguePays WHERE LanguePays.Langue='Anglais' OR LanguePays.Langue='Français' ;--9




/*Partie 1.2*/

SELECT ChefEtat FROM Pays WHERE Nom='France'; -- 1
/* il s'agit de Jacques Chirac !*/

SELECT * FROM Pays WHERE TypeGouvernance LIKE '%France%';



/*Partie 2 */

/*2.1*/
SELECT Pays.Nom From Pays,Ville
WHERE Pays.Nom=Ville.Nom; --1

/*2.2*/

/* la condition de jointure est la clé étrangère de Ville qui correspond au code du pays */ --1

SELECT Ville.Nom AS 'Ville', Pays.Nom AS 'Pays'
FROM ville, Pays 
ORDER BY Pays.Nom; --2.a
/* On remarque que le résultat du produit cartésien associe une ville à tous les pays !*/


SELECT Ville.Nom AS 'Ville', Pays.Nom AS 'Pays'
FROM ville JOIN Pays 
ON Ville.CodePays=Pays.Code
ORDER BY Pays.Nom; --2b


SELECT Ville.Nom AS "Ville d'Amérique du sud"
FROM ville JOIN Pays 
ON Ville.CodePays=Pays.Code
WHERE Pays.Continent='Amérique du Sud'
ORDER BY Ville.Nom ASC--3;



/*Partie 2.3*/

SELECT Count(*) AS NombreVilles FROM Ville; --1
/* il y a 4079 villes*/

SELECT Count(*) AS NombrePays FROM Pays
WHERE Pays.Continent="Océanie";--2
/*il y a 28 pays*/

SELECT Count(Distinct LanguePays.Langue) AS NbLanguesOfficielles FROM LanguePays
WHERE LanguePays.EstOfficielle='T';--3
/*102 langues officielles sont parlées dans le monde*/


















