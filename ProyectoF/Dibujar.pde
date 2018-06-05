void dibujar() {
  background(255);
  pushStyle();
  strokeWeight(5);
  rectMode(CENTER);
  rect(width*1/2, height*5/11, width*8/11, height*8/11);  
  popStyle();  
  newBar.display();
  erase.display();
  setLength.display();
  setAngle.display();  
  move.display();
  force.display();
  moment.display();
  fixed.display();
  roller.display();
  collar.display();
  pinned.display();
  corde.display();

  for (int i =0; i<fuerzas.size(); i++) {     
    fuerzas.get(i).display();
  } 
  for (int i=0; i<barras.size(); i++) {
    barras.get(i).display();
  }
  for (int i=0; i<apoy.size(); i++) {
    apoy.get(i).display();
  }
  for (int i= 0; i<momentos.size(); i++) {
    momentos.get(i).display();
  }
  switch (mode) {
  case 0:
    break;
    //colocar barras
  case 1:  
    cursor(ARROW);
    if (!P&&!Q&&mouseY<height*9/11&&mousePressed&&mouseX>width*3/22+10&&mouseY>height*1/11&&mouseX<width*21/22+10) {
      if (barras.size()>0) {
        for (int i=0; i<barras.size(); i++) {
          if (barras.get(i).origin().click()) {
            start=barras.get(i).origin();
            x=start.x();
            y=start.y();
            P=true;
          } else if (barras.get(i).end().click()) {
            start=barras.get(i).end();
            x=start.x();
            y=start.y();
            P=true;
          }
        }
        for (int i=0; i<apoy.size(); i++) {
          if (apoy.get(i).pos().click()) {
            start=apoy.get(i).pos();
            x=start.x();
            y=start.y();
            P=true;
          }
        }
        if (!P) {
          x=mouseX;
          y=mouseY;
          start=new Node(x, y);
          P=true;
        }
      } else { 
        for (int i=0; i<apoy.size(); i++) {
          if (apoy.get(i).pos().click()) {
            start=apoy.get(i).pos();
            x=start.x();
            y=start.y();
            P=true;
          }
        }
        if (!P) {
          x=mouseX;
          y=mouseY;
          start=new Node(x, y);
          P=true;
        }
      }
    }
    if (P) {
      pushStyle();
      stroke(0);
      strokeWeight(1);
      ellipse(x, y, 10, 10);
      popStyle();
    }
    if (Q&&mouseY<height*9/11&&mousePressed&&mouseX>width*3/22+10&&mouseY>height*1/11&&mouseX<width*19/22+10) {
      if (barras.size()>0) {
        for (int i=0; i<barras.size(); i++) {
          if (barras.get(i).origin().click()) {
            fin=barras.get(i).origin();
            P=false;
            mode=0;
            Q=false;
          } else if (barras.get(i).end().click()) {
            fin=barras.get(i).end();
            P=false;
            Q=false;
            mode=0;
          }
        }
        for (int i=0; i<apoy.size(); i++) {
          if (apoy.get(i).pos().click()) {            
            println("hola");
            fin=apoy.get(i).pos();
            P=false;
            Q=false;
            mode=0;
          }
        }
        if (Q) {
          fin=new Node(mouseX, mouseY);
          P=false;
          Q=false;
          mode=0;
        }
      } else {
        for (int i=0; i<apoy.size(); i++) {
          if (apoy.get(i).pos().click()) {
            fin=apoy.get(i).pos();
            P=false;
            Q=false;
            mode=0;
          }
        }
        if (Q) {
          fin=new Node(mouseX, mouseY);
          P=false;
          Q=false;
          mode=0;
        }
      }
      barras.add(new Bar(fin, start));
    }
    break;
  case 2:
    rectMode(CORNER);
    rect(width*11/88, height*1/44, width/35, height/40);         
    if (keyPressed&&key>47&&key<58) {
      if (key==48) {
        angulo[k]='0';
      } else if (key==49) {
        angulo[k]='1';
      } else if (key==50) {
        angulo[k]='2';
      } else if (key==51) {
        angulo[k]='3';
      } else if (key==52) {
        angulo[k]='4';
      } else if (key==53) {
        angulo[k]='5';
      } else if (key==54) {
        angulo[k]='6';
      } else if (key==55) {
        angulo[k]='7';
      } else if (key==56) {
        angulo[k]='8';
      } else if (key==57) {
        angulo[k]='9';
      }
    } else if (key==32&&k==0) {
      k++;
    } else if (key==9&&k==1) {
      k++;
    }           
    pushStyle();
    textSize(width*1/60);
    fill(0, 102, 153);
    text("Escribe el número de centenas, luego espacio decenas y luego tab unidades del ángulo.", width/8, 10*height/11  );
    if (k<1) {
      text(angulo[0], width*11/88, height*1/22);
    } else if (k<2) {
      text(angulo[0], width*11/88, height*1/22);
      text(angulo[1], width*11/88+20, height*1/22);
    } else if (k<3) {
      text(angulo[0], width*1/8, height*1/22);
      text(angulo[1], width*1/8+width/60, height*1/22);
      text(angulo[2], width*1/8+width/30, height*1/22);
    }
    popStyle();

    if (barras.size()>0) {
      if (barras.get(a).click()) {

        barras.get(a).setA(((100*Character.getNumericValue(angulo[0])+10*Character.getNumericValue(angulo[1])+Character.getNumericValue(angulo[2]))*PI/180));
        k=0;
      }
    }
    break;
  case 3:
    rect(width*11/88, height*1/44, width/40, height/40);

    if (keyPressed&&key>47&&key<58) {
      if (key==48) {
        numeros[j]='0';
      } else if (key==49) {
        numeros[j]='1';
      } else if (key==50) {
        numeros[j]='2';
      } else if (key==51) {
        numeros[j]='3';
      } else if (key==52) {
        numeros[j]='4';
      } else if (key==53) {
        numeros[j]='5';
      } else if (key==54) {
        numeros[j]='6';
      } else if (key==55) {
        numeros[j]='7';
      } else if (key==56) {
        numeros[j]='8';
      } else if (key==57) {
        numeros[j]='9';
      }
    } else if (key==32&&j==0) {
      j++;
    }

    pushStyle();
    textSize(width*1/60);
    fill(0, 102, 153);
    text("Escribe el número de decenas, luego presiona espacio y escribe el número de unidades de la barra.", width/8, 10*height/11  );
    if (j<1) {
      text(numeros[0], width*11/88, height*1/22);
    } else if (j<2) {
      text(numeros[0], width*11/88, height*1/22);
      text(numeros[1], width*11/88+20, height*1/22);
    } else if (j<3) {
      text(numeros[2], width*2/22, height*1/22);
      text(numeros[0], width*2/22+30, height*1/22);
      text(numeros[1], width*2/22+60, height*1/22);
    }
    popStyle();
    d=Character.getNumericValue(numeros[0]);
    u=Character.getNumericValue(numeros[1]);
    for (int i=0; i<barras.size(); i++) {
      if (barras.get(i).click()) {
        barras.get(i).setL(10*d+u);
        j=0;
      }
    }
    break;
  case 4:
    cursor(ARROW);
    for (int i = 0; i<barras.size(); i++) {    
      if (!P&&!Q&&mouseY<height*9/11&&mousePressed&&mouseX>width*3/22+10&&mouseY>height*1/11&&mouseX<width*21/22+10) {
        if (barras.size()>0) {
          for (int j=0; j<barras.size(); j++) {
            if (barras.get(j).origin().click()) {
              start=barras.get(j).origin();
              x=start.x();
              y=start.y();
              P=true;
            } else if (barras.get(j).end().click()) {
              start=barras.get(j).end();
              x=start.x();
              y=start.y();
              P=true;
            }
          }
        }
      }
    }  
    if (Q&&mouseY<height*9/11&&mousePressed&&mouseX>width*3/22+10&&mouseY>height*1/11&&mouseX<width*21/22+10) {
      if (barras.size()>0) {
        for (int j=0; j<barras.size(); j++) {
          if (barras.get(j).origin().click()) {
            magnitud.x=barras.get(j).origin().x();
            magnitud.y=barras.get(j).origin().y();
            P=false;
            mode=0;
            Q=false;
          } else if (barras.get(j).end().click()) {
            magnitud.x=barras.get(j).end().x();
            magnitud.y=barras.get(j).end().x();
            P=false;
            Q=false;
            mode=0;
          }
        }
        if (Q) {
          magnitud=new PVector(mouseX, mouseY);
          P=false;
          Q=false;
          mode=0;
        }
      } else {
        if (Q&&mouseY<700&&mousePressed) {
          magnitud=new PVector(mouseX, mouseY);
          P=false;
          Q=false;
          mode=0;
        }
      }
      fuerzas.add(new Fuerza(start, magnitud));
    }
    break;
    //Mover
case 5:
    pushStyle();
    cursor(MOVE);
    for (int i=0; i<barras.size(); i++) {
      if (barras.get(i).origin.click()) {
        barras.get(i).mov1=true;
      }
      if (barras.get(i).mov1) {
        println(atan2((barras.get(i).end.position.y-barras.get(i).origin.position.y), (barras.get(i).end.position.x-barras.get(i).origin.position.x)));
        barras.get(i).origin.position.x = mouseX;
        barras.get(i).origin.position.y = mouseY;
        textSize(20);
        fill(0, 1, 0);
        if ((barras.get(i).end.position.y-barras.get(i).origin.position.y)>=0) {
          arc(barras.get(i).end.position.x, barras.get(i).end.position.y, 50, 50, -(PI-atan2((barras.get(i).end.position.y-barras.get(i).origin.position.y), (barras.get(i).end.position.x-barras.get(i).origin.position.x))), 0);
        } else {
          arc(barras.get(i).end.position.x, barras.get(i).end.position.y, 50, 50, 0, PI+atan2((barras.get(i).end.position.y-barras.get(i).origin.position.y), (barras.get(i).end.position.x-barras.get(i).origin.position.x)));
        }
        text(int((sqrt(sq(mouseX-barras.get(i).end.position.x) + sq(mouseY-barras.get(i).end.position.y)))/10), barras.get(i).end.position.x+(mouseX-barras.get(i).end.position.x)/2-40, barras.get(i).end.position.y+(mouseY-barras.get(i).end.position.y)/2);
        line(barras.get(i).end.position.x, barras.get(i).end.position.y, barras.get(i).end.position.x+100, barras.get(i).end.position.y);
        textSize(20);
        if ((barras.get(i).end.position.y-barras.get(i).origin.position.y)>=0) {
          text(180+int((-1)*(180/PI)*atan2((barras.get(i).end.position.y-barras.get(i).origin.position.y),(barras.get(i).end.position.x-barras.get(i).origin.position.x)))+"°", barras.get(i).end.position.x+10, barras.get(i).end.position.y+20);
        } else {
          text(180-int((-1)*(180/PI)*atan2((barras.get(i).end.position.y-barras.get(i).origin.position.y),(barras.get(i).end.position.x-barras.get(i).origin.position.x)))+"°", barras.get(i).end.position.x+10, barras.get(i).end.position.y-10);
        }
        fill(0, 1, 0);
        if (!mousePressed) {
          barras.get(i).mov1=false;
        }
      }
      if (barras.get(i).end.click()) {
        barras.get(i).mov2=true;
      }
      if (barras.get(i).mov2) {
        barras.get(i).end.position.x = mouseX;
        barras.get(i).end.position.y = mouseY;
        textSize(20);
        fill(0, 1, 0);
        if ((barras.get(i).origin.position.y-barras.get(i).end.position.y)>=0) {
          arc(barras.get(i).origin.position.x, barras.get(i).origin.position.y, 50, 50, -(PI-atan2((barras.get(i).origin.position.y-barras.get(i).end.position.y), (barras.get(i).origin.position.x-barras.get(i).end.position.x))), 0);
        } else {
          arc(barras.get(i).origin.position.x, barras.get(i).origin.position.y, 50, 50, 0, PI+atan2((barras.get(i).origin.position.y-barras.get(i).end.position.y), (barras.get(i).origin.position.x-barras.get(i).end.position.x)));
        }
        text(int((sqrt(sq(mouseX-barras.get(i).origin.position.x) + sq(mouseY-barras.get(i).origin.position.y)))/10), barras.get(i).origin.position.x+(mouseX-barras.get(i).origin.position.x)/2-40, barras.get(i).origin.position.y+(mouseY-barras.get(i).origin.position.y)/2);
        line(barras.get(i).origin.position.x, barras.get(i).origin.position.y, barras.get(i).origin.position.x+100, barras.get(i).origin.position.y);
        textSize(20);
        if ((barras.get(i).origin.position.y-barras.get(i).end.position.y)>=0) {
          text(180+int((-1)*(180/PI)*atan2((barras.get(i).origin.position.y-barras.get(i).end.position.y),(barras.get(i).origin.position.x-barras.get(i).end.position.x)))+"°", barras.get(i).origin.position.x+10, barras.get(i).origin.position.y+20);
        } else {
          text(180-int((-1)*(180/PI)*atan2((barras.get(i).origin.position.y-barras.get(i).end.position.y),(barras.get(i).origin.position.x-barras.get(i).end.position.x)))+"°", barras.get(i).origin.position.x+10, barras.get(i).origin.position.y-10);
        }
        fill(0, 1, 0);
        if (!mousePressed) {
          barras.get(i).mov2=false;
        }
      }
    }
    for (int i=0; i<apoy.size(); i++) {
      if (apoy.get(i).pos.click()) {
        apoy.get(i).pos.position.x=mouseX;
        apoy.get(i).pos.position.y=mouseY;
      }
    }
    popStyle();
    break;
  case 6:
    for (int i= 0; i<barras.size(); i++) {          
      if (barras.get(i).origin.click()) {
        if (mouseButton == LEFT) {
          direccion= true;        
          momentos.add(new Momento(barras.get(i).origin, 5, direccion));
        }  
        if (mouseButton == RIGHT) {
          direccion= false;        
          momentos.add(new Momento(barras.get(i).origin, 5, direccion));
        }
      }       
      if (barras.get(i).end.click()) {
        if (mouseButton == LEFT) {
          direccion= true;        
          momentos.add(new Momento(barras.get(i).end, 5, direccion));
        }  
        if (mouseButton == RIGHT) {
          direccion= false;        
          momentos.add(new Momento(barras.get(i).end, 5, direccion));
        }
      }
    }    
    break;
  case 7:
    cursor(ARROW);
    if (mousePressed&&dentro()) {
      if (barras.size()>0) {
        for (int i=0; i<barras.size(); i++) {
          if (barras.get(i).origin().click()) { 
            x=barras.get(i).origin().position.x;
            y=barras.get(i).origin().position.y;           
            apoyoin= new Node(x, y);
            apoy.add(new Fixed(apoyoin));
            mode=0;
          } else if (barras.get(i).end().click()) {
            x=barras.get(i).end().position.x;
            y=barras.get(i).end().position.y;    
            apoyoin= new Node(x, y);
            apoy.add(new Fixed(apoyoin));
            mode=0;
          } else if (mouseX != barras.get(i).origin().position.x+10 && mouseX != barras.get(i).origin().position.x-10 && mouseY != barras.get(i).origin().position.y+10 && mouseY != barras.get(i).origin().position.y+10) {
            x=mouseX;
            y=mouseY;
            apoyoin= new Node(x, y);
            apoy.add(new Fixed(apoyoin));
            mode=0;
          }
        }
      } else {
        x=mouseX;
        y=mouseY;
        apoyoin= new Node(x, y);
        apoy.add(new Roller(apoyoin));
        mode=0;
      }
    }
    break;
  case 8:
    cursor(ARROW);
    if (mousePressed&&dentro()) {
      if (barras.size()>0) {
        for (int i=0; i<barras.size(); i++) {
          if (barras.get(i).origin().click()) { 
            x=barras.get(i).origin().position.x;
            y=barras.get(i).origin().position.y;           
            apoyoin= new Node(x, y);
            apoy.add(new Roller(apoyoin));
            mode=0;
          } else if (barras.get(i).end().click()) {
            x=barras.get(i).end().position.x;
            y=barras.get(i).end().position.y;    
            apoyoin= new Node(x, y);
            apoy.add(new Roller(apoyoin));
            mode=0;
          } else if (mouseX != barras.get(i).origin().position.x+10 && mouseX != barras.get(i).origin().position.x-10 && mouseY != barras.get(i).origin().position.y+10 && mouseY != barras.get(i).origin().position.y+10) {
            x=mouseX;
            y=mouseY;
            apoyoin= new Node(x, y);
            apoy.add(new Roller(apoyoin));
            mode=0;
          }
        }
      } else {
        x=mouseX;
        y=mouseY;
        apoyoin= new Node(x, y);
        apoy.add(new Roller(apoyoin));
        mode=0;
      }
    }
    break;
  case 10:
    cursor(ARROW);
    if (mousePressed&&dentro()) {
      if (barras.size()>0) {
        for (int i=0; i<barras.size(); i++) {
          if (barras.get(i).origin().click()) { 
            x=barras.get(i).origin().position.x;
            y=barras.get(i).origin().position.y;           
            apoyoin= new Node(x, y);
            apoy.add(new Pinned(apoyoin));
            mode=0;
          } else if (barras.get(i).end().click()) {
            x=barras.get(i).end().position.x;
            y=barras.get(i).end().position.y;    
            apoyoin= new Node(x, y);
            apoy.add(new Pinned(apoyoin));
            mode=0;
          } else if (mouseX != barras.get(i).origin().position.x+10 && mouseX != barras.get(i).origin().position.x-10 && mouseY != barras.get(i).origin().position.y+10 && mouseY != barras.get(i).origin().position.y+10) {
            x=mouseX;
            y=mouseY;
            apoyoin= new Node(x, y);
            apoy.add(new Pinned(apoyoin));
            mode=0;
          }
        }
      } else {
        x=mouseX;
        y=mouseY;
        apoyoin= new Node(x, y);
        apoy.add(new Pinned(apoyoin));
        mode=0;
      }
    }
    break;
    //Borrar
  case 12:  
    cursor(HAND);
    if (mousePressed&&dentro()) {
      for (int i=0; i<barras.size(); i++) {
        if (barras.get(i).click()) {
          barras.remove(i);
        }
      }
      for (int i=0; i<fuerzas.size(); i++){
        if(fuerzas.get(i).click()){
          fuerzas.remove(i);
        }
      }
      for(int i=0 ; i<momentos.size(); i++){
        if(momentos.get(i).originv.click()){
          momentos.remove(i);
        }
        
      }
      for (int i=0; i<apoy.size(); i++) {
        if (apoy.get(i).pos.click()) {
          apoy.remove(i);
        }
      }
    }
    break;
  }
}

boolean dentro() {
  return (mouseY<height*9/11-10&&mouseX>width*3/22+10&&mouseY>height*1/11+10&&mouseX<width*19/22-10);
}