import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../cahe_images/image_cache.dart';

class BannerWidget extends StatefulWidget {
  final List bannerImages;
  final double height;
  final double width;
  final bool auto;
  final isDotVisible;
  const BannerWidget({
    Key key,
    this.bannerImages,
    this.height = 185,
    this.width = double.infinity,
    this.auto = true,
    this.isDotVisible = true,
  }) : super(key: key);
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            options: CarouselOptions(
              height: widget.height,
              aspectRatio: 2.0,
              viewportFraction: .8,

              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
            // CarouselOptions(height: 400.0),
            itemCount: widget.bannerImages.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top:10,left:10,right:10),
              child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                        width: widget.width,
                      child: ImageCahed(
                        image: widget.bannerImages[index],
                        
                      ),
                    ),
                  ),
            )),
        if (widget.isDotVisible)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.bannerImages.map((url) {
              int index = widget.bannerImages.indexOf(url);
              return Container(
                width: 8,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}


