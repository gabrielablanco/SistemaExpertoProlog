tty_clear/0.

:-write('----------------------------------------------------------------').
:-nl,nl,write('Digite \' diag.\' para realizar un diagnostico').
:-nl,nl,write('Digite \' a_sc.\' para agregar un nuevo síntoma comun de alguna enfermedad').
:-nl,nl,write('Digite \' a_sg.\' para agregar un nuevo síntoma grave de alguna enfermedad'),nl.
:-write('---------------------------------------------------------------').

:-dynamic diagnosticoSC/2.
:-dynamic diagnosticoSC/3.
:-dynamic diagnosticoSC/4.
:-dynamic diagnosticoSC/5.
:-dynamic diagnosticoSC/6.
:-dynamic diagnosticoSC/7.
:-dynamic diagnosticoSG/2.
:-dynamic diagnosticoSG/3.
:-dynamic diagnosticoSG/4.
:-dynamic diagnosticoSG/5.
:-dynamic diagnosticoSG/6.
:-dynamic diagnosticoSG/7.
:-dynamic sintoma_comun/2.
:-dynamic sintoma_grave/2.

% Hechos y reglas
enfermedad(dengue).
enfermedad(gripe).
enfermedad(chikungunya).
enfermedad(covid19).

sintoma_comun(inflamacionGarganta, covid19).
sintoma_comun(tosSeca, covid19).
sintoma_comun(tosSeca, gripe).
sintoma_comun(diarrea, covid19).
sintoma_comun(conjuntivitis, covid19).
sintoma_comun(perdidaOlfato, covid19).
sintoma_comun(erupcionesCutaneas, covid19).
sintoma_comun(erupcionesCutaneas, dengue).
sintoma_comun(erupcionesCutaneas, chikungunya).
sintoma_comun(dolorCabeza, dengue).
sintoma_comun(dolorCabeza, gripe).
sintoma_comun(dolorCabeza, chikungunya).
sintoma_comun(dolorCabeza, covid19).
sintoma_comun(fiebre, dengue).
sintoma_comun(fiebre, gripe).
sintoma_comun(fiebre, chikungunya).
sintoma_comun(fiebre, covid19).
sintoma_comun(congestionNasal, gripe).
sintoma_comun(congestionNasal,covid19).
sintoma_comun(dolorArticulaciones, dengue).
sintoma_comun(dolorArticulaciones, chikungunya).
sintoma_comun(dolorAbdominal, chikungunya).
sintoma_comun(dolorMuscular, dengue).
sintoma_comun(dolorMuscular, gripe).
sintoma_comun(dolorMuscular, chikungunya).
sintoma_comun(dolorMuscular, covid19).
sintoma_comun(fatiga, dengue).
sintoma_comun(fatiga, gripe).
sintoma_comun(fatiga, chikungunya).
sintoma_comun(fatiga, covid19).

sintoma_grave(dificultadRespirar, covid19).
sintoma_grave(dificultadRespirar, dengue).
sintoma_grave(dificultadRespirar, gripe).
sintoma_grave(dolorAbdominal, dengue).
sintoma_grave(dolorAbdominal, chinkungunya).
sintoma_grave(sangradoEncias, dengue).
sintoma_grave(sangradoEncias, chikungunya).
sintoma_grave(dolorGarganta, chikungunya).
sintoma_grave(dolorGarganta, gripe).
sintoma_grave(dolorGarganta, covid19).
sintoma_grave(sangradoOrina, dengue).
sintoma_grave(pielFria, dengue).
sintoma_grave(sequedadBoca, dengue).
sintoma_grave(inflamacionGarganta, gripe).
sintoma_grave(esputo, gripe). %Adultos mayores
sintoma_grave(otitisMedia, gripe). %niÃ±os
sintoma_grave(diarrea, gripe). %niÃ±os
sintoma_grave(nauseas, chikungunya).

recomendacion("lavado de manos", covid19).
recomendacion("lavado de manos", gripe).
recomendacion("hidratarse constantemente", gripe).
recomendacion("hidratarse constantemente", covid19).
recomendacion("reposo", gripe).
recomendacion("reposo", covid19).
recomendacion("reposo", dengue).
recomendacion("evitar ambientes frios", gripe).
recomendacion("evitar fumar", gripe).
recomendacion("usar repelente insectos", dengue).
recomendacion("evitar climas tropicales", dengue).
recomendacion("usar mosquiteros", dengue).
recomendacion("usar repelente insectos", chikungunya).
recomendacion("evitar climas tropicales", chikungunya).
recomendacion("usar mosquiteros", chikungunya).
recomendacion("usar antipireticos", dengue).
recomendacion("vacunarse al visitar zonas endemicas", dengue).



