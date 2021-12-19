:- use_module(library(lists)).

% Western music divides frequency into 12 tones. They are named thusly:
notes([a, a_sharp, b, c, c_sharp, d, d_sharp, e, f, f_sharp, g, g_sharp]).

% These notes can be combined in various ways.
% One such way is a "major triad"

major_triad(X) :- notes(Notes), member(X, Notes).
