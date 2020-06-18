import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

class IntroPage extends StatefulWidget {
  final PageViewModel page;
  const IntroPage({Key key, @required this.page}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with AutomaticKeepAliveClientMixin<IntroPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.page.decoration.pageColor,
      decoration: widget.page.decoration.boxDecoration,
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.page.image != null)
              Expanded(
                flex: widget.page.decoration.imageFlex,
                child: Padding(
                  padding: widget.page.decoration.imagePadding,
                  child: widget.page.image,
                ),
              ),
            Expanded(
              flex: widget.page.decoration.bodyFlex,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: IntroContent(page: widget.page),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
