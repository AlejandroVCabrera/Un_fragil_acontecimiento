void loading_bar()  {
    while ( z < 500 )  {
        for (int k = 0; k < 1000; k++)  {
           print(z, k);
        }
      z++;
    }
  fondo = 220;
}

void muestra_img ()  {
    while ( t < 1000 )  {
        for (int q = 0; q < 1000; q++)  {
           print(t, q);
        }
      t++;
    }
  t = 0;
}
     
void espejo()  {
    while ( u < 1000 )  {
        for (int v = 0; v < 1000; v++)  {
           print(u, v);
        }
       u++;
      }
    u = 0;
  px = cursorX[i];
}

class Enter {
  int x;
  int y;
  
  Enter(int posx, int posy){
    x = posx;
    y = posy;
  }
  
  void display(){
    stroke(220);
    strokeWeight(1);
    line(x+17,y-7,x+17,y-17);
    line(x+2,y-7,x+17,y-7);
    triangle(x-3,y-7,x+2,y-10,x+2,y-4); //Nuestra Y está en 354 y X está en 578
  }
}
