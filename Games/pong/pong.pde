PVector bvel;
PVector bpos;
PVector p1pos;
PVector p2pos;

int padw = 15;
int padh = 150;

boolean up = false;
boolean down = false;

int[] score = new int[2];

void setup() {
  size(800, 400);
  reset();
  p1pos = new PVector(0, height/2-padh/2);
  p2pos = new PVector(width-padw, height/2-padh/2);
}

void draw() {
  background(51);
  bpos.x += bvel.x;
  bpos.y += bvel.y;
  
  //Player one scores
  if (bpos.x > width){
    score[0]++;
    reset();
  }
  
  //Player two scores
  if(bpos.x < 0) {
    score[1]++;
    reset();
  }
  
  if (bpos.x > width-padw && bpos.x < width-padw+5) {
    if(bpos.y > p2pos.y && bpos.y < p2pos.y+padh){ 
      bvel.x *= -1;
    }
  }
  
  if(bpos.x < padw && bpos.x > padw-5){
    if(bpos.y > p1pos.y && bpos.y < p1pos.y+padh){ 
      bvel.x *= -1;
    }
  }
  if (bpos.y+8 > height || bpos.y-8 < 0) {
    bvel.y *= -1;
  }
  ellipse(bpos.x, bpos.y, 16, 16);
  p2pos.y = bpos.y-padh/2;

  if (up) {
    p1pos.y-=5;
  } else if (down) {
    p1pos.y+=5;
  }

  rect(p1pos.x, p1pos.y, padw, padh);
  rect(p2pos.x, p2pos.y, padw, padh);
  
  text(score[0], 0, height);
  text(score[1], width-15, height);
}

void keyPressed() {
  if (key == 'w') {
    up = true;
    down = false;
  } else if (key == 's') {
    down = true;
    up = false;
  }
}

void keyReleased() {
  if (key == 'w') {
    up = false;
  } else if (key == 's') {
    down = false;
  }
}

void reset(){
  bvel = PVector.random2D();
  bvel.mult(5);
  bpos = new PVector(width/2, height/2);
}
