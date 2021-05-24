
int input_layer = 0;
int output_layer = 10;
ConnectionHistory ch;
Genome g;

void setup(){
  size(600, 600);
  ch = new ConnectionHistory(4, 2);
  g = new Genome(ch, true);
  g.showConn();
}

void draw(){
  background(51);
}
