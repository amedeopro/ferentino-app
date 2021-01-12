class Locale {
  String id;
  String nomeLocale;
  String indirizzo;
  String telefono;
  String immagine;
  double latitudine;
  double longitudine;

  Locale({this.id, this.nomeLocale, this.indirizzo, this.immagine, this.telefono, this.latitudine, this.longitudine});

  Locale.fromMap(Map<String, dynamic> mappa){
    this.id = mappa['id'].toString();
    this.nomeLocale = mappa['nomeLocale'].toString();
    this.indirizzo = mappa['indirizzo'].toString();
    this.telefono = mappa['telefono'].toString();
    this.latitudine = mappa['lat'];
    this.longitudine = mappa['long'];
    try{
      this.immagine = (mappa['imgurl'] == null) ? '' : mappa['imgurl'].toString();
    }
    catch(errore){
      this.immagine = '';
    }
  }
}