diagnosticoSC(X,Y):- sintoma_comun(X,Y).
diagnosticoSC(X,Y,Z):- sintoma_comun(X,Z), sintoma_comun(Y,Z).
diagnosticoSC(X,Y,Z,W):- sintoma_comun(X,W), sintoma_comun(Y,W), sintoma_comun(Z,W).
diagnosticoSC(X,Y,Z,A,W):- sintoma_comun(X,W), sintoma_comun(Y,W), sintoma_comun(Z,W), sintoma_comun(A,W).
diagnosticoSC(X,Y,Z,A,B,W):- sintoma_comun(X,W), sintoma_comun(Y,W), sintoma_comun(Z,W), sintoma_comun(A,W), sintoma_comun(B,W).
diagnosticoSC(X,Y,Z,A,B,C,W):- sintoma_comun(X,W), sintoma_comun(Y,W), sintoma_comun(Z,W), sintoma_comun(A,W), sintoma_comun(B,W), sintoma_comun(C,W).
diagnosticoSG(X,Y):- sintoma_grave(X,Y).
diagnosticoSG(X,Y,Z):- sintoma_grave(X, Z), sintoma_grave(Y,Z).
diagnosticoSG(X,Y,Z,W):- sintoma_grave(X,W), sintoma_grave(Y,W), sintoma_grave(Z,W).
diagnosticoSG(X,Y,Z,A,W):- sintoma_grave(X,W), sintoma_grave(Y,W), sintoma_grave(Z,W), sintoma_grave(A,W).
diagnosticoSG(X,Y,Z,A,B,W):- sintoma_grave(X,W), sintoma_grave(Y,W), sintoma_grave(Z,W), sintoma_grave(A,W), sintoma_grave(B,W).
diagnosticoSG(X,Y,Z,A,B,C,W):- sintoma_grave(X,W), sintoma_grave(Y,W), sintoma_grave(Z,W), sintoma_grave(A,W), sintoma_grave(B,W), sintoma_grave(C,W).

menuSC:-
     write('-------------------------------------------------------'),nl, write('Ingrese el síntoma común que siente del siguiente listado:'),nl,write('inflamacionGarganta'),nl,write('tosSeca'),nl,write('diarrea'),nl,write('conjutivitis'),nl,write('perdidaOlfato'),nl,write('erupcionesCutaneas'),nl,write('dolorCabeza'),nl,write('fiebre'),nl,write('congestionNasal'),nl,write('dolorArticulaciones'),nl,write('dolorAbdominal'),nl,write('dolorMuscular'),nl,write('fatiga'),nl,write('-------------------------------------------------------------------------------------').

e_sc1:-
     menuSC,nl,write('Sintoma '), read(Enfermedad),nl,diagnosticoSC(Enfermedad,Y),write(Y),nl, perfil(Y).

e_sc2:-
     menuSC,nl,write('Sintoma 1 '), read(Enfermedad1), write('Sintoma 2 '), read(Enfermedad2), diagnosticoSC(Enfermedad1,Enfermedad2,Y), write(Y),nl, perfil(Y).

e_sc3:-
     menuSC,nl,write('Sintoma 1 '), read(Enfermedad1),nl, write('Sintoma 2 '), read(Enfermedad2), nl, write('Sintoma 3 '), read(Enfermedad3), diagnosticoSC(Enfermedad1,Enfermedad2,Enfermedad3,Y),write(Y),nl,perfil(Y).

e_sc4:-
     menuSC,nl,write('Sintoma 1 '), read(Enfermedad1), write('Sintoma 2 '), read(Enfermedad2), write('Sintoma 3 '), read(Enfermedad3), write('Sintoma 4 '), read(Enfermedad4), diagnosticoSC(Enfermedad1,Enfermedad2,Enfermedad3,Enfermedad4,Y),write(Y),nl,perfil(Y).

e_sc5:-
     menuSC,nl,write('Sintoma 1 '), read(Enfermedad1), write('Sintoma 2 '), read(Enfermedad2), write('Sintoma 3 '), read(Enfermedad3), write('Sintoma 4 '), read(Enfermedad4), write('Sintoma 5 '), read(Enfermedad5), diagnosticoSC(Enfermedad1,Enfermedad2,Enfermedad3,Enfermedad4,Enfermedad5,Y),write(Y),nl,perfil(Y).

