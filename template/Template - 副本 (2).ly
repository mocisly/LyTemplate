% =========================================================
% Clean Piano Score Template (Production Grade)
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
% Paper (关键修复区)
% =========================================================

\paper {

  #(set-paper-size "letter")

  % ⭐ 关键：取消首行缩进（解决“第一行不顶格”）
  indent = 0
  short-indent = 0

  top-margin = 10
  bottom-margin = 12
  left-margin = 15
  right-margin = 15

  print-page-number = ##f
}

% =========================================================
% Layout (干净版)
% =========================================================

\layout {

  \context {

    \Score

    % ❌ 去掉所有小节号
    \remove "Bar_number_engraver"

    % 让谱表更紧凑自然
    \override SystemStartBar.collapse-height = #1
  }

  \context {

    \Staff

    % ❌ 去掉拍号显示（如果你想完全干净）
    \remove "Time_signature_engraver"
  }
}
