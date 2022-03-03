PFont f;

String[] direcciones;

int infras_cont = 10; // Contador de infraleves(ventanas al final del programa)
PImage[] gif = new PImage[24], infras = new PImage[infras_cont], motm = new PImage[4], motg = new PImage[4]; //motc = new PImage[9]

int[] cursorX = {142, 578, 1082, 1142, 1082, 878, 142, 626, 734, 782, 782, 0};
int[] cursorY = {134, 354, 374, 394, 414, 434, 484, 514, 534, 574, 774, 0};

int a, b, c, d, i, z, t, u;
int fondo, cambio, wnd, win1, cont, imagen, enterA, trans;

int px = 142, py = 130, enter = -1, op = 255, indice = 1, btn = 170;

float xwin = 100, ywin = 10;

VentanaInicio PrimerVentana;
Ventana[] vent;
//int count = 10;
Enter Enter;

void setup() {
  fullScreen();
  //size(1440, 900);
  background(20);

  f = createFont("Recursos/SourceCodePro-Regular.ttf", 20);
  textFont(f);
  
  frameRate(30);

  try {
    direcciones = loadStrings("https://raw.githubusercontent.com/AlejandroVCabrera/Infraleve-Strings/main/Documento%20sin%20t%C3%ADtulo.txt");
    println("There are " + direcciones.length + " lines");
    for (int i = 0; i < direcciones.length; i++) {
      println(direcciones[i]);
    }
    IntList imagenes = IntList.fromRange(0,direcciones.length);
    imagenes.shuffle(this);
    imagenes.resize(10);
    println(imagenes);
    for (int i = 0; i < infras_cont; i++) {
      infras[i] = loadImage(direcciones[imagenes.get(i)]);
    }
  } catch (Exception e) {
    println("Error al obtener datos");
    exit();
  }
  for ( int i = 0; i < motm.length; i++) {
    motm[i] = loadImage("Recursos/MotivosM/MotivoM_" + i + ".jpg");
  }
  for ( int i = 0; i < motg.length; i++) {
    motg[i] = loadImage("Recursos/MotivosG/MotivoG_" + i + ".jpg");
  }
  indice = int(random(motg.length-1));    
  for ( int i = 0; i < gif.length; i++) {
    gif[i] = loadImage("Recursos/gif/M_" + i + ".jpg");
  } 
  PrimerVentana = new VentanaInicio(600, 50);
  vent = new Ventana[infras_cont];  
  for ( int i = 0; i < infras_cont; i++) {
    vent[i] = new Ventana(random(50, width-500), random(50, height-500),i);
  }
}