e_sc6:-
     menuSC,nl,write('Sintoma 1 '), read(Enfermedad1), write('Sintoma 2 '), read(Enfermedad2), write('Sintoma 3 '), read(Enfermedad3), write('Sintoma 4 '), read(Enfermedad4), write('Sintoma 5 '), read(Enfermedad5), write('Sintoma 6 '), read(Enfermedad6),diagnosticoSC(Enfermedad1,Enfermedad2,Enfermedad3,Enfermedad4,Enfermedad5,Enfermedad6,Y),write(Y),nl,perfil(Y).

menuSG:-
     write('-------------------------------------------------------------------------------------'),nl, write('Ingrese el síntoma grave que siente del siguiente listado:'),nl,write('dificultadRespirar'),nl,write('dolorAbdominal'),nl,write('sangradoEncias'),nl,write('sangradoOrina'),nl,write('pielFria'),nl,write('sequedadBoca'),nl,write('inflamacionGarganta'),nl,write('esputo'),nl,write('otitisMedia'),nl,write('diarrea'),nl,write('dolorGarganta'),nl, write('nauseas'),nl,write('-------------------------------------------------------------------------------------').

e_sg1:-
     menuSG,nl,write('Sintoma '), read(Enfermedad),nl,diagnosticoSG(Enfermedad,Y),write(Y),nl,perfil(Y).

e_sg2:-
     menuSG,nl,write('Sintoma 1 '), read(Enfermedad1),write('Sintoma 2 '),read(Enfermedad2),nl,diagnosticoSG(Enfermedad1,Enfermedad2,Y),write(Y),nl,perfil(Y).

e_sg3:-
     menuSG,nl,write('Sintoma 1 '), read(Enfermedad1),write('Sintoma 2 '),read(Enfermedad2),write('Sintoma 3'), read(Enfermedad3),nl,diagnosticoSG(Enfermedad1,Enfermedad2,Enfermedad3,Y),write(Y),nl,perfil(Y).

e_sg4:-
     menuSG,nl,write('Sintoma 1 '), read(Enfermedad1),write('Sintoma 2 '),read(Enfermedad2),write('Sintoma 3'), read(Enfermedad3),write('Sintoma 4'),read(Enfermedad4),nl,bagof(Y, diagnosticoSG(Enfermedad1,Enfermedad2,Enfermedad3,Enfermedad4,Y),L),display(L),nl,perfil(Y).

e_sg5:-
     menuSG,nl,write('Sintoma 1 '), read(Enfermedad1),write('Sintoma 2 '),read(Enfermedad2),write('Sintoma 3'), read(Enfermedad3),write('Sintoma 4'),read(Enfermedad4),write('Sintoma 5'),read(Enfermedad5),nl,bagof(Y, diagnosticoSG(Enfermedad1,Enfermedad2,Enfermedad3,Enfermedad4,Enfermedad5,Y),L),display(L),nl,perfil(Y).


e_sc:-
    write('-------------------------------------------------------------------------------------'), nl, write('Digite el número de sintomas que posee de un rango de 1-5'),nl,read(Respuesta), nl, ((Respuesta==1)->e_sc1;(Respuesta==2)->e_sc2; (Respuesta==3)->e_sc3; (Respuesta==4)->e_sc4; (Respuesta==5)->e_sc5; (Respuesta==6)->e_sc6; e_sc), nl, write('----------------------------------------------------------------------------------').

e_sg:-
    write('---------------------------------------------------------------------------'), nl, write('Digite el número de sintomas que posee de un rango de 1-6'),nl,read(Respuesta), nl, ((Respuesta==1)->e_sg1;(Respuesta==2)->e_sg2; (Respuesta==3)->e_sg3; (Respuesta==4)->e_sg4; (Respuesta==5)->e_sg5; e_sg), nl, write('-------------------------------------------------------------------------').

diag:-
    write('Digite \'sc\' si la mayoria de sus sintomas son comunes/leves'), nl, write('Digite \'sg\' si la mayoria de sus sintomas son graves'),nl, read(Respuesta),nl, ((Respuesta==sc)->e_sc;e_sg).

concatenar([],L,L).
concatenar([X|M],L,[X|Z]):-concatenar(M,L,Z).

