class Apod {
  Apod([
    this._date,
    this._explanation,
    this._hdurl,
    this._mediaType,
    this._serviceVersion,
    this._title,
    this._url,
  ]);

  DateTime? _date;
  String? _explanation;
  String? _hdurl;
  String? _mediaType;
  String? _serviceVersion;
  String? _title;
  String? _url;

  factory Apod.fromJson(Map<String, dynamic> json) => Apod(
        DateTime.parse(json["date"]),
        json["explanation"],
        json["hdurl"],
        json["media_type"],
        json["service_version"],
        json["title"],
        json["url"],
      );

  get date => _date;
  get explanation => _explanation;
  get hdurl => _hdurl;
  get mediaType => _mediaType;
  get serviceVersion => _serviceVersion;
  get title => _title;
  get url => _url;
  get isImage => _mediaType == 'image';
  get isVideo => _mediaType == 'video';

  Map<String, dynamic> toJson() => {
        "date": _date!.toIso8601String(),
        "explanation": _explanation,
        "hdurl": _hdurl,
        "media_type": _mediaType,
        "service_version": _serviceVersion,
        "title": _title,
        "url": _url,
      };

  bool isEmpty() {
    return _date == null;
  }
}
