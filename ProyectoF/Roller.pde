class Roller extends Support{
  Roller(Node pos){  
  super(pos);
  }
  @Override
  void display() {
    pushStyle();
    imageMode(CENTER);
    image(loadImage("roller.png"),pos.position.x, pos.position.y+16);
    pos.display();
    popStyle();    
  }
}