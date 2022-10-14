class Book {
  int _id = -1;
  String _title = '';
  String _author = '';

  Book([String title = '', String author = '', id = -1]) {
    _title = title;
    _author = author;
    _id = id;
  }

  Book.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _author = json['author'];
    _id = json['id'];
  }

  String get title => _title;
  String get author => _author;
  int get id => _id;

  String toString() {
    return 'Book: $_title by $_author (id: $_id)';
  }
}
