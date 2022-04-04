import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../bottom_button_bar.dart';
import '../button.dart';

class MultiStepPage {
  Widget widget;
  KkButton? leftButton;
  KkButton? rightButton;

  MultiStepPage({required this.widget, this.leftButton, this.rightButton});
}

class MultiStepPageWidget extends StatelessWidget {
  final MultiStepPage page;
  final double? progressValue;

  const MultiStepPageWidget({Key? key, required this.page, this.progressValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: page.widget,
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: KkButton.text(
            "Previous",
            onPressed: () {},
            textColor: Colors.red,
          )),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              child: KkButton.small(
                "Next",
                onPressed: () {},
                isLoading: false,
                icon: FeatherIcons.arrowRightCircle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? _getButtonsRow() {
    return BottomButtonBar(
      leftButton: page.leftButton,
      rightButton: page.rightButton,
      progressValue: progressValue,
      backgroundColor: Colors.white,
    );
  }
}

class MultiStepScreen extends StatefulWidget {
  final List<MultiStepPage> pages;
  final int initialPage;
  final bool? showProgressIndicator;

  MultiStepScreen(
      {Key? key,
      required this.pages,
      this.initialPage = 0,
      this.showProgressIndicator = false})
      : super(key: key);

  @override
  _MultiStepScreenState createState() => _MultiStepScreenState(pages);
}

class _MultiStepScreenState extends State<MultiStepScreen> {
  int _currentPage = 0;
  List<MultiStepPage> pages;

  _MultiStepScreenState(this.pages);

  @override
  void initState() {
    _initButons();
    super.initState();
  }

  void _initButons() {
    for (var page in pages) {
      if (page.leftButton != null) {
        KkButton currentButton = page.leftButton!;
        page.leftButton = KkButton.cloneButton(
          currentButton,
          () {
            currentButton.onPressed!();
            navigateToPreviousPage();
          },
        );
      }

      if (page.rightButton != null) {
        KkButton currentButton = page.rightButton!;
        page.rightButton = KkButton.cloneButton(
          currentButton,
          () {
            currentButton.onPressed!();
            navigateToNextPage();
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiStepPageWidget(
      page: pages[_currentPage],
      progressValue: widget.showProgressIndicator == true
          ? (_currentPage + 1) / widget.pages.length
          : null,
    );
  }

  void navigateToNextPage() {
    if (_currentPage == widget.pages.length - 1) return;

    setState(() {
      _currentPage += 1;
    });
  }

  void navigateToPreviousPage() {
    if (_currentPage == 0) return;

    setState(() {
      _currentPage -= 1;
    });
  }
}
