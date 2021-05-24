class Genome{
  int inputs, outputs;
  int total_nodes = 0;
  float creation_rate = 0.6;
  
  ArrayList<Connection> connections = new ArrayList<Connection>();
  ArrayList<Node> nodes = new ArrayList<Node>();
  
  ConnectionHistory ch;
  
  Genome(ConnectionHistory ch, boolean create){
    this.ch = ch;
    inputs = ch.inputs;
    outputs = ch.outputs;
    
    if(create) createNetwork();
  }
  
  void createNetwork(){
    for(int i = 0; i < inputs; i++){
      nodes.add(new Node(total_nodes++, input_layer));
    }
    for(int i = 0; i < outputs; i++){
      nodes.add(new Node(total_nodes++, output_layer));
    }
    
    for(int i = 0; i < inputs * outputs; i++){
      if(random(1) < creation_rate){
        addConnection();
      }
    }
  }
  
  void addConnection(){
    Node n1 = nodes.get(int(random(nodes.size())));
    Node n2 = nodes.get(int(random(nodes.size())));
    
    while(n1.layer == output_layer){
      n1 = nodes.get(int(random(nodes.size())));
    }
    while(n2.layer == input_layer && n2.layer <= n1.layer){
      n2 = nodes.get(int(random(nodes.size())));
    }
    
    Connection c = ch.exists(n1, n2);
    Connection x = new Connection(n1, n2);
    
    if(c != null){
      x.inno = c.inno;
      if(!exists(x.inno)){
        connections.add(x);
        n2.inConnections.add(x.copy());
      }
    }
    else{
      x.inno = ch.global_inno++;
      connections.add(x);
      ch.allConnections.add(x.copy());
      n2.inConnections.add(x.copy());
    }
  }
  
  void showConn(){
    for(Connection c : connections){
      c.printConnection();
    }
  }
  
  void addNode(){
    nodes.add(new Node(total_nodes++, int(random(input_layer+1, output_layer))));
  }
  
  boolean exists(int nn){
    for(Connection c : connections){
      if(c.inno == nn){
        return true;
      }
    }
    return false;
  }
}
