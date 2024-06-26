PImage img;

void setup() {
  size(1000, 600, P3D);
  img = loadImage("hatterarcProcessing.jpg"); //Cseréld le a saját képed útvonalára
  noStroke();
}

void draw() {
  background(255);
  lights();
  translate(width/2, height/2);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);
  
  beginShape(QUADS);
  texture(img);

  // Első oldal
  vertex(-50, -50, 50, 0, 0);
  vertex(50, -50, 50, img.width, 0);
  vertex(50, 50, 50, img.width, img.height);
  vertex(-50, 50, 50, 0, img.height);

  // Hátsó oldal
  vertex(50, -50, -50, 0, 0);
  vertex(-50, -50, -50, img.width, 0);
  vertex(-50, 50, -50, img.width, img.height);
  vertex(50, 50, -50, 0, img.height);
    // Felső oldal
  vertex(-50, -50, -50, 0, 0);
  vertex(50, -50, -50, img.width, 0);
  vertex(50, -50, 50, img.width, img.height);
  vertex(-50, -50, 50, 0, img.height);

    // Alsó oldal
  vertex(-50, 50, 50, 0, 0);
  vertex(50, 50, 50, img.width, 0);
  vertex(50, 50, -50, img.width, img.height);
  vertex(-50, 50, -50, 0, img.height);

  // Jobb oldal
  vertex(50, -50, -50, 0, 0);
  vertex(50, -50, 50, img.width, 0);
  vertex(50, 50, 50, img.width, img.height);
  vertex(50, 50, -50, 0, img.height);

  // Bal oldal
  vertex(-50, -50, 50, 0, 0);
  vertex(-50, -50, -50, img.width, 0);
  vertex(-50, 50, -50, img.width, img.height);
  vertex(-50, 50, 50, 0, img.height);
  
  endShape();
}
