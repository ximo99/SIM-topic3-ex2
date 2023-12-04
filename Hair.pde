//Class Hair
class Hair
{
  float longitude;
  int NumSprings, Nropes;
  float L_spring;
  PVector origin;
  
  Extreme[] vExtr = new Extreme[Nsprings+1];
  Spring[] vSprings = new Spring[Nsprings];
  
  Hair (float _longitude, int _nmuelles, PVector _origin)
  {
    longitude = _longitude;
    NumSprings = _nmuelles;
    L_spring = longitude/NumSprings;
    origin = _origin;
    
    // Extremes initialization
    for(int i = 0; i < vExtr.length; i++)
      vExtr[i] = new Extreme (origin.x + i *L_spring, origin.y);
    
    // Initialization of the springs that join the ends
    for (int i = 0; i<vSprings.length; i++)
      vSprings[i] = new Spring(vExtr[i], vExtr[i+1], L_spring);
  }
  
  void update()
  {
    for (Spring s: vSprings)
    {
      s.update();
      s.display();
    }
    
    for (int i = 1; i < vExtr.length; i++)
    {
      vExtr[i].update();
      vExtr[i].display();
      vExtr[i].drag(mouseX, mouseY); //recogida de coordenadas de ratón
    }
  }
  
  void on_click()
  {
    for(Extreme b: vExtr)
      b.clicked(mouseX, mouseY); //recogida de coordenadas de ratón
  }
  
  void release()
  {
    for (Extreme b: vExtr)
      b.stopDragging();
  }
  
}
