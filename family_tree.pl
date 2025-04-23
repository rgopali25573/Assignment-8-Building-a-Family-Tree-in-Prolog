% Basic family relationships
% Define parent relationships
parent(john, mary).
parent(john, james).
parent(susan, mary).
parent(susan, james).
parent(mary, ann).
parent(mary, steve).
parent(james, patricia).
parent(james, michael).
parent(patricia, jennifer).
parent(michael, robert).
parent(michael, lisa).

% Define gender
male(john).
male(james).
male(steve).
male(michael).
male(robert).
female(susan).
female(mary).
female(ann).
female(patricia).
female(jennifer).
female(lisa).

% Derived relationships using rules

% Father relationship: X is the father of Y if X is a parent of Y and X is male
father(X, Y) :- parent(X, Y), male(X).

% Mother relationship: X is the mother of Y if X is a parent of Y and X is female
mother(X, Y) :- parent(X, Y), female(X).

% Child relationship: X is a child of Y if Y is a parent of X
child(X, Y) :- parent(Y, X).

% Son relationship: X is a son of Y if X is a child of Y and X is male
son(X, Y) :- child(X, Y), male(X).

% Daughter relationship: X is a daughter of Y if X is a child of Y and X is female
daughter(X, Y) :- child(X, Y), female(X).

% Grandparent relationship: X is a grandparent of Z if X is a parent of Y and Y is a parent of Z
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% Grandmother relationship: X is a grandmother of Z if X is a grandparent of Z and X is female
grandmother(X, Z) :- grandparent(X, Z), female(X).

% Grandfather relationship: X is a grandfather of Z if X is a grandparent of Z and X is male
grandfather(X, Z) :- grandparent(X, Z), male(X).

% Sibling relationship: X is a sibling of Y if they share at least one parent and X is not Y
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Brother relationship: X is a brother of Y if X is a sibling of Y and X is male
brother(X, Y) :- sibling(X, Y), male(X).

% Sister relationship: X is a sister of Y if X is a sibling of Y and X is female
sister(X, Y) :- sibling(X, Y), female(X).

% Cousin relationship: X is a cousin of Y if X's parent and Y's parent are siblings
cousin(X, Y) :- parent(P1, X), parent(P2, Y), sibling(P1, P2).

% Ancestor relationship: X is an ancestor of Y if X is a parent of Y or X is a parent of Z and Z is an ancestor of Y
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% Descendant relationship: X is a descendant of Y if Y is an ancestor of X
descendant(X, Y) :- ancestor(Y, X).

% Sample queries:
% 1. Who are the children of mary?
% ?- child(X, mary).

% 2. Who are the siblings of james?
% ?- sibling(X, james).

% 3. Is patricia a cousin of steve?
% ?- cousin(patricia, steve).

% 4. Who are all the descendants of john?
% ?- descendant(X, john).

% 5. Who are the grandparents of jennifer?
% ?- grandparent(X, jennifer).