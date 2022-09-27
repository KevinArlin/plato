import solids;
size(200);
int n=5;
triple[] vertices; path3[] edges; string[] labs;
pen[] ePens=array(15,black+1.5bp); arrowbar3[] eArrows;

for(int i = 0; i < n;++i){
  triple v = XYplane(dir(360/n*i));
  vertices.push(v); vertices.push(v+Z);
  if(i == 0){
      labs.push("$e$"); labs.push("$T$");
    }
    if(i == 1){
      labs.push("$R$"); labs.push("$RT$");
    }
    if(i > 1){
      string s = "$R^"+string(i);
      labs.push(s+"$"); labs.push(s+"T$");
    }

  path3 edge1 = rotate(360/n*.15,Z)*v--rotate(360/n*.85,Z)*v;
  edges.push(edge1); edges.push(shift(Z)*edge1);
  edges.push(v+.15*Z--v+.85*Z);
  eArrows[3*i]=EndArrow3(size=3mm); eArrows[3*i+1]=BeginArrow3(size=3mm); eArrows[3*i+2]=Arrows3(size=3mm);
}

solid cayley = solid(vertices,edges,new path3[],
		     labels=labs,
		     ePens=ePens,
		     eArrows=eArrows,
		     lPen=black,
		     dotted=false);
//currentlight=nolight;
draw(cayley);