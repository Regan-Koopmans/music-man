:- use_module(library(lists)).

% Western music divides frequency into 12 tones. They are named thusly:
notes([a, a_sharp, b, c, c_sharp, d, d_sharp, e, f, f_sharp, g, g_sharp]).

% These notes can be combined in various ways.
% One such way is a "major triad"

major_triad_notes(Base, MajorThird, PerfectFifth) :-
    notes(Notes),
    length(Notes, NumberOfNotes),
    member(Base, Notes),
    member(MajorThird, Notes),
    member(PerfectFifth, Notes),
    nth0(IndexOfBase, Notes, Base),
    nth0(IndexOfThird, Notes, MajorThird),
    nth0(IndexOfFifth, Notes, PerfectFifth),
    IndexOfThird is (IndexOfBase + 4) mod NumberOfNotes,
    IndexOfFifth is (IndexOfBase + 7) mod NumberOfNotes.

minor_triad_notes(Base, MinorThird, PerfectFifth) :-
    notes(Notes),
    length(Notes, NumberOfNotes),
    member(Base, Notes),
    member(MinorThird, Notes),
    member(PerfectFifth, Notes),
    nth0(IndexOfBase, Notes, Base),
    nth0(IndexOfThird, Notes, MinorThird),
    nth0(IndexOfFifth, Notes, PerfectFifth),
    IndexOfThird is (IndexOfBase + 3) mod NumberOfNotes,
    IndexOfFifth is (IndexOfBase + 7) mod NumberOfNotes.

major_triad(X) :- major_triad_notes(A, B, C), X = [A, B, C].
minor_triad(X) :- minor_triad_notes(A, B, C), X = [A, B, C].
