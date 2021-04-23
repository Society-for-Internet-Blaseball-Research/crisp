h56280
s 00010/00010/00021
d D 1.2 97/12/17 10:34:40 camel 2 1
c changed references to .htm to .html
e
s 00031/00000/00000
d D 1.1 97/09/12 14:56:51 mpmoore 1 0
c date and time created 97/09/12 14:56:51 by mpmoore
e
u
U
f e 0
t
T
I 1
# make zapp help files for crisp2
ZAPPDIR = /util2/zapp

crisp2.zhp: index.html readme.html faq.html info.html info1.html info2.html \
info3.html info4.html info5.html info6.html info7.html ch_manual.html \
D 2
intro.htm intro1.htm intro2.htm intro3.htm intro4.htm intro5.htm \
intro6.htm users2.htm users21.htm users22.htm users23.htm users24.htm \
users25.htm users26.htm users27.htm users28.htm users29.htm users29a.htm \
users29b.htm users29c.htm users29d.htm users29d1.htm users29e.htm \
users29f.htm users29g.htm users29h.htm lessons.html toc.html \
E 2
I 2
intro.html intro1.html intro2.html intro3.html intro4.html intro5.html \
intro6.html users2.html users21.html users22.html users23.html users24.html \
users25.html users26.html users27.html users28.html users29.html users29a.html \
users29b.html users29c.html users29d.html users29d1.html users29e.html \
users29f.html users29g.html users29h.html lessons.html toc.html \
E 2
theory.mif2.html theory.mif4.html theory.mif5.html theory.mif6.html \
theory.mif7.html theory.mif9.html theory.mif10.html theory.mif11.html \
theory.mif12.html theory.mif13.html theory.mif14.html theory.mif15.html \
theory.mif16.html theory.mif17.html theory.mif18.html theory.mif20.html \
theory.mif21.html theory.mif22.html theory.mif23.html theory.mif24.html \
theory.mif25.html mapinfo.html
	$(ZAPPDIR)/bin/zhc -w0 index.html readme.html faq.html  \
info.html info1.html info2.html \
info3.html info4.html info5.html info6.html info7.html ch_manual.html \
D 2
intro.htm intro1.htm intro2.htm intro3.htm intro4.htm intro5.htm \
intro6.htm users2.htm users21.htm users22.htm users23.htm users24.htm \
users25.htm users26.htm users27.htm users28.htm users29.htm users29a.htm \
users29b.htm users29c.htm users29d.htm users29d1.htm users29e.htm \
users29f.htm users29g.htm users29h.htm lessons.html toc.html \
E 2
I 2
intro.html intro1.html intro2.html intro3.html intro4.html intro5.html \
intro6.html users2.html users21.html users22.html users23.html users24.html \
users25.html users26.html users27.html users28.html users29.html users29a.html \
users29b.html users29c.html users29d.html users29d1.html users29e.html \
users29f.html users29g.html users29h.html lessons.html toc.html \
E 2
theory.mif2.html theory.mif4.html theory.mif5.html theory.mif6.html \
theory.mif7.html theory.mif9.html theory.mif10.html theory.mif11.html \
theory.mif12.html theory.mif13.html theory.mif14.html theory.mif15.html \
theory.mif16.html theory.mif17.html theory.mif18.html theory.mif20.html \
theory.mif21.html theory.mif22.html theory.mif23.html theory.mif24.html \
theory.mif25.html mapinfo.html
	cp index.hzhp crisp2.zhp
E 1
