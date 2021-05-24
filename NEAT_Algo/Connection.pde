class Connection{
  Node in_node, out_node;
  float weight = random(-2, 2);
  boolean enabled = true;
  int inno = -1;
  
  Connection(Node i, Node o){
    in_node = i;
    out_node = o;
  }
  
  void printConnection(){
    println(inno + ") " + in_node.number + "(" + in_node.layer + ") " + out_node.number + "(" + out_node.layer + ") " + weight + " " + enabled);
  }
  
  Connection copy(){
    Connection c = new Connection(in_node.copy(), out_node.copy());
    c.weight = weight;
    c.inno = inno;
    c.enabled = enabled;
    return c;
  }
}
