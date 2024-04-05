--tp 2 

--1. Création de la base de données gesCom2024
create database gesCom2024;

--2. Ouverture de la base de données
use gesCom2024;

--3. Création de la table client
create table client
(
idclient int identity(1,1),
nom varchar(50) not null,
prenom varchar(40),
tel varchar(20),
email varchar(30)
);

--4. Modification de la table client pour ajouter le champ adresse

alter table client add adresse varchar(100) not null;
--5. Modification de la table client pour modifier le champ adresse
alter table client alter column adresse varchar(150) not null;

--6. Modification de la table client pour supprimer le champ adresse
alter table client drop column adresse;

--7. Suppression de la table client
drop table client;

--8. Création de la table client avec une clé primaire : méthode 1 clé sur le champ
create table client
(
idclient int identity(1,1) primary key,
nom varchar(50) not null,
prenom varchar(40),
tel varchar(20),
email varchar(30)
);

--9. Suppression de la table client
drop table client;

--10. Création de la table client avec une clé primaire : méthode 2 clé sur une contrainte interne
create table client
(
idclient int identity(1,1),
nom varchar(50) not null,
prenom varchar(40),
tel varchar(20),
email varchar(30),
constraint pkClient primary key (idclient)
);

--11. Suppression de la table client
drop table client;

--12. Création de la table client avec une clé primaire : méthode 3 clé sur une contrainte externe
create table client
(
idclient int identity(1,1),
nom varchar(50) not null,
prenom varchar(40),
tel varchar(20),
email varchar(30));
alter table client
add constraint pkClient primary key (idclient);

--13. Suppression de la contrainte ajoutée
alter table client drop constraint pkclient;

--14. Créez la table produit avec une clé primaire sur le champ ref
ref varchar(50) --
designation varchar(150) not null
prix money --
Clé primaire sur un champ
Clé primaire sur une contrainte interne
Clé primaire sur une contrainte externe




--////////////////////////////////////////////////////////////////////////////////////////////////



use ecole


--1.	Cr�er une connexion �log1� avec le mot de passe �DBgroup@�
create login log1 with password='DBgroup@'

--2.	Ajouter dans cette base de donn�es un utilisateur �user1� pour la connexion �log1�.

create user user1 for login log1
--3.	Ouvrir une nouvelle instance de SQL Server Management Studio, et se connecter avec le compte log1 :

--4. Ex�cuter la requ�te suivante : select * from eleve, Que remarquez-vous
/*L'autorisation SELECT a �t� refus�e sur l'objet 'eleve', base de donn�es 'ecole', sch�ma 'dbo'.
l'utilisateur user1 n'a aucune persmission sur aucune base de donn�e */

--5.	Accorder � l�utilisateur �user1� uniquement la permission d�acc�der aux donn�es de la table eleve.
grant  select on classe to user1

--6.	V�rifier si l�utilisateur �user1� peut acc�der aux donn�es de la table classe.

--7.	Ex�cuter la requ�te suivante insert into classe values ('P107'), Que remarquez-vous ?
--L'autorisation INSERT a �t� refus�e sur l'objet 'classe', base de donn�es 'ecole', sch�ma 'dbo'

--8.	Accorder � l�utilisateur �user1� la permission d�ins�rer des donn�es dans la table classe.
grant  insert on classe to user1

--10.	Ex�cuter la requ�te suivante : select * from eleve, Que remarquez-vous ?
--L'autorisation SELECT a �t� refus�e sur l'objet 'eleve', base de donn�es 'ecole', sch�ma 'dbo'.

--11.	Retirer le droit d�ins�rer des donn�es dans la table classe pour l�utilisateur �user1�
revoke insert on classe from user1

--12.	Cr�er une connexion �log2� avec le mot de passe �DBgroup2@�
create login log2 with password='DBgroup2@'

--13.	Ajouter dans la base de donn�es �ecole� un utilisateur �user2� pour la connexion �log2�.
create user user2 for login log2

--14.	Accorder � l�utilisateur �user1� la permission d�acc�der aux donn�es de la table classe avec 
--l�option de passer ce droit � d�autre utilisateurs
grant  select on classe to user1 WITH GRANT OPTION;

--16.	V�rifier si l�utilisateur �user2� peut acc�der aux donn�es de la table classe. Que remarquez-vous ?
-- Oui l�utilisateur �user2� peut acc�der aux donn�es de la table classe

--17.	Retirer le droit de SELECT � l�utilisateur �user1� avec : Revoke select on classe to user1; 
--Que remarquez-vous ?  Il faut sp�cifier l'option CASCADE.
Revoke  select on classe to user1 ;
Revoke  select on classe to user1 cascade;

--19.	Cr�er une connexion �log3� avec le mot de passe �DBgroup3@� et ajouter dans la base de donn�es �TP5� 
--un utilisateur �user3� pour la connexion �log3�.
use tp5ex1
create login log3 with password='DBgroup3@'
create user user3 for login log3

--20.	Accorder � l�utilisateur �user3� la permission de modifier la colonne salary de la table employee.
grant update(salary) on employee to user3

--23. Effectuer une sauvegarde de la base de donn�es ecole, puis supprimer cette derni�re avec drop et 
--essayer de faire d�une restauration.

backup database ecole to disk= 'ecolebackup.bak';
drop database ecole;
RESTORE database ecole from disk = 'ecolebackup.bak';