void draw() {
  background(fondo);

  //Imágenes de fondo
  if ((t > 1) && (t < 1000)) {  
    if (d == 6) {
      image(motg[indice], 0, 0, width, height);
    } 
    if (d > 6) {
      image(motg[indice+1], 0, 0, width, height);
    }
  }   

  //Texto de inicio
  fill(220);
  text(l1, 10, 20);
  text(l2, 10, 40);
  text(l3, 10, 60);
  text(l4, 10, 80);
  text(l5, 10, 100);
  text(l6, 10, 130);

  //Loading bar de salida
  if (fondo == 1) {
    thread( "loading_bar" );
    fill(220);
    noStroke();
    rect(30, 150, z, 20);
    rect(20, 150, 2, 20);
    rect(530, 150, 2, 20);
  } 

  //Gif de salida    
  if (z > 500) {
    enter = 1;
    px = 10;
    py = 10;
    if (cont < gif.length) {
      image(gif[cont], 0, 0, width, height);
      cont = cont + 1;
    }
    if (cont == 23) {
      exit();
    }
  }

  //Gif final
  if (enter == 11) { 
    if (cont < gif.length) {
      image(gif[cont], 0, 0, width, height);
      cont = cont + 1;
    }
    if (cont == 23) {
      exit();
    }
  }

  //Textos de desarrollo
  if (enter > 0) {
    text(l7, 10, 160);
    text(l8, 10, 180);
    text(l9, 10, 200);
    text(l10, 10, 220);
    text(l11, 10, 240);
    fill (220, 100);  
    text(l11Kaath, 505, 243);  
    fill(220);
    text(l12, 10, 260);
    text(l13, 10, 280);
    text(l14, 10, 300);
    text(l15, 10, 320);
    text(l16, 10, 350);
    Enter = new Enter(cursorX[1],cursorY[1]);
    Enter.display();
  }  //enter = 1;
  if (enter > 1) {
    text(l17, 10, 370);
    Enter = new Enter(cursorX[2],cursorY[2]);
    Enter.display();
  }  //enter = 2 
  if (enter > 2) {
    text(l18, 10, 390);
    Enter = new Enter(cursorX[3],cursorY[3]);
    Enter.display();
  }  //enter = 3
  if (enter > 3) {
    text(l19, 10, 410);
    Enter = new Enter(cursorX[4],cursorY[4]);
    Enter.display();
  }  //enter = 4
  if (enter > 4) {
    text(l20, 10, 430);
  }  //enter = 5,  ENTER o KEY(cambio = 2)
  if (enter == 5) {
    cambio = 2;
  }
  if (enter > 5) {
    text(l21, 10, 450);
    text(l22, 10, 480);
  }  //enter = 6
  if (d == 6) {
    cambio = 0;
  }
  if (enterA > 0) {
    text(l23, 10, 510);
    text(l24, 10, 540);
    translate(0, 60);
    trans = 60;
  }  //enterA = 1
  if (enterA > 1) {
    text(l26, 10, 510);
    text(l27, 10, 530);
    Enter = new Enter(937,cursorY[8]);
    Enter.display();
    translate(0, 20);
    trans = 80;
    cambio = 1;
  }
  if (enter > 6) {
    fill(220, op);
    text(l25, 10, 510);
  }  //enter = 7,  ENTER o KEY(cambio = 3)
  if (enter == 7) {
    cambio = 3;
  }
  if (enter > 7) {
    fill (220);
    text(l28, 10, 530);
    Enter = new Enter(cursorX[8],cursorY[8]);
    Enter.display();
  }  //enter = 8
  if (enter > 8) {
    text(l29, 10, 550);
    text(l30, 10, 570);
    Enter = new Enter(cursorX[9],cursorY[9]);
    Enter.display();
  }  //enter = 9
  if (enter > 9) {
    text(l31, 10, 600);
    text(l32, 10, 620);
    text(l33, 10, 640);
    text(l34, 10, 660);
    text(l35, 10, 680);
    text(l36, 10, 700);
    text(l37, 10, 720);
    text(l38, 10, 740);
    text(l39, 10, 770);
    Enter = new Enter(cursorX[10],cursorY[10]);
    Enter.display();
  }  //enter = 10;

  //Cursor    
  if (a == 12) {
    b = -1;
  }
  if (b == -1) {
    c = 0;
  }
  if (a == 0) {
    b = 1;
  }
  if (b == 1) {
    c = 255;
  }
  a = a + b;
  noStroke();
  fill(220, c);
  rect(px, py, 15, 8); 

  //Ventanas spam
  if (enter == 10) {
    for (int l = 0; l < infras_cont; l++) {
      vent[l].display();
    }
  }

  //Ventana de inicio   
  if (enter == -1) {
    PrimerVentana.display();
  }

  //Recuadro de espejo   
  if (u > 0) {
    stroke(255);
    strokeWeight(10);
    strokeCap(SQUARE);
    fill (0);
    rect (0, -60, width, height);
  }
  
  println("enter:",enter,"cambio:",cambio);
}


void keyPressed() {

  if (key == CODED) {
    if ((keyCode == LEFT) && (cambio == 0)) {
      px = 142;
    }
    if ((keyCode == RIGHT) && (cambio == 0)) {
      px = 274;
    }
  }
  if ((((key == ENTER) && (enter == d))) && ((px == cursorX[i]) || (px == 937))) {  //CUALQUIER ENTER
    if (enter < 11) {
      enter++;  
      d++;  
      px = cursorX[i+1];  
      py = cursorY[i+1];  
      i++;  
      cambio = 1;
      key = TAB;
    }
  }
  if ((((key != ENTER) && (key != CODED))) && (cambio == 2)) {  //CUALQUIER TECLA 1
    enter++;  
    d++;  
    px = cursorX[i+1];  
    py = cursorY[i+1];  
    i++;  
    cambio = 1;
    thread("muestra_img");
    key = TAB;
  }
  if ((((key != ENTER) && (key != CODED))) && (cambio == 3)) {  //CUALQUIER TECLA 2
    enter++;
    d++;
    px = cursorX[i+1];
    py = cursorY[i+1];
    i++;
    cambio = 1;
    thread("muestra_img");
    key = TAB;
  }
  if ((((key == ENTER) && (enter == 0))) && (px == 274)) {  //VOLVER
    fondo = 1;
    key = TAB;
    cambio = 1;
  }
  if ((((key == ENTER) && (enter == 6))) && (px == 274)) {  //NO 1
    if (enterA == 0) {
      thread("espejo");
      enterA++;
      px = cursorX[i]+1;
      key = TAB;
      cambio = 0;
    }
  }
  if ((((key == ENTER) && (enter == 6))) && (px == 274)) {  //NO 2
    if (enterA == 1) {
      enterA++;
      px = 937;
      py = 514;
      key = TAB;
      enter = 7;
      d = 7;
      i = 7;
      op = 0;
    }
  }
}
