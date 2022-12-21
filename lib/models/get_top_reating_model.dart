class GetTopReatingModel {
  List<TopRatingRooms>? topRatingRooms;

  GetTopReatingModel({this.topRatingRooms});

  GetTopReatingModel.fromJson(Map<String, dynamic> json) {
    if (json['topRatingRooms'] != null) {
      topRatingRooms = <TopRatingRooms>[];
      json['topRatingRooms'].forEach((v) {
        topRatingRooms!.add(new TopRatingRooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topRatingRooms != null) {
      data['topRatingRooms'] =
          this.topRatingRooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopRatingRooms {
  String? sId;
  String? title;
  int? price;
  String? city;
  String? averageRating;

  TopRatingRooms(
      {this.sId, this.title, this.price, this.city, this.averageRating});

  TopRatingRooms.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    city = json['city'];
    averageRating = json['averageRating'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['city'] = this.city;
    data['averageRating'] = this.averageRating;
    return data;
  }
}
