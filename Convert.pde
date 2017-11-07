
// this class converts latitude and longitude into x, y, z points on sphere.

class Convert {
  
// Contstructors  
  Convert() {
  }
  
  Convert(float lat, float lon) {
    float theta = radians(lat) + PI/2;
    float phi = radians(-lon) + PI;    
    coord.x = r * sin(theta) * cos(phi);
    coord.y = r * cos(theta);
    coord.z = r * sin(theta) * sin(phi);
    point(coord.x, coord.y, coord.z);
  }
}