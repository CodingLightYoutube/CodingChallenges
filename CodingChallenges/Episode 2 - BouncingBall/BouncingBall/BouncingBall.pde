PVector pos;
PVector vel;
PVector col;

int radius = 16;

void setup(){
  size(800, 600);
  pos = new PVector(width/2, height/2);
  vel = new PVector(random(10), random(10));
  col = new PVector(random(255), random(255), random(255));
  background(51);
}

void draw(){
  //background(51);
  pos.x += vel.x;
  pos.y += vel.y;
  if(pos.x > width - radius/2 || pos.x < radius/2){
    vel.x = -vel.x;
  }
  if(pos.y > height - radius/2 || pos.y < radius/2){
    vel.y = -vel.y;
  }
  fill(col.x, col.y, col.z);
  ellipse(pos.x, pos.y, radius, radius);
}

void keyPressed(){
  if(key == 'r'){
    col.x = random(255);
    col.y = random(255);
    col.z = random(255);
    vel.x = random(10);
    vel.y = random(10);
  }
}
