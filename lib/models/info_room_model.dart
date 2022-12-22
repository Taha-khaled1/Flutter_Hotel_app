class InfoRoomModel {
  Room? room;
  List<RelatedRooms>? relatedRooms;
  String? userContactInfo;

  InfoRoomModel({this.room, this.relatedRooms, this.userContactInfo});

  InfoRoomModel.fromJson(Map<String, dynamic> json) {
    room = json['Room'] != null ? new Room.fromJson(json['Room']) : null;
    if (json['relatedRooms'] != null) {
      relatedRooms = <RelatedRooms>[];
      json['relatedRooms'].forEach((v) {
        relatedRooms!.add(new RelatedRooms.fromJson(v));
      });
    }
    userContactInfo = json['UserContactInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.room != null) {
      data['Room'] = this.room!.toJson();
    }
    if (this.relatedRooms != null) {
      data['relatedRooms'] = this.relatedRooms!.map((v) => v.toJson()).toList();
    }
    data['UserContactInfo'] = this.userContactInfo;
    return data;
  }
}

class Room {
  int? disCount;
  String? sId;
  String? title;
  String? type;
  int? price;
  int? maxPeople;
  String? desc;
  String? city;
  String? address;
  int? destanceFromCityCenter;
  String? averageRating;
  List<String>? features;
  bool? featured;
  int? bookingNumber;
  List<RoomNumbers>? roomNumbers;
  List<String>? unavailableDates;
  List<String>? category;
  List<Feedbacks>? feedbacks;
  String? imgs;

  Room(
      {this.disCount,
      this.sId,
      this.title,
      this.type,
      this.price,
      this.maxPeople,
      this.desc,
      this.city,
      this.address,
      this.destanceFromCityCenter,
      this.averageRating,
      this.features,
      this.featured,
      this.bookingNumber,
      this.roomNumbers,
      this.unavailableDates,
      this.category,
      this.feedbacks,
      this.imgs});

  Room.fromJson(Map<String, dynamic> json) {
    disCount = json['disCount'];
    sId = json['_id'];
    title = json['title'];
    type = json['type'];
    price = json['price'];
    maxPeople = json['maxPeople'];
    desc = json['desc'];
    city = json['city'];
    address = json['address'];
    destanceFromCityCenter = json['destanceFromCityCenter'];
    averageRating = json['averageRating'].toString();
    features = json['features'].cast<String>();
    featured = json['featured'];
    bookingNumber = json['bookingNumber'];
    if (json['roomNumbers'] != null) {
      roomNumbers = <RoomNumbers>[];
      json['roomNumbers'].forEach((v) {
        roomNumbers!.add(new RoomNumbers.fromJson(v));
      });
    }
    unavailableDates = json['unavailableDates'].cast<String>();
    category = json['category'].cast<String>();
    if (json['feedbacks'] != null) {
      feedbacks = <Feedbacks>[];
      json['feedbacks'].forEach((v) {
        feedbacks!.add(new Feedbacks.fromJson(v));
      });
    }
    imgs = json['imgs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['disCount'] = this.disCount;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['type'] = this.type;
    data['price'] = this.price;
    data['maxPeople'] = this.maxPeople;
    data['desc'] = this.desc;
    data['city'] = this.city;
    data['address'] = this.address;
    data['destanceFromCityCenter'] = this.destanceFromCityCenter;
    data['averageRating'] = this.averageRating;
    data['features'] = this.features;
    data['featured'] = this.featured;
    data['bookingNumber'] = this.bookingNumber;
    if (this.roomNumbers != null) {
      data['roomNumbers'] = this.roomNumbers!.map((v) => v.toJson()).toList();
    }
    data['unavailableDates'] = this.unavailableDates;
    data['category'] = this.category;
    if (this.feedbacks != null) {
      data['feedbacks'] = this.feedbacks!.map((v) => v.toJson()).toList();
    }
    data['imgs'] = this.imgs;
    return data;
  }
}

class RoomNumbers {
  int? number;
  List<String>? unavailableDates;
  String? sId;

  RoomNumbers({this.number, this.unavailableDates, this.sId});

  RoomNumbers.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    unavailableDates = json['unavailableDates'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['unavailableDates'] = this.unavailableDates;
    data['_id'] = this.sId;
    return data;
  }
}

class Feedbacks {
  String? userId;
  int? rating;
  String? review;
  String? date;
  String? sId;

  Feedbacks({this.userId, this.rating, this.review, this.date, this.sId});

  Feedbacks.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    rating = json['rating'];
    review = json['review'];
    date = json['date'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['date'] = this.date;
    data['_id'] = this.sId;
    return data;
  }
}

class RelatedRooms {
  String? sId;
  String? title;
  int? price;
  String? city;
  String? averageRating;
  String? imgs;

  RelatedRooms(
      {this.sId,
      this.title,
      this.price,
      this.city,
      this.averageRating,
      this.imgs});

  RelatedRooms.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = json['price'];
    city = json['city'];
    averageRating = json['averageRating'].toString();
    imgs = json['imgs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['city'] = this.city;
    data['averageRating'] = this.averageRating;
    data['imgs'] = this.imgs;
    return data;
  }
}
