[![release](https://img.shields.io/github/v/release/Tinyblack/Oxford-EngSci-Report-Template?display_name=tag)]()
[![updated](https://img.shields.io/visual-studio-marketplace/last-updated/James-Yu.latex-workshop)](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
# Oxford EngSci Thesis Template

## Introduction

This repository provides a LaTeX template for the written work to be submitted during the DPhil study in Department of Engineering Science, University of Oxford. It includes the examples for *Transfer of Status*, *Confirmation of DPhil Status* and *Thesis*, which are the key milestones to achieve during a DPhil study.

This repository provides a customized document class file (```OxReport.cls```) developed based on TeX default ```report.cls``` which is suitable for all three types of the documents to write.

Apart from the options inherited from ```report.cls```, ```OxReport.cls``` also provides options for document type selection (```Transfer```, ```Confirmation``` and ```Thesis```) and font type selection (```digital``` for ```*.ttf``` fonts and ```print``` for ```*.otf``` fonts)

If you are writing a huge document, like your Thesis, it may take a long time to compile the whole file while you just change the context a little. To solve this problem, **this template allows you to compile each sub-file individually** (e.g. preview your single chapter only).

The folder of this repository is structured as a typical way of writing all three documents under a single folder.

---

## Use the template (Overleaf)

1. Fork this repository to your own account.
2. Log into your own [Overleaf project page](https://www.overleaf.com/project).
3. New project -> Import from GitHub.
4. Link your GitHub account as required (if you haven't done so far).
5. Select the repository you forked and wait for the import to complete.
6. Open the Overleaf menu and change the compiler to XeLaTeX.
7. For the rest of options: 
   - TeX Live version >= 2022.
   - Main document is the one you are working on.
8. Hit Recompile.
9. Warnings may occur as the template use ```biblatex``` instead ```bibtex``` to manage the bibliography.
10. Check if the document generated as you designed.
11. Refer to the log for the errors. Otherwise, enjoy your writing.

---

## Use the template (Local Environment)

Use the local TeX compiling environment will provide you with a full power of the TeX system and gives you freedom to customize your own style entirely. However, some IDEs provided by the TeX organization may not be that easy to use. So here a new workflow using Visual Studio Code as the main IDE is suggested. It might be a bit complex to configure the environment, but once it has done, you will benefit a lot for the full-power local compiling in the future, especially when you want to use LaTeX as the main writing tool. 


### 1. Download and install TeX Live

>
> TeX Live is intended to be a straightforward way to get up and running with the TeX document production system. It provides a comprehensive TeX system with binaries for most flavors of Unix, including GNU/Linux and macOS, and also Windows. It includes all the major TeX-related programs, macro packages, and fonts that are free software, including support for many languages around the world. Many Unix/GNU/Linux operating systems provide TeX Live via their own distributions and package managers.
>

To download and install,
- **For Windows and Linux users**, download the [online installer](https://www.tug.org/texlive/acquire.html) from their [official website](https://www.tug.org/texlive/). If the installer is reported as unsafe software in Windows and cannot run in anyway, you may need to download an offline ISO instead. Select the path that you'd like to install and install ALL packages. It will take a long time to finish so make sure you are in the good internet environment and be patient. 

    After the installation, you need to add your installation path to ```PATH``` in system environment variables. The typical path is ```<your:\path\to\texlive>\texlive\2022\bin\win32```. If everything is write, when you run ```xelatex``` in ```powershell``` or ```cmd```, you will see the response from the executable instead of error messages.

- **For MacOS users**, [MacTex](https://www.tug.org/mactex/) is a much more convenient way to install TeX Live. Click and install, simple and easy. After the installation, Run ```Tex Live Utility``` from launchpad and update/install all packages listed, that will, again, take a long time. After the update, everything will be fine then.

### 2. Download and install Visual Studio Code

You can download [Visual Studio Code](https://code.visualstudio.com/) from their [official website](https://code.visualstudio.com/#alt-downloads). Note that basing on the system you want to deploy your compiling environment and the account access your were granted, you may need to choose the correct installer to complete the installation. The main reason to choose VSCode as main IDE is that it has so many powerful extensions which are helpful to speed up the TeX document writing and compiling.

### 3. Install extensions for Visual Studio Code

Navigate to the Extension tab on the side, and look up the following extensions through the search box. Some extensions require a window reload after the installation. Just come back to this tab and continue the installation. 

- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)

    This is the core extension to establish the workflow of TeX document writing.

- [LaTeX Utilities](https://marketplace.visualstudio.com/items?itemName=tecosaur.latex-utilities) 

    This extension Provides some extra functions to assist writing like word count.

- [LTeX](https://marketplace.visualstudio.com/items?itemName=valentjn.vscode-ltex)

    This extension provides a language tool about grammar/spell checking in TeX environment

- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)

    If you want to use git to back up, sync or collaborate your work, use this extension to make your git history more clear.

- [Git Flow](https://marketplace.visualstudio.com/items?itemName=Serhioromano.vscode-gitflow)

    If you want to use try a better work flow on git, you can try git flow.

- [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github)

    This is the official support of GitHub pull requests and issues.

- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)

    It makes your workspace looking beatuiful. Completely optional.


### 4. Configure settings

This workspace has already had necessary configurations have been embedded in the workspace when release and theoretically speaking you can use it out of box. In the LaTeX tab on the side, expand "Build LaTeX project" menu, if you can see a bunch of recipes, that means everything is right and you can move to the next step

And just in case if you want to modify the compiling recipe for your own purpose, here is the introduction. According to the [instructions](https://github.com/James-Yu/LaTeX-Workshop/wiki/Compile#latex-recipes) in LaTeX Workshop document, the tool chain used to derive the PDF file from a TeX document with bibliography is: **XeLaTeX -> biber -> XeLaTeX -> XeLaTeX**. The configurations on the recipes in the setting is written as below:

```json
"latex-workshop.latex.tools": [{
		"name": "xelatex",
		"command": "xelatex",
		"args": [
			"--shell-escape",
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
		"name": "xelatex->xelatex->xelatex",
		"tools": [
			"xelatex",
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

### 5. Compile your file

Now, you can build any of the three main documents (```ThesisMain.tex```, ```ThesisConfirmation.tex```, ```ThesisTransfer.tex```) using the receipt **XeLaTeX -> biber -> XeLaTeX -> XeLaTeX** (as they have citations and bibliography in the context). Wait for it to finish, and you can view the PDF file it generated alongside the source file location.

However, if you are writing a huge document, like your Thesis, it may take a long time to compile the whole file while you just change the context a little. To solve this problem, this template allows you to compile each sub-file individually. So if you go to any sub-folders like ```texMain```, ```texConfirmation``` and ```texTransfer``` and compile any single file, you will get a single file of the content you selected to compile only.

### 6. Enjoy writing!

Hope your enjoy!

## Note

The font included in this repository is [EB Garamond](http://www.georgduffner.at/ebgaramond/) which is an open source font under the term of [SIL Open Font License](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL). The licence is attached in the ```Fonts``` folder as well.

## Author Information:

* Author: Zimo Zhao
* DPhil Student in Dept. Engineering Science, University of Oxford, Oxford OX1 3PJ, UK
* Email: [zimo.zhao@eng.ox.ac.uk](mailto:zimo.zhao@eng.ox.ac.uk)
* Website: [https://eng.ox.ac.uk/smp](https://eng.ox.ac.uk/smp)
* Reporting issues and bugs to my GitHub repository is more welcomed.

## To Do

1. Add more examples in the example TeX files to show how to insert the images, equations and tables.
2. Add more examples about how to use cross reference among different files (```xr``` package related).



## Version History:

1.0.0 ----- 14 Sep 2021 ----- Initial Release

2.0.0 ----- 17 Feb 2023 ----- Rewrite the template and enrich README
