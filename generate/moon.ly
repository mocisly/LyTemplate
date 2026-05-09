% =========================================================
% Professional Piano Engraving System
% Henle-style Layout Engine
% LilyPond 2.26+
% =========================================================

\version "2.26.0"
\language "english"

% =========================================================
% Metadata
% =========================================================

titleText = "Moon Represents My Heart"
composerText = "Teresa Teng"

% =========================================================
% Global Settings
% =========================================================

global = {

  \key c \major

  \time 4/4

  \tempo 4 = 88
}

% =========================================================
% Left-hand Patterns Library
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


g2~ g8 e8 d8 c8 |
e2 r8 a,8 c8 e8 |
a2~ a8 f8 d8 c8 |

\break

b2. r8 g8 |
c4. e8 g4. c8 |
b4. e8 g4. g8 |
a4. b8 c4 a4 |

\break

g2. e8 d8 |
c4. c8 c4 e8 d8 |
c4. c8 c4 d8 e8 |
d4. c8 a4 e4 |

\break

d2. r8 g8 |
c4. e8 g4. c8 |
b4. e8 g4. g8 |
a4. b8 c4 a4 |

\break

g2. e8 d8 |
c4. c8 c4 e8 d8 |
c4. c8 c4 d8 e8 |
d4. a8 b4 c8 d8 |

\break

c2. g4 |
e4. d8 c4 g4 |
b2. a8 b8 |
a4. b8 a4 g4 |

\break

e'2. g4 |
e4. d8 c4 g4 |
b2. a8 b8 |
c4. c8 c4 d8 e8 |

\break

d2. r8 g,8 |
c4. e8 g4. c8 |
b4. e8 g4. g8 |
a4. b8 c4 a4 |

\break

g2. e8 d8 |
c4. c8 c4 e8 d8 |
c4. c8 c4 d8 e8 |
d4. a8 b4 c8 d8 |

\break

c2. e8 d8 |
c4. c8 c4 e8 d8 |
c4. c8 c4 d8 e8 |
d4. a8 b4 d4 |

\break

c1 |

<c e g c>1\arpeggio |

\bar "|."


}

% =========================================================
% Bass
% =========================================================

bass = {


\cPattern |
\amPattern |
\fPattern |

\gPattern |
\cPattern |
\emPattern |
\fLowPattern |

\gPattern |
\cLowPattern |
\amPattern |
\dmPattern |

\gPattern |
\cLowPattern |
\emPattern |
\fLowPattern |

\gPattern |
\cLowPattern |
\amPattern |
\dmPattern |

\cLowPattern |
\cLowPattern |
\emPattern |
\fLowPattern |

\amPattern |
\cLowPattern |
\emPattern |
\fLowPattern |

\gPattern |
\cLowPattern |
\emPattern |
\fLowPattern |

\gPattern |
\cLowPattern |
\amPattern |
\dmPattern |

\cLowPattern |
\cPattern |
\amPattern |
\dmPattern |

c,8 g,8 c8 e8 g8 c'8 e'8 g'8 |

<c, c>1 |


}

% =========================================================
% Score Structure
% =========================================================

\score {

  \new PianoStaff <<

    % =========================
    % Right Hand
    % =========================

    \new Staff {

      \global

      \clef treble

      \melody
    }

    % =========================
    % Left Hand
    % =========================

    \new Staff {

      \global

      \clef bass

      \bass
    }

  >>

  % =====================================================
  % Layout Engine
  % =====================================================

  \layout {

    % -----------------------------------------
    % 全局缩进控制
    % -----------------------------------------

    indent = 0
    short-indent = 0

    ragged-last = ##f

    % -----------------------------------------
    % 系统排版
    % -----------------------------------------

    \context {

      \Score

      % 禁用小节
      \remove "Bar_number_engraver"
      barNumberVisibility = ##f

      % 系统间距
      \override StaffGrouper.staff-staff-spacing.basic-distance = 12
      \override StaffGrouper.staff-staff-spacing.padding = 3

      % 防止系统过度拉伸
      \override SpacingSpanner.uniform-stretching = ##t
    }

    % -----------------------------------------
    % Staff 优化
    % -----------------------------------------

    \context {

      \Staff

      \remove "Time_signature_engraver"

      % 更紧凑音符连接
      \override Stem.thickness = 1.3
    }

    % -----------------------------------------
    % PianoStaff 优化
    % -----------------------------------------

    \context {

      \PianoStaff

      % 双谱间距
      \override StaffGrouper.staff-staff-spacing.basic-distance = 10
      \override StaffGrouper.staff-staff-spacing.padding = 2
    }
  }

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
  composer = \composerText

  tagline = ##f
}

% =========================================================
% Paper (出版级页面控制)
% =========================================================

\paper {

  #(set-paper-size "letter")

  % 完全取消左缩进
  indent = 0
  short-indent = 0

  % 页面边距（出版标准）
  top-margin = 10
  bottom-margin = 12
  left-margin = 15
  right-margin = 15

  % 干净页面
  print-page-number = ##f

  % 系统间距优化
  system-system-spacing.basic-distance = 16
  system-system-spacing.padding = 3
}
