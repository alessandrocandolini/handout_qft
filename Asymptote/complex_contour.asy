
import animate;
import graph;
import stats;

settings.tex="pdflatex";
//texpreamble("\usepackage{nicefrac}");
defaultpen(fontsize(10pt));


size(300,100,IgnoreAspect);

//dotfactor=7;

// Integration of exp( -1/2 a x^2 -iOmega t) on IR

real lambda = 5;
real omega = 1;
real a = 1;

pair A = (-lambda, 0);
pair B = (lambda, 0);
pair C = (lambda, omega/a);
pair D = (-lambda, omega/a);

DefaultHead = HookHead;

draw( Label("$\gamma_{1}$",0.7), A--B, brown, Arrow(position=0.7));
draw( Label("$\gamma_{2}$",0.7), B--C, brown, Arrow(position=0.7));
draw( Label("$\gamma_{3}$",0.7), C--D, brown, Arrow(position=0.7));
draw( Label("$\gamma_{4}$",0.7), D--A, brown, Arrow(position=0.7));

labelx("$\lambda$", lambda);
labelx("$-\lambda$", -lambda);
labely(Label("$i\omega / a$", NW), omega/a);



//a[0] = xmin;
//a[n] = xmax;

real xmax = lambda+0.8;
real ymax = omega/a + 0.5;
xaxis(Label("$\Re z $",1, E+(1,0)),xmin=-xmax, xmax=xmax,Arrow());
yaxis("$\Im z$",ymax=ymax,Arrow, autorotate=false);

