//You should implement your assign2 here.
final int GAME_START=1, GAME_READY=2, GAME_RUN=3, GAME_LOSE=4;
int gameState;
PImage background1,background2,ending1Img,ending2Img,enemyImg,jetImg,hpImg,treasureImg,starting1Img,starting2Img
       ,elementGainbomb,electmentEnemy;
float hp,treasureX,treasureY,enemyX,enemyY,backgroundX,jetX,jetY;
boolean  starting1=true;
boolean  starting2=false;
boolean  ending1=false;
boolean  ending2=false;
boolean  upPressed=false;
boolean  downPressed=false;
boolean  leftPressed=false;
boolean  rightPressed=false;

void setup () {
  
  size(640,480) ; 
  gameState=GAME_START;  
  background1=loadImage("img/bg1.png");
  background2=loadImage("img/bg2.png");
  ending1Img=loadImage("img/end1.png");
  ending2Img=loadImage("img/end2.png");
  enemyImg=loadImage("img/enemy.png");
  jetImg=loadImage("img/fighter.png");
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  starting1Img=loadImage("img/start1.png");
  starting2Img=loadImage("img/start2.png");
  elementGainbomb=loadImage("img/Moocs-element-gainbomb.png");
  electmentEnemy=loadImage("img/Moocs-element-enemy1.png");
    
  //treasure
  treasureX=random(200,500);
  treasureY=random(50,425);
  
  //enemy  
  enemyY=random(50,400); 
  
  //jet
  jetX=589;
  jetY=215;
  }


void draw() {
 
 switch(gameState){
   case GAME_START:
   if(starting1){
     image(starting2Img,0,0);
     }
   //hover
   if(mouseX>=200 && mouseX<=400 && mouseY>=370 && mouseY<=421){
     starting1=false;
     starting2=true;
     if(starting2){
     image(starting1Img,0,0);
       //click
       if(mousePressed){
       gameState= GAME_READY;
       } 
       else{ 
       starting1=true;} 
   }
 }
 
   break;
 
 
   case GAME_READY:
   image(background2,0,0);
   //replace jet and HP
   hp=44;
   jetX=589;
   jetY=215;   
   gameState=GAME_RUN;
   
   break;
   
   
   case GAME_RUN:
   //BACKGROUNG
   backgroundX=backgroundX%1282;
   backgroundX-=1;
   image(background2,backgroundX,0);
   image(background1,backgroundX+641,0);
   image(background2,backgroundX+1282,0);  
                  
   //jet
   image(jetImg,jetX,jetY);
   //keyboard control
   if (upPressed){
   jetY-=4;
     if(jetY<=0){
      jetY=0;}
   }
   if (downPressed){
   jetY+=4;
     if(jetY>=429){
     jetY=429;}
   }
   if (leftPressed){
   jetX-=4;
     if(jetX<=0){
       jetX=0;}
   }
   if (rightPressed){
   jetX+=4;
     if(jetX>=589){
       jetX=589;}
   }
     
   //HP    
   noStroke();
   fill(255,0,0);
   rect(6,3,hp,25);
   image(hpImg,0,0);
        
   //enemy   
   enemyX+=2;
   enemyX=enemyX%641;
   image(enemyImg,enemyX,enemyY);        
   if (enemyX==640){
   enemyX=0;
   enemyY=random(85,400);}
   //jet run into enemy
   if( enemyY>=jetY-51 && enemyY<=jetY+51){
     if(enemyX+51>=jetX && enemyX-41<=jetX){
     enemyX=0;
     enemyY=random(85,400);
     hp-=39;      
     }
   }
   // the enemy rushs toward the jet 
    if(enemyX<=jetX+41){
     enemyX+=(jetX-enemyX)/50;}
     enemyY+=(jetY-enemyY)/50;
   
        
         
   //treasure
   image(treasureImg,treasureX,treasureY);
   //treasure replace
   if(jetY>=treasureY-35 && jetY<=treasureY+35){
     if(jetX<=treasureX+35 && jetX>=treasureX-41){
     treasureX=random(150,500);
     treasureY=random(50,425);
     hp+=19.5;}
     
   //HP (maximium and minimum)  
   if(hp>201){
     hp=201;}  
   }
   if(hp<=6){
     gameState=GAME_LOSE;}
     
   break;   
   
   
   case GAME_LOSE:
   ending1=true;
   if(ending1){
   image(ending2Img,0,0);
   }
   //hover
   if(mouseX>=200 && mouseX<=420 && mouseY>=300 && mouseY<=340){
     ending1=false;
     ending2=true;
     if(ending2){
     image(ending1Img,0,0);
     //click
       if(mousePressed){
         gameState= GAME_READY;
       } else{ 
       ending1=true;
     } 
   }
 }
   break;
   }     
}
      
void keyPressed(){
  if(key==CODED){
    switch(keyCode){
       case UP:
         upPressed=true;
       break;
       case DOWN:
         downPressed=true;
       break;
       case LEFT:
         leftPressed=true;
       break;
       case RIGHT:
         rightPressed=true;
       break;
          }
        }    
      }      
      
void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=false;
      break;
      case DOWN:
        downPressed=false;
      break;
      case LEFT:
        leftPressed=false;
      break;
      case RIGHT:
        rightPressed=false;
      break;
          }
        }
      }
