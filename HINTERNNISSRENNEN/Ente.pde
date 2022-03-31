class Ente {
  float xPos, yPos;
  float groesse;
  float speedY;
  float sprunghoehe;
  float gewicht; //Fallgeschwindigkeit
  float xBeinA, yBeinA;
  float xBeinB, yBeinB;
  boolean beinA, beinB;
  boolean ducken;
  boolean springen;
  boolean fallen;

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
  }

  void bewegen() {
    if (springen) springen();
    if (fallen) fallen();
  }

  void zeichnen() {
    pushMatrix();
    translate (xPos, yPos);

    rectMode(CENTER);
    beineReturn();
    stroke(0);
    line (10, 10, xBeinA, yBeinA);
    line (10, 10, xBeinB, yBeinB);
    fill (255, 223, 0);
    rect (0, 0, 50, 50);
    if (ducken) {
      rect (38, -12, 25, 25);
      fill (0);
      rect (43, -10, 5, 5);
      fill (255, 110, 31);
      rect (40, 3, 10, 10);
    } else {
      rect (13, -37, 25, 25);
      fill (255, 110, 31);
      rect (28, -35, 10, 10);
      fill (0);
      rect (15, -40, 5, 5);
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
    gewicht++;
  }
}
