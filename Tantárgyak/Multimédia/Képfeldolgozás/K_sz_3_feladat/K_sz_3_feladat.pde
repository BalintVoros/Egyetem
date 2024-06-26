PImage img; // Kép objektum
float angleX = 0; // X tengely körüli forgás szöge
float angleY = 0; // Y tengely körüli forgás szöge

void setup() {
  size(800, 800, P3D); // 3D ablak létrehozása
  img = loadImage("C:\\peakpx.jpg"); // Kép betöltése
}

void draw() {
  background(255);
  
  translate(width / 2, height / 2, 0); // Középre helyezés
  
  // Forgás az egér pozíciója alapján
  float rotateSpeed = 0.01;
  angleX += (pmouseY - mouseY) * rotateSpeed;
  angleY += (pmouseX - mouseX) * rotateSpeed;

  // 3D forgatás
  rotateX(angleX);
  rotateY(angleY);

  // Kocka rajzolása képekkel az oldalain
  float side = 200;
  float halfSide = side / 2;

  beginShape();
  texture(img);
  vertex(-halfSide, -halfSide, -halfSide, 0, 0);
  vertex(halfSide, -halfSide, -halfSide, img.width, 0);
  vertex(halfSide, halfSide, -halfSide, img.width, img.height);
  vertex(-halfSide, halfSide, -halfSide, 0, img.height);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(halfSide, -halfSide, -halfSide, 0, 0);
  vertex(halfSide, -halfSide, halfSide, img.width, 0);
  vertex(halfSide, halfSide, halfSide, img.width, img.height);
  vertex(halfSide, halfSide, -halfSide, 0, img.height);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(halfSide, -halfSide, halfSide, 0, 0);
  vertex(-halfSide, -halfSide, halfSide, img.width, 0);
  vertex(-halfSide, halfSide, halfSide, img.width, img.height);
  vertex(halfSide, halfSide, halfSide, 0, img.height);
  endShape(CLOSE);

  beginShape();
  texture(img);
  vertex(-halfSide, -halfSide, halfSide, 0, 0);
  vertex(-halfSide, -halfSide, -halfSide, img.width, 0);
  vertex(-halfSide, halfSide, -halfSide, img.width, img.height);
  vertex(-halfSide, halfSide, halfSide, 0, img.height);
  endShape(CLOSE);
}
