import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbooking/UI/B1_Home/Hotel/Hotel_Detail_Concept_1/reviewDetail1.dart';
import 'package:hotelbooking/UI/B1_Home/Hotel/Hotel_Detail_Concept_2/maps.dart';
import 'package:hotelbooking/UI/handlingView/handlingview.dart';
import 'package:hotelbooking/controller/getInfoRoom_controller.dart';
import 'package:hotelbooking/models/info_room_model.dart';
import 'package:hotelbooking/resourse/mange_link_api.dart';
import '../../../../Library/Ratting_Bar/ratting.dart';
import 'gallery.dart';

class HotelDetail extends StatefulWidget {
  HotelDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  double rating = 3.5;
  final Set<Marker> _markers = {};
  final LatLng _currentPosition = const LatLng(40.7078523, -74.008981);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: const MarkerId("40.7078523, -74.008981"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GetInfoRoomController getInfoRoomController =
        Get.put(GetInfoRoomController());
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<GetInfoRoomController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: <Widget>[
                  SliverPersistentHeader(
                    /// Create Appbar
                    delegate: MySliverAppBar(
                      controller: controller,
                      expandedHeight: _height - 30.0,
                    ),
                    pinned: true,
                  ),

                  /// Create body
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// For icon row
                        IconsAllWidget(),

                        /// Desc
                        DescrptionWidget(controller: controller),

                        /// Location
                        LocationHomeWidget(markers: _markers),

                        /// Gallery
                        GalleryWidget(width: _width),

                        /// Ratting
                        ReatingRomWidget(controller: getInfoRoomController),

                        ///Related Post
                        RelatedRoomsWidget(controller: controller),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReatingRomWidget extends StatefulWidget {
  const ReatingRomWidget({super.key, required this.controller});
  final GetInfoRoomController controller;
  @override
  State<ReatingRomWidget> createState() => _ReatingRomWidgetState();
}

class _ReatingRomWidgetState extends State<ReatingRomWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: 600.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF656565).withOpacity(0.15),
                  blurRadius: 1.0,
                  spreadRadius: 0.2,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Reviews",
                        style: TextStyle(
                            fontFamily: "Sofia",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 15.0, bottom: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              child: const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: Colors.indigoAccent,
                                        fontSize: 14.0),
                                  )),
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        reviewDetail1()));
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 15.0, top: 2.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.0,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            StarRating(
                              size: 25.0,
                              starCount: 5,
                              rating: double.tryParse(widget.controller
                                      .infoRoomModel!.room!.averageRating
                                      .toString()) ??
                                  5.0,
                              color: Colors.yellow,
                              borderColor: Colors.yellow,
                              onRatingChanged: (double rating) {},
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              "${widget.controller.infoRoomModel?.room!.feedbacks!.length} Reviews",
                            ),
                          ]),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 20.0, top: 15.0, bottom: 7.0),
                    child: _line(),
                  ),
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget
                          .controller.infoRoomModel!.room!.feedbacks!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildRating(
                            widget.controller.infoRoomModel!.room!
                                .feedbacks![index].date
                                .toString(),
                            widget.controller.infoRoomModel!.room!
                                .feedbacks![index].review
                                .toString(),
                            widget.controller.infoRoomModel?.room!
                                    .feedbacks![index].rating!
                                    .toDouble() ??
                                5,
                            "assets/image/profile/profile1.jpg");
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20.0)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RelatedRoomsWidget extends StatelessWidget {
  const RelatedRoomsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final GetInfoRoomController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Related Post",
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  "See all",
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300),
                ),
              ]),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          height: 210.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.infoRoomModel?.relatedRooms!.length,
            itemBuilder: (BuildContext context, int index) {
              return _relatedPost(
                controller.infoRoomModel?.relatedRooms![index].imgs,
                controller.infoRoomModel?.relatedRooms![index].title,
                controller.infoRoomModel?.relatedRooms![index].city,
                controller.infoRoomModel?.relatedRooms![index].averageRating,
              );
            },
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 55.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF8F73F2),
                        Colors.deepPurpleAccent,
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)),
              child: const Center(
                child: Text(
                  "Book Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      fontFamily: "Sofia",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding:
              EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0, bottom: 10.0),
          child: Text(
            "Gallery",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: _width / 3,
                  width: _width / 3.1,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/image/room/room1.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                  child: Container(
                    height: _width / 3,
                    width: _width / 3.05,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/image/room/room2.jpg",
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  height: _width / 3,
                  width: _width / 3.1,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/image/room/room3.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: _width / 3,
                  width: _width / 3.1,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/image/room/room4.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: _width / 3,
                    width: _width / 3.05,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/image/room/room5.jpg",
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  height: _width / 3,
                  width: _width / 3.1,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/image/room/room6.jpg",
                          ),
                          fit: BoxFit.cover)),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => gallery()));
                    },
                    child: Container(
                      color: Colors.black54,
                      child: const Center(
                        child: Text("See More",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Sofia",
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class LocationHomeWidget extends StatelessWidget {
  const LocationHomeWidget({
    Key? key,
    required Set<Marker> markers,
  })  : _markers = markers,
        super(key: key);

  final Set<Marker> _markers;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding:
              EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Text(
            "Location",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              height: 190.0,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(40.7078523, -74.008981),
                  zoom: 13.0,
                ),
                markers: _markers,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 135.0, right: 60.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        PageRouteBuilder(pageBuilder: (_, __, ___) => maps()));
                  },
                  child: Container(
                    height: 35.0,
                    width: 95.0,
                    decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0))),
                    child: const Center(
                      child: Text("See Map",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Sofia")),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class DescrptionWidget extends StatelessWidget {
  const DescrptionWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final GetInfoRoomController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding:
              EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
          child: Text(
            "About",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 50.0),
          child: Text(
            controller.infoRoomModel!.room!.desc.toString(),
            style: TextStyle(
                fontFamily: "Sofia",
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class IconsAllWidget extends StatelessWidget {
  const IconsAllWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105.0,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: _infoCircle("assets/image/icon/wifi.png", "Free Wifi")),
            Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: _infoCircle("assets/image/icon/food.png", "Food")),
            Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: _infoCircle("assets/image/icon/clean.png", "Clean")),
            Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child:
                    _infoCircle("assets/image/icon/monitor.png", "Television")),
            Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child:
                    _infoCircle("assets/image/icon/swimming.png", "Swimming")),
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final GetInfoRoomController controller;
  MySliverAppBar({
    required this.expandedHeight,
    required this.controller,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          height: 50.0,
          width: double.infinity,
          color: Colors.white,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "App Name",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Gotik",
              fontWeight: FontWeight.w700,
              fontSize: (expandedHeight / 40) - (shrinkOffset / 40) + 18,
            ),
          ),
        ),
        Opacity(
          opacity: (1 - shrinkOffset / expandedHeight),
          child: Hero(
            tag: controller.infoRoomModel!.room!.sId.toString(),
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${MangeAPi.baseurl}/${controller.infoRoomModel!.room!.imgs.toString()}',
                  ),
                ),
                shape: BoxShape.rectangle,
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 130.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(0.0, 1.0),
                    stops: [0.0, 1.0],
                    colors: <Color>[
                      Color(0x00FFFFFF),
                      Color(0xFFFFFFFF),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Text(
                        controller.infoRoomModel!.room!.title.toString(),
                        style: TextStyle(
                            color: Colors.black87.withOpacity(0.65),
                            fontSize: 30.5,
                            fontFamily: "Sofia",
                            fontWeight: FontWeight.w700),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.location_on,
                          size: 14.0,
                          color: Colors.black26,
                        ),
                        Text(
                          controller.infoRoomModel!.room!.address.toString(),
                          style: TextStyle(
                              color: Colors.black26,
                              fontSize: 14.5,
                              fontFamily: "Popins",
                              fontWeight: FontWeight.w800),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, bottom: 10.0),
                    child: Container(
                      child: Text(
                        controller.infoRoomModel!.room!.price.toString(),
                        style: const TextStyle(
                            color: Color(0xFF8F73F2),
                            fontSize: 25.5,
                            fontFamily: "Popins",
                            fontWeight: FontWeight.w800),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
                Get.delete<GetInfoRoomController>();
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      ),
                      color: Colors.white70,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 36.0,
            )
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

Widget _photo(String image) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 110.0,
          width: 140.0,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              color: Colors.black12,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    color: Colors.black12.withOpacity(0.1),
                    spreadRadius: 2.0)
              ]),
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    ),
  );
}

