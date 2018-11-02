tree(nil).

mem(X,[X|_]).
mem(X,[_|T]):- mem(X,T),!.

append([],Y,Y).
append([H|X],Y,[H|Z]):-append(X,Y,Z).

create_bst(X,[],X).
create_bst(X,[H|Y],T):- insert(H,T,T1),!,create_bst(X,Y,T1).
create_bst(X,Y):- tree(T),create_bst(X,Y,T).

insert(Key, nil, t(Key, nil, nil)).
insert(Key, t(K, L, R), t(K, NL, R)):- Key<K, !, insert(Key, L, NL).
insert(Key, t(K, L, R), t(K, L, NR)):- insert(Key, R, NR). 

inorder(t(K,L,R), List):-inorder(L,LL), inorder(R, LR),
append(LL, [K|LR],List).
inorder(nil, []). 

preorder(t(K,L,R), List):-preorder(L,LL), preorder(R, LR),
append([K|LL], LR ,List).
preorder(nil, []). 

postorder(t(K,L,R), List):-postorder(L,LL), postorder(R, LR),
append(LL, LR,L1), append(L1,[K],List).
postorder(nil, []). 

count(nil,0).
count(X,Y):-inorder(X,L),count_list(L,Y).

count_list([],0).
count_list([_|T],Z):-count_list(T,Z1), Z is Z1+1. 

find(X,Y):- inorder(X,L), mem(Y,L),write("true.").

height(nil,-1).
height(t(_,L,R),Y):-height(L,Y1),Y11 is Y1+1,height(R,Y2), Y22 is Y2+1, (Y11>Y22 -> Y is Y11; Y is Y22). 

