import controlP5.*;
ControlP5 cp;

int rectH = 125;
int rectW = 750; // 50 pixels = .10 inch 
int spacingX;
int spacingY;
float pixelSize= 1;
float noise;
float density;
int stagger;
int numLayers;
int marginX;
int marginY;


void setup() {
  size(1200, 800);
  noStroke();
  
    cp = new ControlP5(this);

  cp.addSlider("pixelSize")//variable the slider manipulates
    .setPosition(10, 10)//location of the slider
      .setSize(20, 100)//size of the slider
        .setRange(1, 5)//range of the slider
          .setValue(1)//initial value
            .setNumberOfTickMarks(5);//number of hashes
            
   cp.addSlider("density")//variable the slider manipulates
    .setPosition(50, 10)//location of the slider
      .setSize(20, 100)//size of the slider
        .setRange(10,20)//range of the slider
          .setValue(1)//initial value
            .setNumberOfTickMarks(10);//number of hashes
            
    cp.addSlider("stagger")//variable the slider manipulates
    .setPosition(100, 10)//location of the slider
      .setSize(20, 100)//size of the slider
        .setRange(1,5)//range of the slider
          .setValue(1)//initial value
            .setNumberOfTickMarks(5);//number of hashes
            
            
  
}


void draw() {
 marginX = (width - (rectW))/2;
 marginY = (height - (rectH*3))/4;
  drawRects();
  
  
  
}


void keyPressed()
{
  background(0);
  fill(255);
  redraw();
  if (key == ' ')
  {
    numLayers = 350; //1016 microns = 2 inches 
    float dens = density;
    for (int z = 0; z < numLayers; z++){
        float randStagger = random(1,5);
        float randDensity = random(10,20);
        density= 10; //int(randDensity); // make random
        stagger = int(randStagger);
        drawRects();
        save("./output/slice_"+int(z+1)+".png");
    }

 exit();
   }

}


void drawRects(){
  background(0);
  for(int i=1; i<3; i++){
  rect(marginX, marginY*(i+1)+rectH*i,rectW,rectH); 
  }
  
  float pixelX =rectW/pixelSize;
  int j;
  for(j=0; j<pixelX ; j+=1){
    if (j%density == 0){
      float randX = random(marginX, marginX+rectW);
      noStroke();
      fill(255);
      ellipse(randX,marginY*3+rectH*2, pixelSize*2, pixelSize*2);
      ellipse(randX,marginY*3+rectH*3, pixelSize*2, pixelSize*2);
   
  }
   if (j%density == stagger){
     float randXX = random(marginX, marginX+rectW);
      noStroke();
      fill(0);
      ellipse(randXX,marginY*3+rectH*2, pixelSize*2, pixelSize*2);
      ellipse(randXX,marginY*3+rectH*3, pixelSize*2, pixelSize*2);
      fill(255);
      
  }
  
  
  /* if (j%4 == 0){
        rect(marginX+pixelSize*j,marginY*2+rectH-(pixelSize), pixelSize, pixelSize);
         rect(marginX+pixelSize*j,marginY*2+rectH*2, pixelSize, pixelSize);
  }*/
  
  
  }
  
}
