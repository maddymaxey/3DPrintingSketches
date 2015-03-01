import controlP5.*;
ControlP5 cp;

int diameter = 300;
int diameterY = 300;
int spacingX;
int spacingY;
int pixelSize = 4;
float noise;
int steps;
int numLayers;
int marginX;
int marginY;
int i;
int layers;
int density = 10000; // num of pixels




void setup() {
  size(1280, 800);
  noSmooth();
  
  
    cp = new ControlP5(this);


            
   /* cp.addSlider("density")//variable the slider manipulates
    .setPosition(50, 10)//location of the slider
      .setSize(20, 100)//size of the slider
        .setRange(1,10)//range of the slider
          .setValue(1)//initial value
            .setNumberOfTickMarks(10);//number of hashes */
            
    cp.addSlider("steps")//variable the slider manipulates
    .setPosition(100, 10)//location of the slider
      .setSize(20, 100)//size of the slider
        .setRange(1,5)//range of the slider
          .setValue(1)//initial value
            .setNumberOfTickMarks(4);//number of hashes
          
            
            
  
}


void draw() {

 marginX = (width/2);
 marginY = (height/2);
 drawEllipse();
  
}


void keyPressed()
{
  background(0);
  fill(255);
  redraw();
  if (key == ' ')
  {     
        int n = 0;
        for (i=0; i<350; i++){
         drawEllipse();
         int countUp = 4/280;
         pixelSize = pixelSize -countUp;
         save("./output/slice_"+int(n+1)+".png");
         n++;
        }
        
    noStroke();  
    ellipse(marginX, marginY, diameter-(i*steps)-steps+1,diameterY-(i*steps)-steps+1); 
    for(int j=0; j<density ; j++){
    fill(0);
    float rand = random(width/2-diameter-(i*steps),width/2+diameterY-(i*steps));
    float randY = random(height/2-diameter-(i*steps), height/2+diameterY-(i*steps));
    rect(rand,randY,pixelSize,pixelSize);
    }
      save("./output/slice_"+int(n+1)+".png"); 
  }

 exit();
   }




void drawEllipse(){
    background(0);
    noStroke();
  ellipse(width/2, marginY, diameter-(i*steps),diameterY-(i*steps)); 
  for(int j=0; j<density ; j++){
    fill(0);
    float rand = random(width/2-diameter,width/2+diameterY-(i*steps));
    float randY = random(height/2-diameterY*2-(i*steps), height/2+diameterY-(i*steps));
    rect(rand,randY,pixelSize,pixelSize);
  }
  fill(255);
  ellipse(width/2, marginY, diameter-((i+3)*steps),diameterY-((i+4)*steps)); 
  fill(0);
  rect(0,0, width, height/2); 
  fill(255);
  ellipse(width/2, marginY/2, diameter-((i+3)*steps),diameterY-((i+1)*steps)); 
  fill(0);
  rect(0,0, width, height/4); 
  fill(255);
  }// draw concentric circules

  /*
  int pixelX =diameter/pixelSize;
  int j;
  for(j=0; j<pixelX ; j+=1){
      float rand = random(marginX, rectW+marginX);
      noStroke();
    if (j%density == 0){
      rect(rand,marginY-pixelSize+1, pixelSize, pixelSize);
      rect(rand,marginY+rectH, pixelSize, pixelSize);
      fill(0);
      rect(rand,marginY*2+rectH-pixelSize/3, pixelSize, pixelSize);
      rect(rand,marginY*2+rectH*2-pixelSize, pixelSize, pixelSize);
      fill(255);
      ellipse(rand,marginY*3+rectH*2, pixelSize*2, pixelSize*2);
      ellipse(rand,marginY*3+rectH*3, pixelSize*2, pixelSize*2);
   
  }
   if (j%density == stagger){
      fill(255); 
      rect(rand,marginY*2+rectH-pixelSize, pixelSize, pixelSize);
      rect(rand,marginY*2+rectH*2-pixelSize/3, pixelSize, pixelSize);
      noStroke();
      fill(0);
      ellipse(rand,marginY*3+rectH*2, pixelSize*2, pixelSize*2);
      ellipse(rand,marginY*3+rectH*3, pixelSize*2, pixelSize*2);
      fill(255);
      rect(rand,marginY-(pixelSize), pixelSize*2, pixelSize*2);
      rect(rand,marginY+rectH, pixelSize*2, pixelSize*2);
      
  }
  
  
  /* if (j%4 == 0){
        rect(marginX+pixelSize*j,marginY*2+rectH-(pixelSize), pixelSize, pixelSize);
         rect(marginX+pixelSize*j,marginY*2+rectH*2, pixelSize, pixelSize);
  }*/
  

