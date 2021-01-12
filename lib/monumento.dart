class Monumento {
  String id;
  String nomeMonumento;
  String intro;
  String immagine;

  Monumento(this.id, this.nomeMonumento, this.intro, this.immagine);

  Monumento.fromMap(Map<String, dynamic> mappa){
    this.id = mappa['id'].toString();
    this.nomeMonumento = mappa['title']['rendered'].toString();
    this.intro = mappa['excerpt']['rendered'];
    try{
      this.immagine = (mappa['jetpack_featured_media_url'] == null) ? '' : mappa['jetpack_featured_media_url'].toString();
    }
    catch (errore){
      this.immagine = '';
    }
  }

}