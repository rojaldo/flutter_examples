class Beer {
  String _name;
  String _tagline;
  String _description;
  String _imageUrl;
  num _abv;

  Beer(
      [this._name = '',
      this._tagline = '',
      this._description = '',
      this._imageUrl = '',
      this._abv = 0.0]);

  factory Beer.fromJson(dynamic json) {
    return Beer(
      json['name'],
      json['tagline'],
      json['description'],
      json['image_url'],
      json['abv'],
    );
  }

  get name => _name;
  get tagline => _tagline;
  get description => _description;
  get imageUrl => _imageUrl;
  get abv => _abv;
}
