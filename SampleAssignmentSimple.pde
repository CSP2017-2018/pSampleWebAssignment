
boolean on=false;
Dog d;
SpinDog sd;
BigDog bd;
JumpDog jd;
int savedTime;
int totalTime = 2000;

float startTime;

void setup() {
  size(800, 600);
  d=new Dog();
  sd=new SpinDog();
  bd=new BigDog();
  jd=new JumpDog();
  fill(255);
  savedTime = millis();
}

void draw() {
  background(0);

  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {
    println("5 seconds have passed!");
    if (on==true) {
      on=false;
    } else if (on==false) {
      on=true;
    }
    savedTime = millis(); // Save the current time to restart the timer!
  }
    textSize(20);
    text("Welcome to the Dog Show! Inpsired by an RHS student", 200, 40);

    d.doTricks();
    d.speak();

    sd.doTricks(on);
    sd.buildTable();

    bd.doTricks(on);
    bd.buildTable();

    jd.doTricks(on);
    jd.buildTable();
  }
  void mousePressed() {
    if (on==true) {
      on=false;
    } else if (on==false) {
      on=true;
    }
  }
  
  
  
  
  class BigDog extends Dog {

  BigDog() {
    super();
  }

  void doTricks(boolean on) {
    d1pos.add(d1vel);
    pushMatrix();
    d1.disableStyle();
    translate(width/2, height/2);
    if (on) {
      fill(0, 255, 0);
      d1vel.y=-3;
    } else {
      fill(255);
      d1vel.y+=.7;
      if (d1pos.y+100>200) {
        d1vel.y*=-.3;
      }
    }
    shape(d1, d1pos.x-50, d1pos.y-50, 220, 200);
    popMatrix();
  }

  void buildTable() {
    fill(255);
    rect(360, 545, 150, 15);
    fill(255, 0, 0);
    textSize(12);
    text("BigDog", 420, 555);
  }

  void speak() {
  }
}



public class Dog {
  PShape d1;
  PVector d1pos;
  PVector d1vel;
  float a=0;
  float tableAngle = 0;
  float angleChange = 2;
  final int ANGLE_LIMIT = 45;



  Dog() {
    d1 = loadShape("images/dog.svg");
    d1pos =new PVector(0, 0);
    d1vel=new PVector(0, -.6);
  }

  void doTricks() {
    pushMatrix();
    d1.disableStyle();
    
    translate(100, 100);
    fill(255, 0, 0);
    rotate(radians(tableAngle));
    fill(255);
    rect(-80, 45, 150, 15);
    fill(255, 0, 0);
    textSize(12);
    text("Dog #1", -30, 55);
    
    tableAngle += angleChange;
    if (tableAngle > ANGLE_LIMIT || tableAngle < -45) {
      angleChange = -angleChange;
      tableAngle += angleChange;
    }
    if (on) {
      fill(255, 255, 0);
    } else {
      fill(255);
    }
    shape(d1, d1pos.x-50, d1pos.y-50, 100, 100);
    popMatrix();
  }

  void speak() {
    fill(255);
    //ellipse(100, 100, 200, 100);
    text("arf", 150, 100);
  }
}



class JumpDog extends Dog {

  JumpDog() {
    super();
  }

  void doTricks(boolean on) {
    d1pos.add(d1vel);
    pushMatrix();
    d1.disableStyle();
    translate(700, 100);
    if (on) {
      fill(0, 0, 255);
      d1vel.y=-4;
    } else {
      fill(255);
      d1vel.y+=.6;
      if (d1pos.y+100>200) {
        d1vel.y*=-.4;
      }
    }
    shape(d1, d1pos.x-75, d1pos.y-50, 150, 100);
    popMatrix();
  }

  void buildTable() {
    fill(255);
    rect(620, 245, 150, 15);
    fill(255, 0, 0);
    textSize(12);
    text("JumpDog", 650, 255);
  }
  void speak() {
  }
}


class SpinDog extends Dog {
  float angle=0;

  SpinDog() {
    super();
  }

  void doTricks(boolean on) {
    pushMatrix();
    d1.disableStyle();
    translate(100, 300);

    if (on) {
      rotate(angle);
      fill(255, 0, 0);
      angle+=.1;
    } else {
      fill(255);
      angle+=.01;
      if (d1pos.y+100>200) {
        d1vel.y*=-.5;
      }
    }
    shape(d1, d1pos.x-50, d1pos.y-50, 100, 100);
    popMatrix();
  }

  void buildTable() {
    fill(255);
    rect(20, 350, 150, 15);
    fill(255, 0, 0);
    textSize(12);
    text("SpinDog", 70, 360);
  }

  void speak() {
  }
}
