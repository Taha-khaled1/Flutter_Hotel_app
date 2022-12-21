import 'package:flutter/material.dart';
import 'package:hotelbooking/Library/Expanded/ExpandedDetailRatting.dart';
import 'package:hotelbooking/Library/Expanded/ExpandedDetailReviews.dart';
import 'package:hotelbooking/Library/SupportingLibrary/Ratting/Rating.dart';

import '../../../../Library/Ratting_Bar/ratting.dart';

class reviewDetail1 extends StatefulWidget {
  reviewDetail1({Key? key}) : super(key: key);

  @override
  _reviewDetail1State createState() => _reviewDetail1State();
}

class _reviewDetail1State extends State<reviewDetail1> {
  @override
  double rating = 3.5;
  int starCount = 5;

  /// Custom Text for Detail title
  static var _detailText = const TextStyle(
      fontFamily: "Gotik",
      color: Colors.black54,
      letterSpacing: 0.3,
      wordSpacing: 0.5);

  Widget build(BuildContext context) {
    var _appBar = AppBar(
      title: const Text("Reviews"),
      centerTitle: true,
      leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          )),
      elevation: 0.0,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20.0),
                  child: Text(
                    "Review",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: "Popins",
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ratingbar(
                              size: 25.0,
                              starCount: 5,
                              color: Colors.yellow,
                            ),
                            const SizedBox(width: 5.0),
                            const Text('8 Reviews')
                          ]),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                  child: _line(),
                ),
                ListTile(
                  leading: Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/image/profile/profile1.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  ),
                  title: Row(
                    children: <Widget>[
                      ratingbar(
                        size: 20.0,
                        starCount: starCount,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        "18 November 2019",
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                  ),
                  subtitle: ExpansionTileReview(
                    title: Text(
                      "Item delivered in good condition. I will recommend to other buyer.",
                      style: _detailText,
                    ),
                    children: [
                      const SizedBox(height: 10.0),
                      Text(
                        "Very Recommended item i love it very love it",
                        style: _detailText,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Item delivered in good condition. I will recommend to other buyer.",
                        style: _detailText,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                  child: _line(),
                ),
                _buildRating("18 Nov 2018",
                    "Item delivered in good condition. I will recommend to other buyer.",
                    (rating) {
                  setState(() {
                    this.rating = rating;
                  });
                }, "assets/image/profile/profile1.jpg"),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                  child: _line(),
                ),
                _buildRating("18 Nov 2018",
                    "Item delivered in good condition. I will recommend to other buyer.",
                    (rating) {
                  setState(() {
                    this.rating = rating;
                  });
                }, "assets/image/profile/profile3.jpg"),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                  child: _line(),
                ),
                _buildRating("18 Nov 2018",
                    "Item delivered in good condition. I will recommend to other buyer.",
                    (rating) {
                  setState(() {
                    this.rating = rating;
                  });
                }, "assets/image/profile/profile4.jpg"),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                  child: _line(),
                ),
                _buildRating("18 Nov 2018",
                    "Item delivered in good condition. I will recommend to other buyer.",
                    (rating) {
                  setState(() {
                    this.rating = rating;
                  });
                }, "assets/image/profile/profile5.jpg"),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                  child: _line(),
                ),
                _buildRating("18 Nov 2018",
                    "Item delivered in good condition. I will recommend to other buyer.",
                    (rating) {
                  setState(() {
                    this.rating = rating;
                  });
                }, "assets/image/profile/profile6.jpg"),
                const SizedBox(
                  height: 10.0,
                ),
                _line(),
                Column(
                  children: <Widget>[
                    ExpansionTileCustomRatting(
                      title: _buildRating("18 Nov 2018",
                          "Item delivered in good condition. I will recommend to other buyer.",
                          (rating) {
                        setState(() {
                          this.rating = rating;
                        });
                      }, "assets/image/profile/profile1.jpg"),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 15.0, bottom: 7.0),
                          child: _line(),
                        ),
                        _buildRating("18 Nov 2018",
                            "Item delivered in good condition. I will recommend to other buyer.",
                            (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }, "assets/image/profile/profile1.jpg"),
                      ],
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRating(
      String date, String details, Function changeRating, String image) {
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
            rating: 3.5,
            starCount: 5,
            color: Colors.yellow,
            onRatingChanged: changeRating as void Function(double),
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
        style: _detailText,
      ),
    );
  }
}

Widget _line() {
  return Container(
    height: 0.9,
    width: double.infinity,
    color: Colors.black12,
  );
}
