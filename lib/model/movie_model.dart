class MovieModel {
  int? id;
  String? name;
  String? poster;
  String? desc;
  String? movie;
  bool? favorite;

  MovieModel({
    this.id,
    this.name,
    this.poster,
    this.desc,
    this.movie,
    this.favorite = false,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    poster = json['poster'];
    desc = json['desc'];
    movie = json['movie'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poster'] = this.poster;
    data['desc'] = this.desc;
    data['movie'] = this.movie;
    data['favorite'] = this.favorite;
    return data;
  }
}
