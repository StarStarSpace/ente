class Felsen {
  float yPos;
  float xPos;
  int breite;
  float hoehe;
  //float xEnte;
  float speed;
  boolean fertig;
  boolean unterEnte;

  Felsen (float x, float y, int b, float h, float s, float xE) {
    xPos = x;
    yPos = y - height/9;
    breite = b*(width/30);
    hoehe = h;
    //xEnte = xE;
    speed = 4;
    unterEnte = true;
  }

  void bewegen() {
    xPos-=speed;
    //if (fertig) fertig = false;

    if (xPos+breite < 0) {
      xPos = width + 40;
      fertig = true;
    }

  }
  
  void pruefen(float xE) {
    float xEnte = xE;
    unterEnte = false;
    if (xEnte > xPos && xEnte < xPos + breite) unterEnte = true;
    
  }

  void zeichnen() {
    fill (0);
    triangle(xPos, yPos, xPos + breite, yPos, xPos + breite/2, yPos + hoehe);
  }
}
