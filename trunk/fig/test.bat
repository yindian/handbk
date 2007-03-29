@echo off
if ".%1"=="." goto end
echo \documentclass{article} >test.tex
echo \usepackage{epsfig} >>test.tex
echo \begin{document} >>test.tex
echo Hello, >>test.tex
echo \fbox{\epsfig{file= %1}} >>test.tex
echo World! >>test.tex
echo \end{document} >>test.tex
latex test.tex
start test.dvi
:end
echo Thanks for using
