\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FAESATeX}
\LoadClass[a4paper,12pt]{article}

\usepackage[export]{adjustbox}
\usepackage[document]{ragged2e}
\usepackage[
    top=3cm,
    bottom=2cm,
    right=2cm,
    left=3cm]{geometry}

\usepackage{
    lipsum,
    blindtext,
    fontspec,
    graphicx,
    paracol,
    tocloft,
    fancyhdr,
    setspace,
    sectsty,
    wrapfig,
    hyperref
}

% TROCANDO A LEGENDA PADRAO DO GRAPHICX
\renewcommand{\figurename}{\fontsize{10pt}{12pt}\selectfont Figura}

% TAMANHO DA FONTE DA SECTION
\sectionfont{\bfseries\fontsize{12pt}{14pt}\selectfont}
\subsectionfont{\bfseries\fontsize{12pt}{14pt}\selectfont}
\subsubsectionfont{\emph\fontsize{12pt}{14pt}\selectfont}

\makeatletter
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname\ \ } % reformata o numero da section e insere um ponto no final
\makeatother


\setmainfont{%
    Arial%
}

% FancyHDR
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}

% coloca pontos no sumario
\renewcommand\cftsecfont{\normalfont}
\renewcommand\cftsecpagefont{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand\cftsecdotsep{\cftdot}
\renewcommand\cftsubsecdotsep{\cftdot}
\renewcommand{\contentsname}{\centerline{\fontsize{12pt}{14pt}\selectfont SUMÁRIO}}
\renewcommand{\cftsecfont}{\bfseries}

% NOVOS COMANDOS %
\makeatletter

\newcommand{\escola}[1]{
    \newcommand{\@escola}{
        \textbf{\MakeUppercase{#1}}
    }
}

\newcommand{\autor}[1]{
    \newcommand{\@autor}{
        \textbf{\MakeUppercase{#1}}
    }
}

\newcommand{\titulo}[1]{
    \newcommand{\@titulo}{
        \textbf{\MakeUppercase{#1}}
    }
}

\newcommand{\logradouro}[1]{
    \newcommand{\@logradouro}{
        \MakeUppercase{#1}
    }
}

\newcommand{\fimpagina}{
    \begin{center}
        \vspace*{\fill}
        \begin{spacing}{1.5}
            \@logradouro
        \end{spacing}
    \end{center}
    \newpage
}

\newcommand{\@imprimirautores}{
    \begin{spacing}{1.5}
        \@autor
    \end{spacing}
}

\newcommand{\capa}{
    \begin{titlepage}
        \centering
        \@escola\\
        \vspace*{2\baselineskip}
        \@imprimirautores
        \vspace*{\fill}
        {\fontsize{14pt}{16pt}\selectfont \@titulo}\\
        \vspace*{\fill}
        \fimpagina
    \end{titlepage}
}

\newcommand{\folhaderosto}[1]{
    \thispagestyle{empty}

    \begin{center}

        {\bfseries
            \fontsize{12pt}{14pt}\selectfont
            \@imprimirautores
            \vspace*{12\baselineskip}
            \@titulo\\
            \vspace*{1\baselineskip}
        }

        \begin{paracol}{2}
            \switchcolumn
            \begin{justify}
                \fontsize{11pt}{13pt}\selectfont
                #1
            \end{justify}
        \end{paracol}

        \fimpagina
    \end{center}
}

\newcommand{\sumario}{
    \newpage
    \tableofcontents
    \thispagestyle{empty}
    \newpage
    \stepcounter{page}
}

\newenvironment{introducao}{
    \justify
    \section*{INTRODUÇÃO}
    \addcontentsline{toc}{section}{\bfseries INTRODUÇÃO}
}{\fimpagina}

\providecommand{\FAESATeX}{
    \smash{\raisebox{-0.26\height}{\includegraphics[width=1.5cm]{./imagens/FAESATeX_sem_logo.png}}}
}

\newcommand{\fimFAESATeX}[1]{
    \vspace*{\fill}
    \thispagestyle{empty}
    \begin{center}
        #1\\
        \includegraphics[width=\textwidth, height=\textheight, keepaspectratio]{./imagens/FAESATeX_com_logo.png}
    \end{center}
}

\makeatother
