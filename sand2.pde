int row,col,res;
int[][] grid ;
int[][] cop ;
int sand= 1,water =2 , surface =3 ,empty =0;

void setup(){
size(700,600);
background(0);
frameRate(30);
res =2;
col =width/res ;
row= height/res;
grid = new int[row][col];

for(int i=0;i<row;i++){
    for(int j=0;j<col;j++){
       grid[i][j]=0;
       if(i == row-1 ||i ==j){grid[i][j] = surface ; }
       }
} 
}
void draw(){
  pour();
 update();

       try {
      for(int i = 0 ; i < row ; i++){
   for(int j = 0 ; j < col ; j++){
   if(i+1 <=col && j-1>=0 && j+1<row-1 && grid[i][j]!=surface){
       if(grid[i+1][j]==0 && grid[i][j]!=0) {
         make(i+1,j,1);
         make(i,j,0);
       }
        if(grid[i+1][j+1]==0 && grid[i][j]!=0) {
         make(i+1,j+1,1);
         make(i,j,0);
       }
       if(grid[i+1][j-1]==0 && grid[i][j]!=0) {
         make(i+1,j-1,1);
         make(i,j,0);
       }
   }
     
   }
 }
    } catch (Exception e) {
      System.out.println("Oops! "+e);
    }
   
}
void pour(){
  int px = int(mouseX)/res ;
  int py = int(mouseY)/res ;
  
  push();
  fill(60,200,0);
  textSize(100);
 // text(""+px+" "+py ,random(width),random(height)-1);
  pop();
 
   int i =int( random(6)) ; 
 try{
    make(py,px,1);
  make(py+i,px+i,1);
  make(py-i,px+i,1);
  make(py+i,px-i,1);
  make(py+2*i,px,1);
  make(py,px+2*i,1);
  make(py-2*i,px,1);
  make(py,px-2*i,1);
   make(py+2*i,px-i,1);
  make(py+2*i,px+2*i,1);
  make(py-2*i,px-2*i,1);
  make(py-2*i,px-i,1);
  make(py,px-2*i,1);
//  make(py-2*i,px-i,1);
 }
 catch(Exception e){
   System.out.println("Oops!!");
 }
 
 
  
//  update();
//random(250)+150,random(100),random(20)
}
void update(){
  for(int i=0;i<row;i++){
    for(int j=0;j<col;j++){
        if(grid[i][j] ==0){fill(0);}
        else if(grid[i][j] ==surface){fill(200);}
        else{fill(250,random(105),5);}
        
       strokeWeight(.0001);
       stroke(255);
        rect(res*j,res*i,res,res);
    }
} 


}
void make(int x,int y , int elem){
 if(grid[x][y]!=surface){
    grid[x][y] =elem;
  }
}
void mouseDragged(){
  int px = int(mouseX)/res ;
  int py = int(mouseY)/res ;
 try{
    
  grid[py][px] = surface ;
   grid[py-1][px] = surface ;
    grid[py][px-1] = surface ;
   grid[py+1][px+1] = surface ;
   grid[py-1][px-1] = surface ;
 }
 catch(Exception e ) {
   System.out.println(""+e);
 }
}
void mousePressed(){
   int px = int(mouseX)/res ;
  int py = int(mouseY)/res ;
   
  grid[py][px] = empty ;
   grid[py-1][px] = empty ;
    grid[py][px-1] = empty ;
   grid[py+1][px+1] = empty ;
   grid[py-1][px-1] = empty ;
}
