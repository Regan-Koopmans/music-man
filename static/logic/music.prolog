:- use_module(library(lists)).

% Western music divides an octave into 12 tones. They are named thusly:
notes([a, a_sharp, b, c, c_sharp, d, d_sharp, e, f, f_sharp, g, g_sharp]).

% The relationship between two of these notes is called an "interval"

interval(Base, Note, Interval) :-
    notes(Notes),
    length(Notes, NumberOfNotes),
    member(Base, Notes),
    member(Note, Notes),
    nth0(IndexOfBase, Notes, Base),
    nth0(IndexOfNote, Notes, Note),
    IndexOfNote is (IndexOfBase + Interval) mod NumberOfNotes.

% Some intervals have special names such as "perfect fifth",
% "minor third", "major third"

perfect_fifth(Base, Note) :- interval(Base, Note, 7).
minor_second(Base, Note) :- interval(Base, Note, 3).
major_second(Base, Note) :- interval(Base, Note, 4).

% We can group these notes based on their relationship to one another.
% For example we can play three notes together, called a "triad".

% Based on the notes we chose, we may get different triads with different
% moods

major_triad(Triad) :-
    major_second(Base, MajorSecond),
    perfect_fifth(Base, Fifth),
    Triad = [Base, MajorSecond, Fifth].

minor_triad(Triad) :-
    minor_second(Base, MinorSecond),
    perfect_fifth(Base, Fifth),
    Triad =[Base, MinorSecond, Fifth].


major_scale(Base, Scale) :-
    notes(Notes),
    member(Base, Notes),
    interval(Base, SuperTonic, 2),
    interval(Base, Mediant, 4),
    interval(Base, SubDominant, 5),
    interval(Base, Dominant, 7),
    interval(Base, SubMediant, 9),
    interval(Base, LeadingTone, 11),
    Scale = [Base, SuperTonic, Mediant, SubDominant, Dominant, SubMediant, LeadingTone, Base].


natural_minor(Base, Scale) :-
    notes(Notes),
    member(Base, Notes),
    interval(Base, SuperTonic, 2),
    interval(Base, Mediant, 3),
    interval(Base, SubDominant, 5),
    interval(Base, Dominant, 7),
    interval(Base, SubMediant, 8),
    interval(Base, LeadingTone, 10),
    Scale = [Base, SuperTonic, Mediant, SubDominant, Dominant, SubMediant, LeadingTone, Base].

