:- use_module(library(lists)).

% Western music divides frequency into 12 tones. They are named thusly:
notes([a, a_sharp, b, c, c_sharp, d, d_sharp, e, f, f_sharp, g, g_sharp]).

% These notes can be combined in various ways.
% One such way is a "major triad"

triad(Triad, SecondInterval, ThirdInterval) :-
    notes(Notes),
    length(Notes, NumberOfNotes),
    member(Base, Notes),
    member(SecondNote, Notes),
    member(ThirdNote, Notes),
    nth0(IndexOfBase, Notes, Base),
    nth0(IndexOfSecondNote, Notes, SecondNote),
    nth0(IndexOfThirdNote, Notes, ThirdNote),
    IndexOfSecondNote is (IndexOfBase + SecondInterval) mod NumberOfNotes,
    IndexOfThirdNote is (IndexOfBase + ThirdInterval) mod NumberOfNotes,
    Triad = [Base, SecondNote, ThirdNote].

major_triad(X) :- triad(X, 4, 7).
minor_triad(X) :- triad(X, 3, 7).