Widget _relatedPost(
    String? image, String? title, String? location, String? ratting) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 110.0,
          width: 180.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image == null || image == ""
                    ? 'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202204/ezgif-sixteen_nine_161.jpg?size=948:533'
                    : "${MangeAPi.baseurl}/$image"),
                fit: BoxFit.cover,
              ),
              color: Colors.black12,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.0,
                    color: Colors.black12.withOpacity(0.1),
                    spreadRadius: 2.0)
              ]),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          title ?? 'titel',
          style: const TextStyle(
              fontFamily: "Sofia",
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
              color: Colors.black87),
        ),
        const SizedBox(
          height: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Icon(
              Icons.location_on,
              size: 18.0,
              color: Colors.black12,
            ),
            Text(
              location ?? 'Loction',
              style: const TextStyle(
                  fontFamily: "Sofia",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: Colors.black26),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.star,
              size: 18.0,
              color: Colors.yellow,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                ratting ?? '4',
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: "Sofia",
                    fontSize: 13.0),
              ),
            ),

            // Text("(233 Rating)",style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Sofia",fontSize: 11.0,color: Colors.black45),),
            const SizedBox(
              width: 35.0,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _infoCircle(String image, title) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
          height: 45.0,
          width: 45.0,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              color: Color(0xFFF0E5FB)),
          child: Center(
            child: Image.asset(
              image,
              height: 22.0,
              color: Colors.deepPurple,
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  fontFamily: "Sofia",
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                  fontSize: 11.0),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
    ],
  );
}

Widget _line() {
  return Container(
    height: 0.9,
    width: double.infinity,
    color: Colors.black12,
  );
}

Widget _buildRating(String date, String details, double rating, String image) {
  return ListTile(
    leading: Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(50.0))),
    ),
    title: Row(
      children: <Widget>[
        StarRating(
          size: 20.0,
          rating: rating,
          starCount: 5,
          color: Colors.yellow,
          onRatingChanged: (rating) {},
          borderColor: Colors.yellow,
        ),
        const SizedBox(width: 8.0),
        Text(
          date,
          style: const TextStyle(fontSize: 12.0),
        )
      ],
    ),
    subtitle: Text(
      details,
      style: const TextStyle(fontFamily: "Sofia", fontWeight: FontWeight.w300),
    ),
  );
}
