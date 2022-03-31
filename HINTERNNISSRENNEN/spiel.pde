void spiel() {
  steuerung();
  spielfeld();

  if (!enteSicher) ente.fallen = true;


  ente.bewegen();
  //ente.zeichnen();

  if (ente.yPos > height) gameover = true;
}



void steuerung() {
  ente.ducken = false;
  enteSicher = false;
  if (keyPressed) {
    if (keyCode == UP || key == ' ') ente.springen = true;
    if (keyCode == DOWN) ente.ducken = true;
  }
}

void spielfeld() {
  background(90, 40, 90);
  ente.zeichnen();
  lava();
  felsen();
  tropfstein();
  
  /*for(int i = 255; i >= 0; i--) {
   strokeWeight(3);
   stroke(0, i);
   line(0, (3*255) - i, width, (3*255) - i);
   strokeWeight(1);
   }*/
}

void score () {        
  if (!gameover) score = (int)millis()/1000 - startMillis;
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text(score, width/2, height/8);
}

void lava () {
  rectMode(CORNER);
  noStroke();
  fill(255, 100, 50);
  rect(0, height - height/6, width, height - height/6);
}

void felsen() {  
  for (int i = 0; i < felsen.size(); i++) {
    Felsen fels = felsen.get(i);

    //fels.speed+=0.02;
    fels.zeichnen();
    fels.bewegen();
    fels.pruefen(ente.xPos);
    
    if (fels.fertig) {
      Felsen lFels = felsen.get(felsen.size() - 1);
      felsen.add(new Felsen(lFels.xPos + lFels.breite + 100, yFelsen, (int)random(3, 15), yFelsen, speed, xEnte));
      //felsen.remove(0);

      //felsen.get(0).zeichnen();
      //felsen.get(0).bewegen();
    }
    
    
    if (fels.unterEnte || ente.springen) enteSicher = true;
    if (!fels.unterEnte && ente.springen) enteSicher = true;    
    //if(!ente.springen && !fels.unterEnte) enteSicher = false;
    //if (!fels.unterEnte && !ente.springen) enteSicher = false;
    //if (!fels.unterEnte && !ente.springen) enteSicher = false;//&& ente.springen && ente.yPos == ente.sprunghoehe++) enteSicher = false;
    //if (gameover) fels.speed = 0;
  }
  
  if(felsen.get(0).fertig) felsen.remove(felsen.get(0));
}

void tropfstein() {
  tropfstein.zeichnen();
  tropfstein.bewegen();
 
  if (tropfstein.fertig) tropfstein.xPos = width;
  tropfstein.pruefen(ente.xPos);
}  
