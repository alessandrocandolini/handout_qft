
import animate;
import graph;
import markers;

settings.tex="pdflatex";
//texpreamble("\usepackage{nicefrac}");
defaultpen(fontsize(10pt));


size(70,IgnoreAspect);

//dotfactor=7;

// Integration of exp( -1/2 a x^2 -iOmega t) on IR

real r = 5;

pair A = (r, 0);
pair B = scale(r)*dir(45);
pair C = (0,0);

DefaultHead = HookHead;

markangle("$\frac{\pi}{4}$",A,C,B, Arrow(),gray);
draw( Label("$\gamma_{1}$",0.6), C--A, brown, Arrow(position=0.8));
draw( Label("$\gamma_{2}$",0.6), arc(C,r,0,45), brown, Arrow(position=0.8));
draw( Label("$\gamma_{3}$",0.5), B--C, brown, Arrow(position=0.8));


labelx("$R$", r);



//a[0] = xmin;
//a[n] = xmax;

real xmax = r+1.2;
xaxis(Label("$\Re z $",1, NE),xmin=0, xmax=xmax,Arrow());
yaxis(Label("$\Im z$",1,NE), ymin=0,ymax=r,Arrow(), autorotate=false);

