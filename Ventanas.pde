class Ventana {
  float x;
  float y;
  int btn = 170;
  boolean ver = true;
  
  int a = int(random(0,infras_cont));
  
  Ventana(float posx, float posy, int img) {
    x = posx;
    y = posy;
    a = img;
  }
  
  void display(){  
    if(ver == true){
      
      noStroke();
      fill(240);  
      triangle(x-4, y-4, x+468, y-4, x-4, y+362); //Contorno blanco
      fill(80);  
      triangle(x+468, y-4, x-4, y+362, x+468, y+362); //Contorno negro
      fill(170);
      rect(x,y,464,358);  //Recuadro
      fill(100);  
      rect(x+4,y+48,456,306);  //Campo Imagen   
      fill (30,30,180);  
      rect(x+5,y+5,454,38);  //Barra título
      fill (240); 
      text(l40, x+15,y+30); //Título
      fill(10);  
      triangle(x+412, y+41, x+452, y+41, x+452, y+11); //Contorno botón negro
      fill(80);  triangle(x+408, y+39, x+450, y+39, x+450, y+9); //Contorno botón negro
      fill(240);  triangle(x+410, y+9, x+450, y+9, x+410, y+39); //Contorno botón blanco
      fill(btn);  
      rect(x+413,y+12,34,24);  //Botón
      stroke(10);  
      strokeWeight(4);  
      strokeCap(RECT);
      line(x+420,y+16,x+438,y+32);
      line(x+438,y+16,x+420,y+32);
      image(infras[a],x+8,y+52);
      
      react();
      cerrar();  
    }
  }
  
  void react() {
    if (((mouseX > (x+412)) && (mouseX < x+448))
      && ((mouseY > y+12+trans) && (mouseY < y+36+trans))){
      btn = 120;
    } else {
    btn = 170;
    }
  }
  
  void cerrar(){
    if (mousePressed) {
      if (((mouseX > (x+412)) && (mouseX < x+448))
          && ((mouseY > y+12+trans) && (mouseY < y+36+trans))) {
          ver = false;
      }
    }
  }
}



class VentanaInicio {
  float x;
  float y;
  int btn = 170;
  boolean ver = true;
  int a = int(random(0,3));
  
  VentanaInicio(float posx, float posy) {
    x = posx;
    y = posy;
  }
  
  void display(){
    if (ver == true){
      noStroke();
    fill(240);  triangle(xwin-4, ywin-4, xwin+618, //Contorno blanco
                         ywin-4, xwin-4, ywin+462);
    fill(80);  triangle(xwin+618, ywin-4, xwin-4,  //Contorno negro
                         ywin+462, xwin+618, ywin+462);
    fill(170);  rect(xwin,ywin,614,458);  //Recuadro
    fill(100);  rect(xwin+4,ywin+48,606,406);  //Campo Imagen
    if (wnd == 0) {  fill(30,30,180);  rect(xwin+5,ywin+5,604,38);  }
    fill (240); text(l41, xwin+15,ywin+30);
    fill(0);  rect(xwin+7,ywin+51,600,400);  //Imagen
    fill(10);  triangle(xwin+562, ywin+41, xwin+602,  //Contorno botón negro
                         ywin+41, xwin+602, ywin+11);
    fill(80);  triangle(xwin+558, ywin+39, xwin+600,  //Contorno botón negro
                         ywin+39, xwin+600, ywin+9);
    fill(240);  triangle(xwin+560, ywin+9, xwin+600, //Contorno botón blanco
                         ywin+9, xwin+560, ywin+39);
    fill(btn);  rect(xwin+563,ywin+12,34,24);  //Botón
    stroke(10);  strokeWeight(4);  strokeCap(RECT);
    line(xwin+570,ywin+16,xwin+588,ywin+32);
    line(xwin+588,ywin+16,xwin+570,ywin+32);
    image(motm[a],xwin+7,ywin+51);
    
    react();
    cerrar();

    }
  }
    
     void react(){
    if (((mouseX > 663) && (mouseX < 697)) && ((mouseY > 22) && (mouseY < 46))) {
    btn = 120;
    } else {  btn = 170;  }
  }
  
  void cerrar(){
    if (mousePressed) {
    if (((mouseX > (xwin+563)) && (mouseX < xwin+597))
      && ((mouseY > ywin+12) && (mouseY < ywin+36))) {  enter++;  ver = false;  }  }
  }
}
