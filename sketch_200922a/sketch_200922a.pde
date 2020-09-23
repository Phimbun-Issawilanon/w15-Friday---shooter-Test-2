public class Ball{
  float position_x,  position_y;
  float size;
  float xspeed = 2.8, yspeed = 2.2;
  int xdirection = 1, ydirection = 1,leftscore, Rightscore;
  
  Ball(float size1){
    position_x = width/2;
    position_y = height/2;
    size = size1;
  }
  
  public void draw(){
    circle(position_x,position_y,size);
    
  }
  public void ball_move(){
    position_x = position_x+(xspeed*xdirection);
    position_y = position_y+(yspeed*ydirection);
    if (position_x> width+60) {
        leftscore+=1;
        position_x = width/2;
        position_y = height/2;
        game.score(0,leftscore);
    }
    else if (position_x<-60) {
        Rightscore+=1;
        position_x = width/2;
        position_y = height/2;
        game.score(Rightscore,0);
    }
    if (position_y > height-(size/2)|| position_y < size/2) {
        ydirection *= -1;
    }
    draw();
  }
  
}

public class Pong_game{
  int scoreR = 0, scoreL = 0,r,l;
  float position_x,position_y,size;
  
  
  public void update(){
  }
  
  
 void score(int r, int l){
   scoreR = r;
   scoreL = l;
   
   board();
 }
 void board(){
   textSize(50);
   text(scoreR, 800 , 50);
   text(scoreL, 100, 50);
 }
 
}
public class Paddle{
  float bounce;
  float paddle_x, paddle_y, paddle_w, paddle_h ,paddle_yR, paddle_yL;
  String input;
  
  
  Paddle(float pad_w,float pad_h){
    paddle_x = width;
    paddle_y = height/3;
    paddle_yL = paddle_y;
    paddle_yR = paddle_y;
    paddle_w = pad_w;
    paddle_h = pad_h;
  }
  
  public void draw(){
    fill(255);
    rect(paddle_x-20, paddle_yR, paddle_w, paddle_h);
    rect(paddle_x-900, paddle_yL, paddle_w, paddle_h);
  }
  public void racket_update(int y){
    delay(60);
  
    
  }
  public void move_racket(){
    if (dist(paddle_x-20,paddle_y, mouseX, mouseY)< paddle_w+paddle_h){
      cursor(HAND);
      if(mousePressed){
        paddle_yR = mouseY;
      }   
    }
    else if (dist(paddle_x-900,paddle_y, mouseX, mouseY) < paddle_h){
      cursor(HAND);
      if(mousePressed){
        paddle_yL = mouseY;
      }   
    }
    else {
      cursor(ARROW);
    }
    draw();
   
  }
  
  void ball_bounce(){
  }
}
Pong_game game = new Pong_game();
Ball ball ;
Paddle paddle;

void setup(){
  size(900,700);
  ball = new Ball(100);
  paddle = new Paddle(20,200);
 
}

void draw(){
  background(0);
  ball.ball_move();
  paddle.move_racket();
  game.board();
}
