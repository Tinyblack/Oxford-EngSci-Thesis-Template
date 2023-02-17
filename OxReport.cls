%% Author: Zimo Zhao <zimo.zhao@eng.ox.ac.uk>
%% Soft Matter Photonics Group @ EngSci Oxford
%% Copyright (c) 2023 

%-----------------------------------------------%
% Start of class marcos
%-----------------------------------------------%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{OxReport}[2021/07/14 OxEngSci Report Template]

%-----------------------------------------------%
% Declaration Options for different document
%-----------------------------------------------%

%% Package options for biblatex in Thesis
\DeclareOption{Thesis}{
    \PassOptionsToPackage{style=ieee,citestyle=numeric-comp}{biblatex}
}

%% Package options for biblatex in Transfer of Status
\DeclareOption{Transfer}{
    \PassOptionsToPackage{style=ieee,citestyle=numeric-comp}{biblatex}
}

%% Package options for biblatex in Confirmation of Status
\DeclareOption{Confirmation}{
    \PassOptionsToPackage{bibstyle=authortitle,citestyle=authoryear,sorting=none,maxbibnames=99,maxcitenames=1,mincitenames=1,uniquelist=false,uniquename=false}{biblatex}
}

\DeclareOption{print}{
    \PassOptionsToPackage{style=ieee,citestyle=numeric-comp}{biblatex}
}

%% Package options for biblatex in Transfer of Status
\DeclareOption{digital}{
    \PassOptionsToPackage{style=ieee,citestyle=numeric-comp}{biblatex}
}

\newif\ifOxReport@Print
\newif\ifOxReport@Digital

\DeclareOption{print}{\OxReport@Printtrue}
\DeclareOption{digital}{\OxReport@Digitaltrue}


%% Execute default options
\ExecuteOptions{Thesis}
\ExecuteOptions{digital}

% Process given options
\ProcessOptions\relax

%-----------------------------------------------%
% Load base class
%-----------------------------------------------%

\LoadClass[12pt,a4paper]{report}

%-----------------------------------------------%
% Load packages
%-----------------------------------------------%

\RequirePackage{geometry}%
\RequirePackage{fontspec}%
\RequirePackage{graphicx}%
\RequirePackage{float}%
\RequirePackage[titles]{tocloft}%
\RequirePackage{titletoc}%
\RequirePackage{titlesec}%
\RequirePackage{setspace}%
\RequirePackage{array}%
\RequirePackage{enumerate}%
\RequirePackage{enumitem}%
\RequirePackage{fancyhdr}%
\RequirePackage{amsmath}%
\RequirePackage{amssymb}%
\RequirePackage[hidelinks]{hyperref}%
\RequirePackage{caption}%
\RequirePackage{subcaption}%
\RequirePackage{color}%
\RequirePackage{supertabular}%
\RequirePackage[skip]{parskip}%
\RequirePackage{xparse}%
\RequirePackage{soul}%
\RequirePackage{calc}%
\RequirePackage[version=4]{mhchem}%
\RequirePackage{adjustbox}%
\RequirePackage{microtype}%
\RequirePackage{lipsum}%
\RequirePackage{bookmark}%
\RequirePackage{etoolbox}%
\RequirePackage{pdfpages}%
\RequirePackage{biblatex}%
\RequirePackage{xspace}%
\RequirePackage{xr}
\RequirePackage{refcount}
\RequirePackage{subfiles}

%-----------------------------------------------%
% Layout Control for the report
%-----------------------------------------------%

% Page margins configuration
\geometry{left=2cm, top=1cm, right=2cm, bottom=2cm,includehead}%

%-----------------------------------------------%
% Captions setup
%-----------------------------------------------%

% Caption margins to the context
\captionsetup{margin={5pt,5pt}}%
% Caption fontsize
\captionsetup{font={small}}%
% Caption label font
\captionsetup{labelfont={bf}}%
% Subcaption fontsize
\captionsetup[sub]{font={small}}%

%-----------------------------------------------%
% Equations breakup
%-----------------------------------------------%

% Allow equation breakup over the pages
\allowdisplaybreaks%

%-----------------------------------------------%
% Tabular setup
%-----------------------------------------------%

% Set array rule width
\setlength{\arrayrulewidth}{0.5mm}%
% Set arry rule width
\setlength{\tabcolsep}{12pt}%
% Set arry line stretch
\renewcommand{\arraystretch}{1.5}%