p_gripe(X):-
     bagof(Y,recomendacion(Y,X),L),write('¿Vive en clima frío? (si/no) '),read(Rta),nl,((Rta==si)->concatenar(L,['Abriguese todo el tiempo'],A),write('¿Es usted un niño/adolescente? (si/no) '), read(Rtag),nl,((Rtag==si)->concatenar(A,['Evite usar aspirinas'],B),nl,write('RECOMENDACIONES:'),nl,write(B);write('RECOMENDACIONES'),nl,write(A));write('¿Es usted niño/adolescente? (si/no) '), read(Rta2),nl,(Rta2==si)->concatenar(L,['Evite usar aspirinas'],A),nl,write('RECOMENDACIONES:'),nl,write(A);write('RECOMENDACIOES'),nl,write(L)).

p_covid19(X):-
     bagof(Y,recomendacion(Y,X),L),write('¿Ha sufrido alguna enfermedad respiratoria? '),read(Rta),nl,((Rta==si)->concatenar(L,['Utilice siempre tapabocas'],A),write('¿Es usted mayor de 70 años?' ),read(Rta2),nl,((Rta2==si)->concatenar(A,['Matengase aislado el mayor tiempo posible'],B),nl,write('RECOMENDACIONES:'),nl,write(B);write('RECOMENDACIONES:'),nl,write(A));write('¿Es usted mayor de 70 años? '), read(Rta3),nl,((Rta3==si)->concatenar(L,['Mantengase aislado el mayor tiempo posible'],A),nl,write('RECOMENDACIONES:'),nl,write(A);write('RECOMENDACIONES:'),nl,write(L))).

p_dengue(X):-
     bagof(Y,recomendacion(Y,X),L),write('¿Vive en climas calidos? '),read(Rta),nl,((Rta==si)->concatenar(L,['Eliminar posibles criaderos'],A),nl,write('RECOMENDACIONES:'),nl,write(A);write('RECOMENDACIONES:'),nl,write(L)).

p_chikungunya(X):-
     bagof(Y,recomendacion(Y,X),L),write('¿Vive en climas calidos? '),read(Rta),nl,((Rta==si)->concatenar(L,['Utilizar ropa que lo proteja de las picaduras'],A),nl,write('RECOMENDACIONES:'),nl,write(A);write('RECOMENDACIONES:'),nl,write(L)).


perfil(X):-
     ((X==gripe)->p_gripe(X);(X==covid19)->p_covid19(X);(X==dengue)->p_dengue(X);(X==chikungunya)->p_chikungunya(X);fail).

a_sc:-
     write('Digite el nombre del sintoma comun que va añadir '), read(Sintoma),nl,write('Digite el nombre de la enfermedad asociada a ese sintoma '), read(Enfermedad),nl,assert(sintoma_comun(Sintoma,Enfermedad)),repetir.

repetir:-
     write('¿Desea incluir otro sintoma junto con su enfermedad? (si/no) '),read(Rta),nl,((Rta==si)->a_sc;fail).

a_sg:-
     write('Digite el nombre del sintoma grave que va añadir '), read(Sintoma),nl,write('Digite el nombre de la enfermedad asociada a ese sintoma '), read(Enfermedad),nl,assert(sintoma_grave(Sintoma,Enfermedad)),repetir2.

repetir2:-
     write('¿Desea incluir otro sintoma junto con su enfermedad? (si/no) '),read(Rta),nl,((Rta==si)->a_sg;fail).


undo:-diagnosticoSC(_,_),fail.
undo:-diagnosticoSC(_,_,_),fail.
undo:-diagnosticoSC(_,_,_,_),fail.
undo:-diagnosticoSC(_,_,_,_,_),fail.
undo:-diagnosticoSC(_,_,_,_,_,_),fail.
undo:-diagnosticoSC(_,_,_,_,_,_,_),fail.
undo:-diagnosticoSG(_,_,_,_,_,_,_),fail.
undo:-diagnosticoSG(_,_,_,_,_,_),fail.
undo:-diagnosticoSG(_,_,_,_,_),fail.
undo:-diagnosticoSG(_,_,_,_),fail.
undo:-diagnosticoSG(_,_,_),fail.
undo:-diagnosticoSG(_,_),fail.
undo:-recomendacion(_,_),fail.
undo:-sintoma_comun(_,_),fail.
undo:-sintoma_grave(_,_),fail.
undo:-primero(_,_),fail.
undo.

























