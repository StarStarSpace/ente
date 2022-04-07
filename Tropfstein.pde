class Tropfstein {
  float xPos;
  float yPos;
  int breite;
  float hoehe;
  float xEnte;
  float speed;
  boolean fertig;
  boolean ueberEnte;

  Tropfstein (float x, float y, int b, float h, float s, float xE) {
    xPos = x;
    yPos = y - height/9;
    breite = b*(width/30);
    hoehe = h;
    speed = 4;
    ueberEnte = true;
    xEnte = xE;
  }

  void bewegen() {
    xPos-=speed;
    

    if (fertig) fertig = false;
    if (xPos < -breite) {
      fertig = true;
    }
  }
  
  void pruefen(float xE) {
    float xEnte = xE;
    unterEnte = false;
    if (xEnte > xPos && xEnte < xPos + breite) ueberEnte = true;
  }
  
  void zeichnen () {
    fill (0);
    triangle(xPos, yPos, xPos + breite, yPos, xPos + breite/2, yPos + hoehe);
  }
}
