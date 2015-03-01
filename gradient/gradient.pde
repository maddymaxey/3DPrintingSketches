/*
AB December 2014
Use:
Run sketch and adjust sliders to set hair patch dimensions, hair fiber dimensions
and spacing between hairs.  When satisfied, press the spacebar to export the images. 
The display will pause while the images are exported.  On OSX, they will appear in 
~/user/output/.  
*/


import controlP5.*;
ControlP5 cp;

float baseW, baseH, layers;
int z;
float densityX, densityY;
int spacing;
float baseThickness = 0;
int padding;
float layerHeight = 0.25;
float hairHeight = 20;
int pixelSize = 4;
int pixelCount = 0;
int numLayers = 128;



void setup()
{
  size(1280, 800);
  background(0); 
  textSize(32);
  noSmooth();

  densityX = 100;
  densityY = 100;
  baseW = 750;
  baseH = 350;

  spacing = 2*pixelSize;
  spacing = 2*pixelSize;
  noStroke();
  fill(255);
  
  //set up a basic interface
  cp = new ControlP5(this);

 /* cp.addSlider("baseW")//variable the slider manipulates
    .setPosition(250, 25)//location of the slider
      .setSize(20, 200)//size of the slider
        .setRange(0, 1280)//range of the slider
          .setValue(600)//initial value
            .setNumberOfTickMarks(40);//number of hashes */

 /*  cp.addSlider("baseH")
    .setPosition(300, 25)
      .setSize(20, 200)
        .setRange(0, 800)
          .setValue(400)
            .setNumberOfTickMarks(40); */          
       

  cp.addSlider("spacing")
    .setPosition(200, 25)
      .setSize(20, 200)
        .setRange(0, 20)
          .setValue(2*pixelSize)
            .setNumberOfTickMarks(20); 

  cp.addSlider("hairHeight")
    .setPosition(50, 275)
      .setSize(20, 500)
        .setRange(0, 20.0)
          .setValue(hairHeight)
            .setNumberOfTickMarks(40); 


}

void draw()
{

  background(0);
  //text("after selecting your parameters, ", 450, 30); 
  //text("press the spacebar to generate the images", 375, 70);
 makeRect();
}
void keyPressed()
{
  background(0);
  redraw();
  if (key == ' ')
  {
   // int numLayers = int(hairHeight/layerHeight);
  // (.25 inches at 50 micron layers)
    for (int z = 0; z < numLayers; z++)
    {
    makeRect();
    save("./output/slice_"+int(z+1)+".png");
    }
  }

  exit();
}

void makeRect(){
  fill(255);
  rect(width/2-baseW/2, height/2-baseH/2, baseW, baseH); 
  fill(0);
  for (int i = 0; i < baseW-pixelSize-padding; i += spacing)
  { 
    for (int j = 0; j < baseH-pixelSize-padding; j += spacing)
    {   
      pixelCount++;
      
      if(pixelCount<100){   
       pixelSize= 3;  
      }
       if(pixelCount>500){   
       pixelSize= 5;  
      }
      
      if(pixelCount>1000){   
       pixelSize= 7;  
      }
      
      if(pixelCount>1500){    
       pixelCount = 1 ;
      }
       padding = int(sqrt(pixelSize*pixelSize));
      rect(padding+width/2-baseW/2 + i, padding+height/2-baseH/2 + j, pixelSize, pixelSize);
   }
  }
}


