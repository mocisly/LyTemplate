% =========================================================
% Universal Piano Template
% =========================================================

\version "2.26.0"

\language "english"

% =========================================================
% Metadata
% =========================================================

titleText = "{{TITLE}}"

subtitleText = "{{SUBTITLE}}"

composerText = "{{COMPOSER}}"

#(define total-pages {{TOTAL_PAGES}})

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

cPattern = {
  c8 g8 c'8 e'8 g'2
}

gPattern = {
  g,8 d8 g8 b8 d'2
}

amPattern = {
  a,8 e8 a8 c'8 e'2
}

fPattern = {
  f8 c'8 f'8 a'8 c''2
}

emPattern = {
  e,8 b,8 e8 g8 b2
}

dmPattern = {
  d,8 a,8 d8 f8 a2
}

cLowPattern = {
  c,8 g,8 c8 e8 g2
}

fLowPattern = {
  f,8 c8 f8 a8 c'2
}

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
% Chords
% =========================================================

harmony = \chordmode {

{{CHORDS}}

}

% =========================================================
% Score
% =========================================================

\score {

  <<

    % =====================================================
    % Chords
    % =====================================================

    \new ChordNames {

      \harmony
    }

    % =====================================================
    % Piano
    % =====================================================

    \new PianoStaff \with {

      instrumentName = "Piano"

    }

    <<

      % ===================================================
      % Right Hand
      % ===================================================

      \new Staff {

        \global

        \clef treble

        \melody
      }

      % ===================================================
      % Left Hand
      % ===================================================

      \new Staff {

        \global

        \clef bass

        \bass
      }

    >>
  >>

  % =====================================================
  % Layout
  % =====================================================

  \layout { }

  % =====================================================
  % MIDI
  % =====================================================

  \midi { }
}

% =========================================================
% Header
% =========================================================

\header {

  title = \titleText

  subtitle = \subtitleText

  composer = \composerText
}

% =========================================================
% Paper
% =========================================================

\paper {

  #(set-paper-size "letter")

  top-margin = 15
  bottom-margin = 15
  left-margin = 15
  right-margin = 15

  print-page-number = ##t

  oddFooterMarkup = \markup {

    \fill-line {

      \null

      \concat {

        \fromproperty #'page:page-number-string

        "/"

        #(number->string total-pages)
      }
    }
  }

  evenFooterMarkup = \oddFooterMarkup
}

% =========================================================
% Layout
% =========================================================

\layout {

  \context {

    \Score

    \override StaffGrouper.staff-staff-spacing.basic-distance = 10

    \override ChordName.font-size = -1

    barNumberVisibility =
      #first-bar-number-invisible-save-broken-bars
  }
}
