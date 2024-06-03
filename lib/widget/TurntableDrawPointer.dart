import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../dataBean/SongDataList.dart';

class TurntableDrawPointer extends CustomPainter {
  List<SongData> songData;

  TurntableDrawPointer(this.songData);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3.0
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);

    paint.color = Colors.grey;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    nullValueText(canvas, size);

    double startAngles = 0;
    double angle = 360 / songData.length;

    //畫扇形
    for (int i = 0; i < songData.length; i++) {
      //繪製扇型
      drawArc(rect, size, paint, canvas, songData[i].color, startAngles, angle,
          true);

      //繪製扇型邊線 ( 1 項以上才加邊線 )
      if (songData.length > 1) {
        drawArcDivider(canvas, paint, size, startAngles, angle);
      }

      //填上項目文字
      drawText(songData[i].text, canvas, size, startAngles, angle);

      startAngles += angle;
    }
  }

  double radians(double degrees) => degrees * (pi / 180.0);

  void nullValueText(Canvas canvas, Size size) {
    if (songData.length == 0) {
      final textSpan = TextSpan(
        text: "no selection item",
        style: TextStyle(color: Colors.black, fontSize: 15),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(minWidth: 0, maxWidth: size.width);

      final offset = Offset(size.width / 2 - textPainter.width / 2,
          size.height / 2 - textPainter.height / 2);
      textPainter.paint(canvas, offset);
    }
  }

  void drawArc(Rect rect, Size size, Paint paint, Canvas canvas, Color color,
      double startAngles, double angle, bool isDrawArcLine) {
    if (isDrawArcLine) {
      Rect rectItem = Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: (size.width / 2) + 2);
      paint.color = Colors.white24;
      canvas.drawArc(
          rectItem, radians(startAngles), radians(angle), true, paint);
    }

    paint.color = color;
    canvas.drawArc(rect, radians(startAngles), radians(angle), true, paint);
  }

  void drawArcDivider(Canvas canvas, Paint paint, Size size, double startAngles,
      double angles) {
    canvas.save(); //這裏先把canvas保存個副本，待會移動旋轉完 好還原
    paint.color = paint.color = Colors.white70;
    Offset linePoint1 = const Offset(0, 0);
    Offset linePoint2 = Offset(size.width / 2, 0);

    canvas.translate(size.width / 2, size.height / 2); //先把canvas移動到中新

    //繪製第一條線
    canvas.rotate(radians(startAngles)); //先把canvas移動到中心點轉動到起始角度
    canvas.drawLine(linePoint1, linePoint2, paint);

    //繪製第二條線
    canvas.rotate(radians(angles)); //canvas移動到中心點轉動結束角度
    canvas.drawLine(linePoint1, linePoint2, paint);

    canvas.restore(); //畫完後重置 畫布
  }

  void drawText(String text, Canvas canvas, Size size, double startAngles,
      double angles) {
    canvas.save(); //這裏先把canvas保存個副本，待會移動旋轉完 好還原
    const textStyle = TextStyle(
      color: Colors.white10,
      fontSize: 15,
      fontStyle: FontStyle.italic,
    );

    // 新建一個段落建造器，然後將文字基本信息填入;
    ParagraphBuilder pb = ParagraphBuilder(ParagraphStyle(
      textAlign: TextAlign.left,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      fontSize: 15.0,
    ));
    // pb.pushStyle(textStyle);
    pb.addText(text);
    // 設置文本的寬度約束
    ParagraphConstraints pc = ParagraphConstraints(width: 400);
    // 這裏需要先layout,將寬度約束填入，否則無法繪製
    Paragraph paragraph = pb.build()..layout(pc);

    // 文字左上角起始點
    Offset offset =
        Offset(60, 0 - paragraph.height / 2); //由於沒找到算文本寬度的方法，這裏文本x軸的七點模擬寫成 了60。

    canvas.translate(size.width / 2, size.height / 2); //先把canvas移動到中心點
    double roaAngle = radians(startAngles + (angles / 2));
    canvas.rotate(roaAngle); //再將畫布旋轉一定角度，具體這個角度怎麼來的， 稍微琢磨一下就明白了

    canvas.drawParagraph(paragraph, offset);
    canvas.restore(); //畫完後重置 畫布
  }
}
