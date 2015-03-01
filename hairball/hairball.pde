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
int pixelSize = 9;
int z;
float densityX, densityY;
int spacing;
float baseThickness = 50;
int padding;
float layerHeight = 0.25;
float hairHeight = 20;




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
  
  cp = new ControlP5(this);


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

void draw(){
  makeGrid();
}


void keyPressed()
{
  background(0);
  redraw();
  if (key == ' ')
  {
   // int numLayers = int(hairHeight/layerHeight);
   int numLayers = 128;// (.25 inches at 50 micron layers)

    for (int z = 0; z < numLayers; z++)
    {

       // background(0);
        //if done with base, make the hair
        if (z <= baseThickness)
      {
        fill(255);
       // stroke(255);
        rect(width/2-baseW/2, height/2-baseH/2, baseW, baseH);
      }
      
        if (z > baseThickness)
      {
        makeGrid();
        if (z % 20 == 0)
        {
             pixelSize = pixelSize - 1;
        }
      }


      


      save("./output/slice_"+int(z+1)+".png");
    }
  }

  exit();
}

void makeGrid()

  {

  background(0);


  padding = int(sqrt(pixelSize*pixelSize));
  fill(0);
  rect(width/2-baseW/2, height/2-baseH/2, baseW, baseH); 
  fill(255);
  for (int i = 0; i < baseW-pixelSize-padding; i += spacing)
  {
    for (int j = 0; j < baseH-pixelSize-padding && i%2 ==0 ; j += spacing)
    {           
      rect(padding+width/2-baseW/2 + i, padding+height/2-baseH/2 + j, pixelSize, pixelSize);
    }
  }
}
  

