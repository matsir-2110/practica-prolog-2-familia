%Facts

% Padres
padre(juan, maria).
padre(juan, pedro).
padre(carlos, sofia).
padre(carlos, lucas).
padre(pedro,matias).
padre(pedro,santino).

% Madres
madre(laura, maria).
madre(laura, pedro).
madre(ana, sofia).
madre(ana, lucas).
madre(sofia,santino).
madre(sofia,matias).


% Matrimonios
casados(juan, laura).
casados(carlos, ana).
casados(pedro, sofia).

% Género
hombre(juan).
hombre(pedro).
hombre(carlos).
hombre(lucas).
mujer(laura).
mujer(maria).
mujer(ana).
mujer(sofia).


/*
IDENTIFICAR:
  hermano(X,Y) y hermana(X, Y)
  tio(X,Y)
  abuelo(X, Y) y abuela(X, Y)
  sobrino(X, Y)

*/

% Hermano
hermano(Ho,Ha) :-
  padre(Z,Ho),
  padre(Z,Ha),
  madre(X,Ho),
  madre(X,Ha).
  
% Hermana
hermana(Ha,Ho) :-
  padre(Z,Ho),
  padre(Z,Ha),
  madre(X,Ho),
  madre(X,Ha).
  
% Tio
tio(Pa,So) :- 
  hermano(Pa,X),
  hermana(X,Pa),
  padre(Pa,So).
  
% Abuelo
abuelo(Pin,Pul) :- 
  padre(Pin,X),
  padre(X,Pul),
  casados(X,Y),
  madre(Y,Pul).


:- initialization(main).
main :-

write('Lucas es hermano de Sofia?'),
(
  hermano(lucas,sofia)
  ->
  write(' Si')
  ;
  write(' No')
  ),
  nl,
  
write('Sofia es hermana de Lucas?'),
(
  hermana(sofia,lucas)
  ->
  write(' Si')
  ;
  write(' No')
  ),
  nl,
  
write('Pedro es hermano de Maria?'),
(
  hermano(pedro,maria)
  ->
  write(' Si')
  ;
  write(' No')
  ),
  nl,
  
write('Maria es hermana de Pedro?'),
(
  hermana(maria,pedro)
  ->
  write(' Si')
  ;
  write(' No')
  ),
  nl,
  
write('Santino es hermano de Matias?'),
(
  hermano(santino,matias)
  ->
  write(' Si')
  ;
  write(' No')
  ),
  nl,
  
write('Matias es sobrino de Maria?'),
(
  tio(pedro,matias)
  ->
  write(' Si')
  ;
  write(' No')
  ),
  nl,
  
write('Matias es nieto de Juan?'),
(
  abuelo(juan,matias)
  ->
  write(' Si')
  ;
  write(' No')
  ),
  nl,
  
  halt(0).
