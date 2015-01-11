import graph;
//import settings;
size(200,180, IgnoreAspect);
defaultpen(fontsize(10pt));
//string title = "paths";
//write("Drawing " + title + "." + outformat);
//size(320,200,IgnoreAspect);
//size(300,250,IgnoreAspect);
//texpreamble("\usepackage{amsmath}"); // nice tilde...
//usepackage("amsmath"); // nice tilde...

real x0 = 0.5;
real y1  = 1;
real delta = 0.2;
real y2 = y1 + delta;
real k = 0.5;
real x1 = 1.5;
real x2 = 3.5;
pair z1 =  ( x1     , y1   ); 
pair z2 =  ( x2     , y2   ); 
pair c1 =  ( x1+2*k   , y1+2*k ); 
pair c2 =  ( x2-k , ypart(c1) ); 

pair c3 =  ( x1+k   , y1+k ); 
pair c4 =  ( x2-k , ypart(c3) + 0.5 *delta ); 

pair c5 = (x1 + k, y1 - 0.5 k);
pair c6 = (x1 +1.5*k, y1 - 0.5 k);

pair z3 = (x1+ 2 * k, 0);

pair c7 = ( xpart(z3) + 0.5*k, - ypart(c6)) ;
pair c8 = ( x1 +3*k , 0.5 * ypart(c6));
pair c9 = (xpart(c6)+1, ypart(c6));


// Draw classical path (assume straight-line path)
draw ( "$q_{\textrm{cl}}(t)$", z1 -- z2 ,solid);

// Path 1 
draw ( "$q(t)$", z1 .. controls c1 and c2 .. z2, brown+longdashdotted );
draw ( "$\tilde{q}(t)$",z1 .. controls c3 and c4 .. z2 , 0.25 * red+longdashed);
draw ( "$\tilde{\tilde{q}}(t)$", z1 .. controls c5 and c9 .. z2 ,0.5 * red+ dashed);

//draw ( z1 .. controls c5 and c6 .. z3 , 0.75 * red+dashdotted);
//draw ( z3 .. controls c7 and c8 .. z2 , 0.75 *red+dashdotted);

draw ( "$\tilde{\tilde{\tilde{q}}}(t)$", \
    z1 .. controls c5 and c6 .. z3 .. controls c7 and c8 .. z2 \
    , 0.75 * red+dashdotted);

//dot("$\left( x_{0}, t_{0} \right)$", z1, SW);
//dot("$\left( x_{1}, t_{1} \right)$", z2);
dot("$\left( \tstart, \qstart \right)$", z1, SW);
dot("$\left( \tend, \qend \right)$", z2);

//shipout(title);
