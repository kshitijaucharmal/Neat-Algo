class Node{
  int number, layer;
  
  ArrayList<Connection> inConnections = new ArrayList<Connection>();
  
  float sum = 0f;
  float outputValue = 0f;
  
  Node(int n, int l){
    number = n;
    layer = l;
  }
  
  float activate(float x){ // sigmoid
    return 1 / (1 + exp(-x));
  }
  
  Node copy(){
    Node n = new Node(number, layer);
    n.sum = sum;
    n.outputValue = outputValue;
    return n;
  }
}
