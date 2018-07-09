PImage img;
int carre = 80;
float saturation = 3;
float saturationMax = 7;
float r,g,b;
int x_debut, x_fin, y_debut, y_fin;

void setup(){
   size(640,426);
   img = loadImage("oranges.jpeg");  //on ajoute l`image
   image(img,0,0);  //on positionne l`image
}

void draw(){
   //quand l`utilisateur appuie sur la souris
  if (mousePressed){
    // on calcule les dimensions de carré où on va appliquer le filtre
    x_debut = constrain(mouseX - carre/2, 0, img.width);
    y_debut = constrain(mouseY - carre/2, 0, img.height);
    x_fin = constrain(mouseX + carre/2, 0, img.width);
    y_fin = constrain(mouseY + carre/2, 0, img.height);
    
    loadPixels();  //on charge le tableau des pixels
    for (int x = x_debut; x < x_fin; x++) {
        for (int y = y_debut; y < y_fin; y++ ) {
          int pos = x + y*img.width;  // on represente l`image des pixels (2D dimension) 
                                       //en 1D dimension
          // on extrait chaque composant couleur de chaque pixel
          r = red(img.pixels[pos]);    
          g = green(img.pixels[pos]);
          b = blue(img.pixels[pos]);
          //on applique la transformation de pixels original en pixel de filtre noir-blanc
          pixels[pos] = color((r+g+b)/saturation);
         }
     }
     updatePixels(); 
     //on limite la saturationMax pour que l`image ne devient pas illisible
     if (saturation < saturationMax){
        saturation += 0.01;  //saturation augmente tant qu`on l`utilisateur appuie sur la souris
     }
  }
  
}  
// on reinitialise la saturation chaque fois que l`utilisateur arrête de s`appuyer sur la souris
void mouseReleased(){
  saturation = 3; 
}
