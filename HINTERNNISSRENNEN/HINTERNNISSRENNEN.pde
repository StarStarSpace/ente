Ente ente;
float xEnte;
//float yEnte;
boolean enteSicher;
boolean unterEnte;

float yFelsen;
ArrayList<Felsen> felsen;
boolean gameover;

int startMillis;
int score;

float Tgroesse = 0;
float Tpos = 0.0;
boolean Gameover;
float hFelsen;
float hTropfstein;
Tropfstein tropfstein;
float hoehe;
int breite;
float speed;

void setup() {
  fullScreen();//size(600, 400);
  noCursor();


  gameover =false;
  Tpos =0;
  Tgroesse = 0;


  xEnte = width/2.5;
  yFelsen = height/1.5;
  hFelsen = height/2 + 300;
  speed = 0;
  
  ente = new Ente(xEnte, yFelsen - 125);

  felsen = new ArrayList<Felsen>();

  felsen.add(new Felsen(0, yFelsen, 20, yFelsen, speed, xEnte));

  for (int i = 1; i < 5; i++) {
    Felsen lFels = felsen.get(i - 1);
    felsen.add(new Felsen(lFels.xPos + lFels.breite + 100, yFelsen, (int)random(9, 20), yFelsen, speed, xEnte));

    startMillis = (int)millis()/1000;


    hTropfstein = ente.yPos + 50;
    tropfstein = new Tropfstein (width, 0, 2, hTropfstein, speed, xEnte);
  }
}

void draw() {
 // scale(0.2);
  if (gameover) gameover();
  else spiel();
}