%-----------------------------------------------%
% Page header/footer setup (default: OFF)
%-----------------------------------------------%

\pagestyle{fancy}
\setlength{\headheight}{15pt}
\setlength{\headsep}{15pt}
\fancyhf{}
% \fancyhead[R]{\rightmark}
\fancyfoot[L]{\leftmark}
\fancyfoot[R]{\thepage}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headheight}{27.41803pt}
\addtolength{\topmargin}{-12.41803pt}

%-----------------------------------------------%
% Set fonts for the document
%-----------------------------------------------%

\ifOxReport@Digital

% Garamond font with wider letter space
\newfontfamily\Garamondfontwide{EBGaramond}[
    Path=\subfix{./Fonts/EBGaramond/ttf/}, 
    Extension=.ttf, 
    UprightFont = *-Regular, 
    BoldFont = *-SemiBold, 
    ItalicFont = *-Italic, 
    BoldItalicFont = *-BoldItalic, 
    LetterSpace=35.00
    ]%

% Garamond font with normal letter space
\newfontfamily\Garamondfontnormal{EBGaramond}[
    Path=\subfix{./Fonts/EBGaramond/ttf/}, 
    Extension=.ttf, 
    UprightFont = *-Regular, 
    BoldFont = *-SemiBold, 
    ItalicFont = *-Italic, 
    BoldItalicFont = *-BoldItalic
    ]%

\setmainfont{EBGaramond}[
    Path=\subfix{./Fonts/EBGaramond/ttf/}, 
    Extension=.ttf, 
    UprightFont = *-Regular, 
    BoldFont = *-SemiBold, 
    ItalicFont = *-Italic, 
    BoldItalicFont = *-BoldItalic, 
    WordSpace=1.2,LetterSpace=0.5
    ]%

\fi
\ifOxReport@Print

% Garamond font with wider letter space
\newfontfamily\Garamondfontwide{EBGaramond}[
    Path=\subfix{./Fonts/EBGaramond/otf/}, 
    Extension=.otf, 
    UprightFont = *-Regular, 
    BoldFont = *-SemiBold, 
    ItalicFont = *-Italic, 
    BoldItalicFont = *-BoldItalic, 
    LetterSpace=35.00
    ]%

% Garamond font with normal letter space
\newfontfamily\Garamondfontnormal{EBGaramond}[
    Path=\subfix{./Fonts/EBGaramond/otf/}, 
    Extension=.otf, 
    UprightFont = *-Regular, 
    BoldFont = *-SemiBold, 
    ItalicFont = *-Italic, 
    BoldItalicFont = *-BoldItalic
    ]%

\setmainfont{EBGaramond}[
    Path=\subfix{./Fonts/EBGaramond/otf/}, 
    Extension=.otf, 
    UprightFont = *-Regular, 
    BoldFont = *-SemiBold, 
    ItalicFont = *-Italic, 
    BoldItalicFont = *-BoldItalic, 
    WordSpace=1.2,LetterSpace=0.5
    ]%
\fi
    
%-----------------------------------------------%
% Setup an environment for roman page numbers
%-----------------------------------------------%

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{2}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabi c{page}}\setcounter{page}{1}}

%-----------------------------------------------%
% Title Page Content Control
%-----------------------------------------------%

% Horizental rule in title page
\newcommand{\titleHRule}
{\rule{\linewidth}{0.5pt}\par}%

