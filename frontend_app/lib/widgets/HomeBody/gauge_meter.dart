import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget gauge_meter(int complete_value) {
  return Stack(
    fit: StackFit.expand,
    children: [
      SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            showTicks: false,
            showLabels: false,
            minimum: 0,
            maximum: 100,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: 0,
                endValue: complete_value.toDouble(),
                color: colorPositive,
                startWidth: 3.h,
                endWidth: 3.h,
                label: '$complete_value%',
                labelStyle: GaugeTextStyle(
                  color: textWhite,
                  fontFamily: 'Montserrat',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GaugeRange(
                startValue: complete_value.toDouble(),
                endValue: 100,
                color: colorNegative,
                startWidth: 3.h,
                endWidth: 3.h,
                label: '${100 - complete_value}%',
                labelStyle: GaugeTextStyle(
                  color: textWhite,
                  fontFamily: 'Montserrat',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            annotations: [
              GaugeAnnotation(
                widget: Container(
                  height: 10.h,
                  width: 22.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: textWhite, width: 0.5.h),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Center(
                    child: (complete_value == 100)
                        ? Text(
                            'No Due',
                            style: h2TextStyle.copyWith(color: textWhite),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            '$complete_value',
                            style: h1TextStyle.copyWith(color: textWhite),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
