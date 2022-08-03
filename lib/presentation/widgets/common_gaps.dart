import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Blank space between items in row
const hGap2 = SizedBox(width: 2);
const hGap4 = SizedBox(width: 4);
const hGap5 = SizedBox(width: 5);
const hGap6 = SizedBox(width: 6);
const hGap8 = SizedBox(width: 8);
const hGap10 = SizedBox(width: 10);
const hGap12 = SizedBox(width: 12);
const hGap15 = SizedBox(width: 15);
const hGap16 = SizedBox(width: 16);
const hGap18 = SizedBox(width: 18);
const hGap22 = SizedBox(width: 22);
const hGap24 = SizedBox(width: 24);
const hGap32 = SizedBox(width: 32);
const hGap40 = SizedBox(width: 40);
const hGap50 = SizedBox(width: 50);
const hGap80 = SizedBox(width: 80);

/// Blank space between items in column
const vGap0 = SizedBox(height: 0);
const vGap2 = SizedBox(height: 2);
const vGap4 = SizedBox(height: 4);
const vGap5 = SizedBox(height: 5);
const vGap6 = SizedBox(height: 6);
const vGap8 = SizedBox(height: 8);
const vGap10 = SizedBox(height: 10);
const vGap12 = SizedBox(height: 12);
const vGap15 = SizedBox(height: 15);
const vGap16 = SizedBox(height: 16);
const vGap20 = SizedBox(height: 20);
const vGap22 = SizedBox(height: 22);
const vGap24 = SizedBox(height: 24);
const vGap26 = SizedBox(height: 26);
const vGap30 = SizedBox(height: 30);
const vGap32 = SizedBox(height: 32);
const vGap40 = SizedBox(height: 40);
const vGap44 = SizedBox(height: 44);
const vGap46 = SizedBox(height: 46);
const vGap50 = SizedBox(height: 50);
const vGap55 = SizedBox(height: 55);
const vGap60 = SizedBox(height: 60);
const vGap70 = SizedBox(height: 70);
const vGap80 = SizedBox(height: 80);
const vGap100 = SizedBox(height: 100);
const vGap200 = SizedBox(height: 200);

/// Vertical line
const vLine = SizedBox(
  child: DecoratedBox(
    decoration: BoxDecoration(color: Colors.grey),
  ),
  height: 1,
  width: double.infinity,
);

/// Horizontal line
const hLine = SizedBox(
  child: DecoratedBox(
    decoration: BoxDecoration(color: Colors.grey),
  ),
  height: double.infinity,
  width: 1,
);

/// Space between items in column, calculate by percent
SizedBox hGapPercent([double percent = 0.1]) =>
    SizedBox(width: ScreenUtil().screenWidth * percent);

/// Space between items in row, calculate by percent
SizedBox vGapPercent([double percent = 0.1]) =>
    SizedBox(height: ScreenUtil().screenHeight * percent);

SizedBox statusBarSize() => SizedBox(height: ScreenUtil().statusBarHeight);

const line = Divider();
const empty = SizedBox.shrink();
