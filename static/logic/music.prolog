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

% Collections of notes can sometimes be called a "scale". These are
% notes that have some relationship with one another. For now, let 
% us just say that a scale is a Base note with a number of other 
% Intervals

scale(_, [], []) :- true.
scale(Base, [Interval_Head|Interval_Tail], [H|T]) :- 
    interval(Base, H, Interval_Head),
    scale(Base, Interval_Tail, T).

% Using our concept of scales we defined above, we can define the
% major scale. Most people perceive this as a "happy" collection
% of notes.

major_scale(Base, Scale) :- scale(Base, [0, 2, 4, 5, 7, 9, 11, 0], Scale).

% Or a minor scale, which most people perceive as being "sad" or
% contemplative. There are multiple minor scales, but this is
% note important at this point.

natural_minor_scale(Base, Scale) :- scale(Base, [0, 2, 3, 5, 7, 8, 10, 0], Scale).
