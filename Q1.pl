mem(X,[X|_]).
mem(X,[_|T]):- mem(X,T).

append([],Y,Y).
append([H|X],Y,[H|Z]):-append(X,Y,Z).

create_set([],K,K).
create_set([H|T],Z,M):- mem(H,Z),!,create_set(T,Z,M).
create_set([H|T],Z,M):- append(Z,[H],P),create_set(T,P,M). 
create_set([H|L],M):- create_set(L,[H],M).

union(X,Y,M):- append(X,Y,[H|Z]),create_set(Z,[H],M).

intersection([],_,Z,Z).
intersection([H|X],Y,Z,M):- mem(H,Y),append([],[H],Z),intersection(X,Y,Z,M).

difference([],_,Z,Z).
difference([H|X],Y,Z,M):- mem(H,Y), !,difference(X,Y,Z,M).
difference([H|X],Y,Z,M):- append(Z,[H],P), difference(X,Y,P,M). 
difference(X,Y,Z):- difference(X,Y,[],Z).

product(_,[],P,P).
product([H|X],[J|Y],Z,M1):- append(Z,[(H,J)],P),!,product([H|X],Y,P,M1).
product([],_,[]).
product([H|X],Y,M):- product([H|X],Y,[],M1),!,product(X,Y,M2),append(M1,M2,M). 


