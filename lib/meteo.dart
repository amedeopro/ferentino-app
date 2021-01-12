class Meteo {
  int id;
  double temperatura;
  String name;


  Meteo(this.id, this.temperatura, this.name);

  Meteo.fromMap(Map<String, dynamic> mappa){
    this.id = mappa['id'];
    this.temperatura = mappa['main']['temp'];
    this.name = mappa['name'].toString();
  }
}