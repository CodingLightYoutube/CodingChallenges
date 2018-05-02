float x;
float y;

void setup() {
  size(800, 600);
  x = width/2;
  y = height/2;
  background(51);
}

void draw() {
  for (int i = 0; i < 60; i++) {
    if (random(0, 2) > 1) {
      if(x < width){
        x+=2;
      }
    } else {
      if(x > 0){
        x-=2;
      }
    }
    if (random(0, 2) > 1) {
      if(y < height){
        y+=2;
      }
    } else {
      if(y > 0){
        y-=2;
      }
    }
    fill(random(255), random(255), random(255));
    ellipse(x, y, 5, 5);
  }
}
