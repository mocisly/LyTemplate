% =========================================================
% Piano Template
% LilyPond 2.26+
% =========================================================

\version "2.26.0"
\language "english"

% =========================================================
% Metadata
% =========================================================

titleText = "{{TITLE}}"
composerText = "{{COMPOSER}}"

% =========================================================
% Global
% =========================================================

global = {

  \key {{KEY}} \{{MODE}}

  \time {{TIME}}

  \tempo 4 = {{TEMPO}}
}

% =========================================================
% Left-hand Patterns
% =========================================================

cPattern = { c8 g8 c'8 e'8 g'2 }
gPattern = { g,8 d8 g8 b8 d'2 }
amPattern = { a,8 e8 a8 c'8 e'2 }
fPattern = { f,8 c8 f8 a8 c'2 }

emPattern = { e,8 b,8 e8 g8 b2 }
dmPattern = { d,8 a,8 d8 f8 a2 }

cLowPattern = { c,8 g,8 c8 e8 g2 }
fLowPattern = { f,8 c8 f8 a8 c'2 }

% =========================================================
% Melody
% =========================================================

melody = \relative c'' {

{{MELODY}}

}

% =========================================================
% Bass
% =========================================================

bass = {

{{BASS}}

}

% =========================================================
% Score
% =========================================================

\score {

  \new PianoStaff <<

    \new Staff {

      \global

      \clef treble

      \melody
    }

    \new Staff {

      \global

      \clef bass

      \bass
    }

  >>

  \layout { }

  \midi { }
}

% =========================================================
% Header
% =========================================================

\header {

  title = \titleText

  composer = \composerText

  tagline = ##f
}

% =========================================================
% Paper
% =========================================================

\paper {

  #(set-paper-size "letter")

  indent = 0
  short-indent = 0

  top-margin = 10
  bottom-margin = 12
  left-margin = 15
  right-margin = 15

  print-page-number = ##f
}

% =========================================================
% Layout
% =========================================================

\layout {

  indent = 0
  short-indent = 0

  \context {

    \Score

    \remove "Bar_number_engraver"

    barNumberVisibility = ##f
  }

  \context {

    \Staff

    \remove "Bar_number_engraver"
  }

  \context {

    \PianoStaff

    \remove "Bar_number_engraver"
  }

  \override Score.BarNumber.stencil = ##f
}
