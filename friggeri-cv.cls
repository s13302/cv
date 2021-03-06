\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No Page Break Environment %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{absolutelynopagebreak}
{}
{}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\RequirePackage[activate={true,nocompatibility},final,factor=1100,stretch=10,shrink=10,expansion=false,verbose=silent]{microtype}

\newfontfamily\bodyfont[]{Calibri}
\newfontfamily\thinfont[]{Calibri Light}
\newfontfamily\headingfont[]{Calibri Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Calibri Light}

\RequirePackage{xltxtra}

%%%%%%%%%%%%
% Language %
%%%%%%%%%%%%
\RequirePackage{polyglossia}
\setdefaultlanguage[variant=us]{english}



%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
  \ifnum\value{colorCounter}=5\setcounter{colorCounter}{0}\fi
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.2cm}{%
    \textbf{#2}\\%
	{\footnotesize\addfontfeature{Color=lightgray} #3}\\%
	#4\vspace{\parsep}%
  }\\}
\newcommand{\cert}[2]{%
  #1&\parbox[t]{11.2cm}{%
    \textbf{#2}%
  }\\}



%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{pgffor}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.3}(1.5, 4.33)
  \obeycr
}{%
  \restorecr
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%%%
% Side block (2) %
%%%%%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{pgffor}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{pside}{%
	\let\oldsection\section
	\let\oldsubsection\subsection
	\renewcommand{\section}[1]{
		\par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
	}
	\renewcommand{\subsection}[1]{
		\par\vspace{\baselineskip}{\large\headingfont\color{headercolor} ##1}
	}
	\begin{textblock}{3.3}(1.5, 1.5)
	\obeycr
}{%
	\restorecr
	\end{textblock}
	\let\section\oldsection
	\let\subsection\oldsubsection
}

\newcommand{\rating}[3]{
	\textit{#1}\\
	\foreach \n in {1,...,#2}{
		\ifnum \n < #3
			\faStar
		\else
			\ifnum \n = #3
				\faStar
			\else
				\faStarO
			\fi
		\fi
	}
}

%%%%%%%%%%%%%%%%
% Social icons %
%%%%%%%%%%%%%%%%

\RequirePackage{fontawesome}

% Add instagram logo to fontawesome
\expandafter\def\csname faicon@instagram\endcsname           {\symbol{"F16D}}  \def\faInstagramSquare {{\FA\csname faicon@instagram\endcsname}}

\newcommand{\phone}[1]{%
  \sociallinkwithoutslash{tel:#1}{\faPhoneSquare}{#1}
}

\newcommand{\website}[1]{%
  \href{http://#1}{#1}
}

\newcommand{\email}[1]{%
  %\sociallinkwithoutslash{mailto:#1}{\faAt}{#1}
  \href{mailto:#1}{#1}
}

\newcommand{\instagram}[1]{%
  \social{https://instagram.com}{\faInstagramSquare}{#1}
}

\newcommand{\facebook}[1]{%
  \social{https://facebook.com}{\faFacebookSquare}{#1}
}

\newcommand{\twitter}[1]{%
  \social{https://twitter.com}{\faTwitterSquare}{#1}
}

\newcommand{\github}[1]{%
  \social{https://github.com}{\faGithubSquare}{#1}
}

\newcommand{\linkedin}[2]{%
  \sociallink{https://linkedin.com/in/#1-#2}{\faLinkedinSquare}{#1}
}

\newcommand{\sociallink}[3]{%
  \href{#1}{#2 \raisebox{0.1ex}{\scriptsize/} #3}
}

\newcommand{\sociallinkwithoutslash}[3]{%
  \href{#1}{#2 \raisebox{0.1ex}{\scriptsize} #3}
}

\newcommand{\social}[3]{
  \href{#1/#3}{#2 \raisebox{0.1ex}{\scriptsize/} #3}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
