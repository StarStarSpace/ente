void gameover () {
  background (0);
  Tgroesse +=1;

  if (Tgroesse > 49) {
    Tgroesse =50;
  }
  if (Tgroesse <51) {
    textSize (Tgroesse);
    fill(100, 100, Tgroesse+100);
    text ("Nochmal", width/3, height/2);
    cursor();
    if (mouseX > width/3 - 270/2 && mouseX < width/3 - 270/2 + 270 && mouseY < height/2 && mouseY > height/2 - 50) {
      cursor(HAND) ;
      if(mousePressed) setup();
    }
    else cursor (ARROW);

    text ("Punkte: " + score, width/3+Tgroesse, height/3);
  }


  rectMode (CENTER);
  pushMatrix();
  fill(255, 0, 0);
  textSize (50);
  translate(Tpos, Tpos);
  rotate(radians(Tpos));
  text("Gameover", 0, 0);
  popMatrix();
  Tpos+=6;
  if (Tpos>2000)  {
    Tpos=2000;
  }
}
