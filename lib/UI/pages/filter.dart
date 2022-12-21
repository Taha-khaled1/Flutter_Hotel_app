import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var sliderValue = 1.0;
  SfRangeValues _values = const SfRangeValues(100, 600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafa),
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: Icon(
            Icons.clear,
            color: Colors.grey[800],
          ),
        ),
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Filter",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("price (for 1 night)",
                        style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 40),
                    SfRangeSliderTheme(
                      data: SfRangeSliderThemeData(
                        tooltipBackgroundColor: Colors.transparent,
                        tooltipTextStyle: const TextStyle(
                          color: Colors.black,
                          height: 0,
                        ),
                      ),
                      child: SfRangeSlider(
                        min: 10,
                        max: 1000.0,
                        labelPlacement: LabelPlacement.betweenTicks,
                        edgeLabelPlacement: EdgeLabelPlacement.auto,
                        shouldAlwaysShowTooltip: true,
                        tooltipShape: const SfPaddleTooltipShape(),
                        tooltipTextFormatterCallback:
                            (dynamic actualValue, String formattedText) {
                          return "${double.parse(actualValue.toString()).round()}\$";
                        },
                        values: _values,
                        interval: 20.0,
                        // showTicks: true,
                        // showLabels: true,
                        stepSize: 1,
                        minorTicksPerInterval: 1,
                        onChanged: (SfRangeValues values) {
                          setState(() {
                            _values = values;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "popular",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            title: const Text("free breakfast"),
                            onChanged: (val) {},
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            title: const Text("free barking"),
                            onChanged: (val) {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            title: const Text("pool"),
                            onChanged: (val) {},
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            title: const Text("pet friendly"),
                            onChanged: (val) {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value: false,
                            title: const Text("free wifi"),
                            onChanged: (val) {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Distance from city center",
                        style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 40),
                    SfSliderTheme(
                      data: SfSliderThemeData(
                        tooltipBackgroundColor: Colors.transparent,
                        tooltipTextStyle: const TextStyle(
                          color: Colors.black,
                          height: 0,
                        ),
                      ),
                      child: SfSlider(
                        min: 1,
                        max: 20,
                        labelPlacement: LabelPlacement.betweenTicks,
                        edgeLabelPlacement: EdgeLabelPlacement.auto,
                        shouldAlwaysShowTooltip: true,
                        tooltipShape: const SfPaddleTooltipShape(),
                        tooltipTextFormatterCallback:
                            (dynamic actualValue, String formattedText) {
                          return "less than ${double.parse(actualValue.toString()).round()} km";
                        },
                        value: sliderValue,
                        interval: 20.0,
                        // showTicks: true,
                        // showLabels: true,
                        stepSize: 1,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic values) {
                          setState(() {
                            sliderValue = values;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsetsDirectional.only(start: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(start: 8),
                      child: Text("Type of Accommodation",
                          style: TextStyle(fontSize: 16)),
                    ),
                    ListTileSwitch(
                      contentPadding: const EdgeInsetsDirectional.only(
                          start: 2, end: 16, top: 8, bottom: 8),
                      value: false,
                      // leading: Icon(CupertinoIcons.battery_empty, size: 0,),
                      onChanged: (value) async {},
                      visualDensity: VisualDensity.comfortable,
                      switchType: SwitchType.cupertino,
                      switchActiveColor: Colors.blue,
                      title: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 16, end: 0),
                        child: Text("All"),
                      ),
                    ),
                    ListTileSwitch(
                      contentPadding: const EdgeInsetsDirectional.only(
                          start: 2, end: 16, top: 8, bottom: 8),
                      value: false,
                      // leading: Icon(CupertinoIcons.battery_empty, size: 0,),
                      onChanged: (value) async {},
                      visualDensity: VisualDensity.comfortable,
                      switchType: SwitchType.cupertino,
                      switchActiveColor: Colors.blue,
                      title: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 16, end: 0),
                        child: Text("Apartment"),
                      ),
                    ),
                    ListTileSwitch(
                      contentPadding: const EdgeInsetsDirectional.only(
                          start: 2, end: 16, top: 8, bottom: 8),
                      value: false,
                      // leading: Icon(CupertinoIcons.battery_empty, size: 0,),
                      onChanged: (value) async {},
                      visualDensity: VisualDensity.comfortable,
                      switchType: SwitchType.cupertino,
                      switchActiveColor: Colors.blue,
                      title: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 16, end: 0),
                        child: Text("Home"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  onPressed: () async {},
                  child: const Text("Apply"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
