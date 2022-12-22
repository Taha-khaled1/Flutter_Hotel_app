import '../main.dart';

class MangeAPi {
  static const String baseurl = "https://hotel-booking-8qw1.onrender.com";
  /////////////////////////////Auth///////////////////////////////////////
  static const String login = "$baseurl/api/users/auth/login";

  //////////////////////////////////main//////////////////////////////
  static const String topRatingRooms = "$baseurl/api/rooms/topRating";
  static const String topBookingRooms = "$baseurl/api/rooms/topBooking";
  static const String getHotelTypes = "$baseurl/api/hotels/getHotelTypes";
  static const String getCities = "$baseurl/api/hotels/getCities";

  //////////////////////////////////////////////////////////////////////
  static const String updateUser = "$baseurl/api/users/updateUser"; //id user
  static const String getinfoRatingandBoking =
      "$baseurl/api/rooms/getRoom"; //id room
  static const String getdatabycities = "$baseurl/api/rooms/getCity"; //idcity
  static const String getInfoUser =
      "$baseurl/api/users/getUserInformation"; //id user

  static const String searchBytext = "$baseurl/api/rooms/roomSearch"; //id user
  ///63a121b56cc98ab64c281828 : auth
}
