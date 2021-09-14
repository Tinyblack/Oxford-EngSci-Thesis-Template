# Oxford EngSci Report Template (unofficial)

This repository provides a LaTeX template for Oxford EngSci Report.

It includes the TeX class file and TeX style file which could be utilized with other projects.

The template *.tex file as well as its corresponding generated pdf file are included as well.

The folder is structured as a typical way of writing long report.

## Build tools - VSCode

The tool package I used to write the report and build the pdf file is:

[texlive](https://www.tug.org/texlive/) (provide tex libraries, necessary) +

[VScode](https://code.visualstudio.com/) (code editor, necessary) +

[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) (Extension of VScode, necessary) +

[LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities) (Extension of VScode, necessary) +

[Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) (Extension of VScode, optional)

### File compling process

According to the [instructions](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile#latex-recipes) in LaTeX Workshop document, the tool chain used to derive the pdf file is: **XeLaTeX -> biber -> XeLaTeX**. The configuations in my VSCode setting is writtern as below:

```json
"latex-workshop.latex.tools": [
  
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "--output-directory=%OUTDIR%",
                "%DOC%"
            
            ]
        },
        {
            "name": "bibtex",
            "command": "bibtex",
            "args": [
                "%DOCFILE%"
            ]
        },
        {
            "name": "biber",
            "command": "biber",
            "args": [
                "%DOCFILE%"
            ]
        },
        {
            "name": "pdflatex",
            "command": "pdflatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ]
        },
        {
            "name": "lualatex",
            "command": "lualatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOC%"
            ]
        }
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "xelatex->bibtex->xelatex->xelatex",
            "tools": [
                "xelatex",
                "bibtex",
                "xelatex",
                "xelatex"
            ]
        },
        {
            "name": "xelatex->biber->xelatex->xelatex",
            "tools": [
                "xelatex",
                "biber",
                "xelatex",
                "xelatex"
            ]
        },
        {
            "name": "xelatex->biber->xelatex",
            "tools": [
                "xelatex",
                "biber",
                "xelatex"
            ]
        },
        {
            "name": "xelatex",
            "tools": [
                "xelatex"
            ]
        },
        {
            "name": "xelatex->xelatex",
            "tools": [
                "xelatex",
                "xelatex"
            ]
        },
        {
            "name": "pdflatex",
            "tools": [
                "pdflatex"
            ]
        },
        {
            "name": "lualatex",
            "tools": [
                "lualatex"
            ]
        }
    ],
```

## Example Simple Usage

```latex
\documentclass[12pt, a4paper]{OxReport}%
\usepackage{OxReport}%
\addbibresource{IEEEexample.bib} 

%-----------------------------------------------%
%           Main Content of the Report          %
%-----------------------------------------------%

\begin{document}
    \doublespacing%
    \par\noindent <Your content here>.
\end{document}
```

## Example Complex Usage

```latex
\documentclass[12pt, a4paper]{OxReport}%
\usepackage{OxReport}%
\addbibresource{IEEEexample.bib} 

%-----------------------------------------------%
%           Main Content of the Report          %
%-----------------------------------------------%

\begin{document}
    \doublespacing%
    \include{Chapters/Report_00_TitlePage}%
    \begin{romanpages}
        \doublespacing%
        \include{Chapters/Report_01_Abstract}%
        \singlespacing%
        \include{Chapters/Report_02_TableOfContent}%
        \doublespacing%
    \end{romanpages}
    \doublespacing%
    \include{Chapters/Report_CH1_First Chapter}%
    \include{Chapters/Report_CH2_Second Chapter}%
    \include{Chapters/Report_CH3_Third Chapter}%
    \include{Chapters/Report_CH4_Fourth Chapter}%
    \include{Chapters/Report_CH5_Fifth Chapter}%
    \singlespacing%
    \include{Chapters/Report_CH6_Bibliography}%
\end{document}
```

## Author Information:

* Author: Zimo Zhao
* Dept. Engineering Science, University of Oxford, Oxford OX1 3PJ, UK
* Email: [zimo.zhao@eng.ox.ac.uk](mailto:zimo.zhao@eng.ox.ac.uk)
* Website: [https://eng.ox.ac.uk/smp](https://eng.ox.ac.uk/smp)
* Reporting issues and bugs to my Github repository is more welcomed.

## Known Issues

1. NOT supoort Overleaf. It requires local compliers to work. It is mainly caused by the Garamond font in the Title page. Overleaf do not support Garamond font. Currently I'm trying to find a walkthrough with different packages.

## Version History:

1.00 ----- 14 Sep 2021 ----- Initial Release
