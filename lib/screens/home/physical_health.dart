import 'package:flutter/material.dart';
import 'package:swastha/utils/styles.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PhysicalHealth extends StatelessWidget {
  const PhysicalHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: SafeArea(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Physical Health',
            style: TextStyle(
                color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: kGrey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: kGrey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 2,
                          width: MediaQuery.of(context).size.width / 2,
                          child: SfRadialGauge(
                              enableLoadingAnimation: true,
                              axes: <RadialAxis>[
                                RadialAxis(
                                    startAngle: 90,
                                    endAngle: 90,
                                    canScaleToFit: false,
                                    minimum: 0,
                                    maximum: 100.0,
                                    showLabels: false,
                                    showTicks: false,
                                    axisLineStyle: AxisLineStyle(
                                      thickness: 0.1,
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: Colors.blue.withOpacity(0.3),
                                      thicknessUnit: GaugeSizeUnit.factor,
                                    ),
                                    pointers: const <GaugePointer>[
                                      RangePointer(
                                        value: 50,
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: 0.1,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: Colors.blue,
                                      ),
                                    ],
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                        positionFactor: 0.1,
                                        angle: 90,
                                        widget: Text('50/100',
                                            style: kHeadingTextStyle.copyWith(
                                                color: Colors.blue,
                                                fontSize: 24.0)),
                                      )
                                    ]),
                                RadialAxis(
                                  startAngle: 90,
                                  endAngle: 90,
                                  radiusFactor: .80,
                                  canScaleToFit: false,
                                  minimum: 0,
                                  maximum: 100.0,
                                  showLabels: false,
                                  showTicks: false,
                                  axisLineStyle: AxisLineStyle(
                                    thickness: 0.1,
                                    cornerStyle: CornerStyle.bothCurve,
                                    color: Colors.green.withOpacity(0.3),
                                    thicknessUnit: GaugeSizeUnit.factor,
                                  ),
                                  pointers: const <GaugePointer>[
                                    RangePointer(
                                      value: 75,
                                      cornerStyle: CornerStyle.bothCurve,
                                      width: 0.1,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      color: Colors.green,
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
