import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Newsletter extends StatefulWidget {
  const Newsletter({Key? key}) : super(key: key);

  @override
  State<Newsletter> createState() => _NewsletterState();
}

class _NewsletterState extends State<Newsletter> with TickerProviderStateMixin {
  bool editTextEnable = false;
  TextEditingController keywordVal = TextEditingController();

  late AnimationController _controller;
  late AnimationController _controllerForSlide;
  late AnimationController _controllerForScale;
  late Animation<Offset> _slideAnim;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  void editText() {
    setState(() {
      editTextEnable = !editTextEnable;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _controllerForSlide = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _controllerForScale = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _fadeAnim = Tween<double>(begin: 0.6, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnim = Tween<double>(begin: 0.2, end: 1).animate(
        CurvedAnimation(parent: _controllerForScale, curve: Curves.easeInBack));

    _slideAnim = Tween<Offset>(begin: const Offset(-1.2, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _controllerForSlide, curve: Curves.easeInOut));

    super.initState();
    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => _controller.forward());

    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => _controllerForSlide.forward());

    Future.delayed(const Duration(milliseconds: 300))
        .then((value) => _controllerForScale.forward());
  }

  @override
  void dispose() {
    super.dispose();
    if (_controllerForSlide.isAnimating) {
      _controllerForSlide.stop();
    }
    _controller.dispose();
    _controllerForScale.dispose();
    _controllerForSlide.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var searchBarFontSize = 18.0; //SizeInfo.headerSubtitleSize;
    var searchIconSize = 20.0; //SizeInfo.searchIconSize;
    var searchBarHeight = 50.0; //SizeInfo.searchBarHeight;
    var topMargin = 24.0; //SizeInfo.menuTopMargin;
    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _fadeAnim,
        child: Container(
          key: widget.key,
          width: MediaQuery.of(context).size.width,
          height: searchBarHeight,
          margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
          child: SlideTransition(
            position: _slideAnim,
            child: GestureDetector(
              onTap: () {
                editText();
              },
              child: TextField(
                maxLines: 1,
                cursorWidth: 1,
                keyboardType: TextInputType.emailAddress,
                enabled: editTextEnable,
                onChanged: (newText) {
                  setState(() {
                    // noteProvider.keyword = newText;
                    // keywordVal.selection = TextSelection.fromPosition(
                    //     TextPosition(offset: keywordVal.text.length));
                  });
                  // noteProvider.getNoteByKeyword();
                },
                onEditingComplete: () {
                  editText();
                },
                cursorColor: Theme.of(context).textTheme.headline3!.color,
                controller: keywordVal,
                autofocus: true,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontSize: searchBarFontSize),
                decoration: InputDecoration(
                  hintText: 'newsletter',
                  hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: searchBarFontSize,
                      letterSpacing: 1,
                      color: Colors.grey),
                  suffixIcon: ScaleTransition(
                    scale: _scaleAnim,
                    child: FadeTransition(
                      opacity: _scaleAnim,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        onPressed: () {
                          // noteProvider.getNoteByKeyword();
                          editText();
                        },
                        icon: Icon(
                          FontAwesomeIcons.envelope,
                          size: searchIconSize,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
