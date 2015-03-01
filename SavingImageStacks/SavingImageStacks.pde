PImage bg;
String fileSelected;

void setup(){
  size(1280, 800);
  selectInput("Select a file to process:/Users", "fileSelection");

  
}

void fileSelection(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
  fileSelected = selection.getAbsolutePath();
  bg = loadImage(fileSelected);

  }
}


  void draw(){
    if (bg!= null ){
  println(bg);
  background(bg);
    }
    
    if (key ==' '){
      for(int z= 0; z<128; z++){
       save("./output/slice_"+int(z+1)+".png");
      }
      exit();
    }
}



