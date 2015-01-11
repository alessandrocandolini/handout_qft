
import graph;
import math;

//------------------------------------------------------------------------------
//
// lattice.asy
// 
// Output:  (pdf/eps files)
//
//   - lattice_path_integral
//     The discretized approximation of the path integral. (Fig. 8.4)
//
//   - fs_representation
//     Schematic representation of F(s). (Fig. 8.5)
//
//   - proto_feynman_diagrams0,1,2,3
//     Schematic representation of series expansion. (Fig. 8.6)
//
// Notes:
//
// Last modified:
//   
//   $Id: lattice.asy,v 1.1 2012/07/10 23:36:27 acando Exp $
//
//------------------------------------------------------------------------------


// --- lattice_path_integral ------

size(200,120,IgnoreAspect);
string title = "lattice_path_integral";
write("Drawing " + title + "...");

// Fill arrays (t,x).

real [] x;
x[0] = 1;
x[1] = x[0] +2;
x[2] = x[1] - 1;
x[3] = x[2] +2.5;
x[4] = x[3] +0.7;
x[5] = x[4] +2;
x[6] = x[5] +3;
x[7] = x[6] +1.3;
int npt = x.length;
real [] t;
real t0 = 1;
real epsilon = 1;

for (int point = 0; point < npt; ++point )
{
  t[point] =  t0 + point * epsilon;
}

// Plot 

draw(graph(x,t),brown);
crop();
xlimits(0,x[npt-1]+1);
ylimits(0,t[npt-1]+1);

xaxis(Arrow);
yaxis(Arrow, autorotate=false);

// Draw grid and labels 

for (int point = 0; point < npt; ++point )
{
  // grid
  yequals(t[point], lightgray);
  xequals(x[point], ymin=0, ymax=t[point],lightgray+dashed);
  // labels
  if ( npt > 3 && point < npt-5 )
  {
    labelx("$x_{"+(string)point+"}$",x[point]);
    labely("$t_{"+(string)point+"}$",t[point]);
  }
  else if ( point == npt -4 )
  {
    labelx("$\cdots$",x[point]);
    labely("$\vdots\, $",t[point]);
  }
  else if ( point == npt -2 )
  {
    labelx("$x_{N-1}$",x[point]);
    labely("$t_{N-1}$",t[point]);
  }
  else if ( point == npt -1 )
  {
    labelx("$x$",x[point]);
    labely("$t$",t[point]);
  }
  dot((x[point],t[point]));
}

shipout(title);

// --- fs_representation  ------
title = "fs_representation";
write("Drawing " + title + "...");
erase();

pair A = (1,1);
pair B = (3,3);
pair C = (2.5,1.5) ;

draw(A--C--B,brown);
xlimits(0,xpart(B)+1);
ylimits(0,ypart(B)+1);
crop();
dot(A);
dot(B);
dot(C);

xaxis("$x$", Arrow);
yaxis("$t$",  Arrow, autorotate=false);

labelx("$x_{a}$", xpart(A));
labelx("$x_{b}$", xpart(B));
labelx("$x_{c}$", xpart(C));

labely("$t_{a}$", ypart(A));
labely("$t_{b}$", ypart(B));
labely("$s$",     ypart(C));

yequals(ypart(A), xmin=0, xmax=xpart(A), dashed+gray);
yequals(ypart(B), xmin=0, xmax=xpart(B), dashed+gray);
yequals(ypart(C), xmin=0, xmax=xpart(C), dashed+gray);

xequals(xpart(A), ymin=0, ymax=ypart(A), dashed+gray);
xequals(xpart(B), ymin=0, ymax=ypart(B), dashed+gray);
xequals(xpart(C), ymin=0, ymax=ypart(C), dashed+gray);

shipout(title);


// --- proto_feynman_diagrams ------

title = "proto_feynman_diagrams0";
write("Drawing " + title + "...");
erase();

size(100,100,IgnoreAspect);


// auxiliary picture  (blob V and external points A,B)
picture pic;
size(pic,100,100,IgnoreAspect);
path setE = (5,-2) .. (3,-4) .. (1,-3) .. (-2, -3) .. (0, 5) .. \
       (3, 4) .. (5, 3) .. cycle;
filldraw(pic, setE, lightgray);
label(pic,"$V$", (4.8,0.9));
pair A=(0,-9);
pair B=(2.2,9.5);
dot(pic,"$a$", A);
dot(pic,"$b$",B);

// 0th order

add(pic);
draw(A--B, brown,MidArrow);
shipout(title);

// 1st order 

erase();
title = "proto_feynman_diagrams1";
write("Drawing " + title + "...");
pair C=(-1,2);
add(pic);
draw(A--C, brown,MidArrow);
draw(C--B, brown,MidArrow);
dot("$c$",C,W);
shipout(title);

// 2nd order
erase();
title = "proto_feynman_diagrams2";
write("Drawing " + title + "...");
add(pic);
pair D=(3,0.5);
draw(A--D, brown,MidArrow);
draw(D--C,brown);
draw(C--B, brown,MidArrow);
dot("$c$",C,W);
dot("$d$",D,SE);
shipout(title);

// 6th order 
erase();
title = "proto_feynman_diagrams3";
write("Drawing " + title + "...");
add(pic);
pair m1 = midpoint(C--D);
pair m2 = midpoint(C--m1);
pair m3 = midpoint(m1--D);

real h = 0.3;
pair v = h*(1 , -1.0 / slope(C--D, m1));


pair z0 = midpoint (m3--D) - v ;
pair z1 = midpoint (m1--m3)+ v;
pair z2 = midpoint (m1--m2) - v;
pair z3 = midpoint (m2--C) + v;


dot(z0);
dot(z1);
dot(z2);
dot(z3);
draw(A--D, brown,MidArrow);
draw(C--B, brown, MidArrow);
draw(D--z0--z1--z2--z3--C,brown);
dot("$c$",C,W);
dot("$d$",D,SE);
shipout(title);

