class Ente {
  float xPos, yPos;
  float groesse;
  float speedY;
  float sprunghoehe;
  float gewicht; //Fallgeschwindigkeit
  float xBeinA, yBeinA;
  float xBeinB, yBeinB;
  
  color fKoerper = color(255, 223, 0);
  color fSchnabel = color(255, 110, 31);
  
  boolean beinA, beinB;
  boolean ducken;
  boolean springen;
  boolean fallen;
  boolean lavaTot;
  boolean tropfsteinTot;

  Ente(float x, float y) {
    xPos = x;
    yPos = y;
    groesse = height/20;
    xBeinA =50;
    yBeinA =height/2;
    xBeinB =50;
    yBeinB =height/2;
    sprunghoehe = 22;
    gewicht = 1;
    speedY = -sprunghoehe;
    beinA = false;
    beinB = true;
    ducken = false;
    springen = false;
    fallen = false;
    lavaTot = false;
    tropfsteinTot = false;
  }

  void bewegen() {
    if (springen && !fallen) springen();
    if (fallen) fallen();
  }

  void zeichnen() {
    pushMatrix();
    translate (xPos, yPos);

    rectMode(CENTER);
    beineReturn();
    stroke(0);
    line (10, 10, xBeinA, yBeinA);//Beine
    line (10, 10, xBeinB, yBeinB);
    if(lavaTot) fKoerper = color(200,0,0);
    fill (fKoerper);
    rect (0, 0, 50, 50); //Koerper
    if (ducken) {
      rect (37, -12, 25, 25); //Kopf ducken
      if(lavaTot) {
        stroke(0);
        line(36, -14, 44, -6); //Auge ducken Tod
        line(44, -14, 36, -6); //Auge ducken Tod
      }
      else {
        fill (0);
        rect (43, -10, 5, 5); //Auge ducken
      }
      fill (fSchnabel);
      rect (40, 3, 10, 10); // Schnabel ducken
    }
    else {
      rect (13, -37, 25, 25); //Kopf
      fill (fSchnabel);
      rect (28, -35, 10, 10); //Schnabel
      
      if(lavaTot) {
        stroke(0);
        line(11, -44, 18, -37); //Auge Tot 
        line(18, -44, 11, -37);
      }
      else {
        fill (0);
        rect (15, -40, 5, 5); //Auge
      }
    }
    popMatrix();
  }

  void beineReturn() {
    if (!beinA) {
      xBeinA -= 5;
      yBeinA =50;
    }
    if (!beinB) {
      xBeinB -= 5;
      yBeinB =50;
    }
    if (-50 >xBeinA) {
      beinA =true;
      xBeinA +=5;
    }
    if (-50 >xBeinB) {
      beinB =true;
    }
    if (beinA) {
      xBeinA+=5;
      yBeinA =45;
    }
    if (beinB) {
      xBeinB +=5;
      yBeinB =45;
    }
    if (xBeinA >25) beinA =false;
    if (xBeinB >25) beinB =false;
  }

  void springen () {
    yPos += speedY;
    speedY++;

    if (speedY == sprunghoehe + 1) {
      speedY = -sprunghoehe;
      springen = false;
    }
  }

  void fallen() {
    yPos += gewicht;
    gewicht+=0.4;
    
    if (yPos > yLava) gewicht =0.8;
  }
}