% University name in title page
\newcommand{\titleUniversity}[1]
{{\Garamondfontwide\large\rule[4.5pt]{2pt}{2pt}\hspace{0.5em}#1\hspace{0.5em}\rule[4.5pt]{2pt}{2pt}\par}}%

% Department name in title page
\newcommand{\titleDepartment}[1]
{{\Garamondfontwide\large\rule[4.5pt]{2pt}{2pt}\hspace{0.5em}#1\hspace{0.5em}\rule[4.5pt]{2pt}{2pt}\par}}%

% Thesis/Report title in title page
\newcommand{\titleTitle}[1]
{{\Garamondfontnormal\fontsize{26pt}{20pt}\selectfont\bfseries #1\par}}%

% Document Type in title page
\newcommand{\titleType}[1]
{{\Garamondfontnormal\large\rule[4.5pt]{2pt}{2pt}\hspace{0.5em}#1\hspace{0.5em}\rule[4.5pt]{2pt}{2pt}\par}}%

% Author name in title page
\newcommand{\titleName}[1]
{{\Garamondfontnormal\fontsize{22pt}{10pt}\selectfont\bfseries #1\par}}%

% College name in title page
\newcommand{\titleCollege}[1]
{{\Garamondfontnormal\fontsize{16pt}{10pt}\selectfont #1\par}}%

% Supervisor group information in title page
\newcommand{\titleSupervisor}[1]
{{\Garamondfontnormal\fontsize{14pt}{20pt}\selectfont #1\par}}%

% Date information in title page
\newcommand{\titleDate}[1]
{{\Garamondfontwide\fontsize{14pt}{20pt}\selectfont #1\par}}%

% Supervisor group information in title page
\newcommand{\titleThesis}[1]
{{\Garamondfontnormal\fontsize{14pt}{20pt}\selectfont #1\par}}%

%-----------------------------------------------%
% Declaration Page Content Control
%-----------------------------------------------%

\newcommand{\declarationname}{Declaration}
\newenvironment{declaration}{
    \thispagestyle{plain}
\begin{center}%
\bfseries \Large \declarationname
\end{center}\begin{center}}{\end{center}\par\vfil}

%-----------------------------------------------%
% Dedication Page Content Control
%-----------------------------------------------%

\newcommand{\dedicationname}{Dedication}
\newenvironment{dedication}{
    \thispagestyle{empty}
\begin{center}}%
{\end{center}\par\vfil}

%-----------------------------------------------%
% Acknowledgements Page Content Control
%-----------------------------------------------%

\newcommand{\acknowledgementname}{Acknowledgements}
\newenvironment{acknowledgements}{
    \thispagestyle{plain}
\begin{center}%
\bfseries \Large \acknowledgementname
\end{center}\phantomsection\addcontentsline{toc}{section}{\normalsize\bfseries \acknowledgementname}}{\par\vfil}

%-----------------------------------------------%
% Achievements Page Content Control
%-----------------------------------------------%

\newcommand{\achievementname}{Achievements}
\newenvironment{achievements}{
\thispagestyle{plain}
\begin{center}%
\bfseries \Large \achievementname
\end{center}\phantomsection\addcontentsline{toc}{section}{\normalsize\bfseries \achievementname}}{\par\vfil}

%-----------------------------------------------%
% Abstract Page Content Control
%-----------------------------------------------%

\makeatletter
\renewenvironment{abstract}{%
\thispagestyle{plain}
\null\vfil
\@beginparpenalty\@lowpenalty
\begin{center}%
  \bfseries \Large \abstractname
  \@endparpenalty\@M
\end{center}\phantomsection\addcontentsline{toc}{section}{\normalsize\bfseries \abstractname}}%
{\par\vfil\null}
\makeatother

%-----------------------------------------------%
% Change the appearance of Chapter Title
%-----------------------------------------------%

% Change the spacing of the Chapter title
\titlespacing*{\chapter}{0pt}{-20pt}{30pt}

% Change the format of the Chapter title
\titleformat{\chapter}[display]
{\bfseries\Large}
{\filleft\MakeUppercase{\chaptertitlename} \Huge\thechapter}
{4ex}
{\titlerule\vspace{0.6ex}\filright}%
[\vspace{1.5ex}\titlerule]%

%-----------------------------------------------%
% Change the appearance of Section Title
%-----------------------------------------------%

% Change the format of the Section title
\titleformat{\section}{\fontsize{14pt}{12pt}\selectfont\bfseries}{\thesection}{1em}{}%

% Change the format of the subSection title
\titleformat{\subsection}{\fontsize{13pt}{12pt}\selectfont\bfseries}{\thesubsection}{1em}{}%

% Change the format of the subsubSection title
\titleformat{\subsubsection}{\fontsize{12pt}{12pt}\selectfont\bfseries}{\thesubsubsection}{1em}{}%

%-----------------------------------------------%
% Change the appearance of ToC Entries
%-----------------------------------------------%

% Change the appearance of chapter entries
\titlecontents{part}
[2.3em] % ie, 1.5em (chapter) + 2.3em
{}
{\contentslabel{2.3em}}
{\hspace*{-2.3em}}
{\titlerule*[1pc]{.}\contentspage}

% Change the appearance of chapter entries
\titlecontents{chapter}
[3pc]
{\addvspace{1.5pc}\filcenter}
{\normalsize\bfseries CHAPTER \thecontentslabel:\enspace}
{\huge}
{} % That is, without page number
[\addvspace{.5pc}]

% Change the appearance of chapter entries
\titlecontents{section}
[2.3em] % ie, 1.5em (chapter) + 2.3em
{}
{\contentslabel{2.3em}}
{\hspace*{-2.3em}}
{\titlerule*[1pc]{.}\contentspage}

% Change the appearance of chapter entries
\titlecontents{subsection}
[4.6em] % ie, 1.5em (chapter) + 2.3em
{}
{\contentslabel{2.3em}}
{\hspace*{-2.3em}}
{\titlerule*[1pc]{.}\contentspage}

% Change the appearance of chapter entries
\titlecontents{subsubsection}
[6.9em] % ie, 1.5em (chapter) + 2.3em
{}
{\contentslabel{2.3em}}
{\hspace*{-2.3em}}
{\titlerule*[1pc]{.}\contentspage}

%-----------------------------------------------%
% Change the section names
%-----------------------------------------------%

\renewcommand\contentsname{Contents}
\renewcommand\listfigurename{List of Figures}
\renewcommand\listtablename{List of Tables}
\renewcommand\bibname{\bfseries Reference}
\renewcommand\indexname{Index}
\renewcommand\figurename{\bfseries Figure}
\renewcommand\tablename{\bfseries Table}
\renewcommand\partname{Part}
\renewcommand\chaptername{Chapter}
\renewcommand\appendixname{Appendix}
\renewcommand\abstractname{Abstract}
%\renewcommand{\equationname}{Equation}
\renewcommand\thesubsubsection{(\roman{subsubsection})}

%-----------------------------------------------%
% Change the cross reference names              %
%-----------------------------------------------%

\renewcommand{\figurename}{\textbf{Figure}}
\renewcommand{\tablename}{\textbf{Table}}
%\renewcommand{\partname}{Part}
%\renewcommand{\appendixname}{Appendix}
%\renewcommand{\equationname}{Equation}
%\renewcommand{\Itemname}{item}
%\renewcommand{\chaptername} {chapter}
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Section}
\renewcommand{\subsubsectionautorefname}{Section}
\renewcommand{\chapterautorefname}{Chapter}
%\renewcommand{\paragraphname}{paragraph}
%\renewcommand{\Hfootnotename}{footnote}

%-----------------------------------------------%
% Change the TODO label and REMARK label        %
%-----------------------------------------------%

\newcommand{\TODO}[1]{\textcolor{blue}{\textbf{\hl{(TODO: #1)}}}\xspace}
\newcommand{\REMARK}[1]{\textcolor{red}{\textbf{\hl{(REMARK: #1)}}}\xspace}

%-----------------------------------------------%
% Customise new units
%-----------------------------------------------%

\newcommand*{\Vrms}{$\text{V}_\text{rms}$\xspace}%
\newcommand*{\um}{{\textmu}m\xspace}%
\newcommand*{\uL}{{\textmu}L\xspace}%
\newcommand*{\degree}{$^{\circ}$\xspace}%
\newcommand*{\degreeC}{$^{\circ}$C\xspace}%
\newcommand*{\conductivity}{$\text{S}{\cdot}\text{cm}^{-1}$\xspace}%
\newcommand*{\resistance}{$\Omega\cdot\square^{-1}$\xspace}%
\newcommand*{\wt}{$\text{wt}\%$\xspace}%

%-----------------------------------------------%
% bibliography entry customisation
%-----------------------------------------------%

% Set bibliography entry space
\setlength{\bibitemsep}{10pt}

% Annotation handling function
\renewcommand*{\mkbibnamegiven}[1]{%
\ifitemannotation{highlight}
{\textbf{#1}}
{#1}}

% Annotation handling function
\renewcommand*{\mkbibnamefamily}[1]{%
\ifitemannotation{highlight}
{\textbf{#1}}
{#1}}

%-----------------------------------------------%
% Tweaks to adjust the document
%-----------------------------------------------%

% Set the indent to be zero
\newcommand{\tocstopwriting}{\addtocontents{toc}{\protect\setcounter{tocdepth}{-5}}\xspace}
% Set the indent to be zero
\newcommand{\tocresumewriting}{\addtocontents{toc}{\protect\setcounter{tocdepth}{\arabic{tocdepth}}}\xspace}

%-----------------------------------------------%
% Paragraph indent configuration
%-----------------------------------------------%

% Set the indent to be zero
\setlength\parindent{0pt}

%-----------------------------------------------%
% End of class marcos
%-----------------------------------------------%

\endinput