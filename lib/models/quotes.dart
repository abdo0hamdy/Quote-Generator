class Qutoe {
  String id;
  String author;
  String content;
  List<dynamic> tags;
  String authorSlug;
  int length;
  String dateAdded;
  String dateModified; 
  
  Qutoe(
      {required this.id,
      required this.author,
      required this.content,
      required this.tags,
      required this.authorSlug,
      required this.length,
      required this.dateAdded,
      required this.dateModified  
      });

  factory Qutoe.fromJson(Map<String, dynamic> json) {
    return Qutoe(
        id: json['_id'],
        author: json['author'],
        content: json['content'],
        tags: json['tags'],
        authorSlug: json['authorSlug'],
        length: json['length'],
        dateAdded: json['dateAdded'],
        dateModified: json['dateModified']
        );
  }

  static Map<String, dynamic> toJson(Qutoe qutoe) => {
        "id": qutoe.id,
        "author": qutoe.author,
        "content": qutoe.content,
        "tags": qutoe.tags,
        "authorSlug": qutoe.authorSlug,
        "length": qutoe.length,
        "dateAdded": qutoe.dateAdded,
        "dateModified": qutoe.dateModified,
      };
}
