class ConnectionHistory{
  int global_inno = 0;
  ArrayList<Connection> allConnections = new ArrayList<Connection>();
  
  int inputs, outputs;
  
  ConnectionHistory(int i, int o){
    inputs = i;
    outputs = o;
  }
  
  Connection exists(Node n1, Node n2){
    if(allConnections.size() == 0) return null;
    for(Connection c : allConnections){
      if(c.in_node.number == n1.number && c.out_node.number == n2.number){
        return c;
      }
    }
    return null;
  }
}
