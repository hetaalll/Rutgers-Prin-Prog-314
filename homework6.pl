%question3 salary(joe,sam) should be true

in(joe, toy_department).
report(X, Y, Department):-in(X, Department), head(Y, Department).
head(sam, toy_department).
salary(X, Y):-report(X, Y, _).


%question4 trib(N,T) which is true if T is the Nth tribonacci number

trib(0, 0).
trib(1, 0).
trib(2, 1).
trib(N, T):- N>2,
	A is N -1, B is N - 2, C is N - 3,
	trib(A,AT), trib(B,BT), trib(C,CT),
	T is AT+BT+CT.


%question5 echo(A,B) where B = A but with double the elements

echo([],[]).
echo([X|Y], [X,X|YZ]):- echo(Y,YZ).


%question6 suppressEchos(A,B) where B = A with doubles removed from A

suppressEchos([],[]).
suppressEchos([X],[X]).
suppressEchos([X,X|Z],[X|R]):- suppressEchos([X|Z],[X|R]).
suppressEchos([X,Y|Z],[X|R]):- X \== Y, suppressEchos([Y|Z],R).
