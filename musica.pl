%% Usuarios

user(cristian).
user(erick).
user(gilberto).
user(jhon).
user(micke).
user(darks).

%% Canciones

song(eta).
song(tu).
song(vete_ya).
song(lo_siento_bb).
song(si_te_pudiera_mentir).
song(enter_sadman).



%% Generos

genero(cristian,[bachata, rock_alternativo, stoner_rock, hard_rock, pop_punk, emo_pop, pop_rock, power_pop, hip_hop]).
genero(erick,[stoner_rock, hard_rock, pop_punk, pop_rock, hip_hop, rap, electronica]).
genero(gilberto,[banda, balada, rap, hip_hop, rock_alternativo, pop_rock, electronica]).
genero(jhon,[regueton, balada, rap, hip_hop, rock_alternativo, pop_rock, electronica, emo_pop, power_pop]).
genero(micke,[regueton, balada, rap, electronica, banda, nortena]).
genero(darks,[rock_alternativo, stoner_rock, hard_rock, pop_punk, emo_pop, pop_rock]).
genero(eta,[hip_hop, rap, g_funk, gangsta_rap, west, coast_rap]).
genero(tu,[gangsta_rap, bachata, electronica]).
genero(vete_ya,[banda, balada, electronica]).
genero(lo_siento_bb,[regueton, rap, electronica]).
genero(si_te_pudiera_mentir,[banda, balada, nortena]).
genero(enter_sadman,[hard_rock, pop_punk, rock_alternativo]).

%% Feels

feel(cristian,[alegria, tristeza, orgullo, esperanza, furia]).
feel(erick,[enojo, colera, orgullo, esperanza, furia]).
feel(gilberto,[alegria, tristeza, orgullo, esperanza, euforia, amor]).
feel(jhon,[alegria, tristeza, orgullo, esperanza, furia, enojo]).
feel(micke,[tristeza, orgullo, enojo, furia, euforia, amor]).
feel(darks,[tristeza, furia, enojo, orgullo, euforia]).
feel(eta,[orgullo, ezperanza, furia, amor]).
feel(tu,[amor, esperanza, alegria]).
feel(vete_ya,[amor, orgullo, tristeza]).
feel(lo_siento_bb,[amor, alegria, esperanza]).
feel(si_te_pudiera_mentir,[amor, tristeza, furia]).
feel(enter_sadman,[esperanza, tristeza, furia]).

%% valores

valores(cristian,[baile, charla, convivir, salir, conducir, respeto]).
valores(erick,[charla, convivir, salir, ejercitarse]).
valores(gilberto,[charla, convivir, baile, conducir, cantar]).
valores(jhon,[baile, conducir, respeto, salir]).
valores(micke,[baile, conducir, charla, salir, cantar, convivir]).
valores(darks,[respeto, conducir, charla, salir, cantar]).
valores(eta,[respeto, charla, salir]).
valores(tu,[salir, cantar, ejercitarse]).
valores(vete_ya,[charla, cantar, baile]).
valores(lo_siento_bb,[conducir, salir, baile]).
valores(si_te_pudiera_mentir,[charla, cantar, convivir]).
valores(enter_sadman,[conducir, respeto, convivir]).

%% Metodo para matching

largo([],0).
largo([_|T],N):-largo(T,N0), N is N0 + 1.

member(X,[X|_]).
member(X,[_|T]):-member(X,T).

co([],_,0):-!.
co([X|T],L2,C):-member(X,L2),co(T,L2,C2),C is C2 + 1,!.
co([X|T],L2,C):-not(member(X,L2)),co(T,L2,C2),C is C2. 


pareja(U,S,PorcentajePedido,Porc_calculado):-user(U),song(S),
                        genero(U,Gu),genero(S,Gs),
                        feel(U,Fu),feel(S,Fs),
                        valores(U,Vu),valores(S,Vs),
                        
                        largo(Gu,LargoGeneroU),largo(Gs,LargoGeneroS),
                        largo(Fu,LargoFeelU),largo(Fs,LargoFeelS),
                        largo(Vu,LargoValoresU),largo(Vs,LargoValoresS),

                        NGenero is LargoGeneroU + LargoGeneroS,
                        NFeel is LargoFeelU + LargoFeelS, 
                        NValores is LargoValoresU + LargoValoresS, 

                        Prom1 is NGenero / 2,
                        Prom2 is NFeel / 2,
                        Prom3 is NValores / 2,

                        co(Gu,Gs,Coincidencias1),
                        co(Fu,Fs,Coincidencias2), 
                        co(Vu,Vs,Coincidencias3), 

                        Porc_calculado1 is ((Coincidencias1/Prom1)*100),
                        Porc_calculado2 is ((Coincidencias2/Prom2)*100),
                        Porc_calculado3 is ((Coincidencias3/Prom3)*100),

                        Porc_calculado is ((Porc_calculado1 + Porc_calculado2 + Porc_calculado3)/3),

                        Porc_calculado>=PorcentajePedido.