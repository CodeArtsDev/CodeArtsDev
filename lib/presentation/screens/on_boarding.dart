import 'package:flutter/material.dart';
import 'package:kalyana_gadiya/cakit/widgets/on_boarding/on_boarding.dart';
import 'package:kalyana_gadiya/cakit/widgets/on_boarding/single_page.dart';
import 'package:kalyana_gadiya/cakit/widgets/text.dart';
import 'package:kalyana_gadiya/presentation/widgets/core/button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: CaOnBoardingWidget(
        pages: [
          PageViewModel(
            Colors.white,
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  width: mediaQuery.size.width,
                  height: mediaQuery.size.height,
                  child: Image.network(
                    'https://picsum.photos/seed/picsum/200/300',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 200),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: CaText.h6(
                              "I Love you Bangaram",
                              color: Colors.white,
                              fontWeight: 800,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: mediaQuery.size.width - 100,
                        child: KkButton.rounded(
                          "Login with love",
                          onPressed: () {},
                          icon: Icons.email,
                          hasRadius: true,
                          backgroundColor: Colors.white,
                          textColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: mediaQuery.size.width - 100,
                        child: KkButton.rounded(
                          "Login with smile",
                          onPressed: () {},
                          icon: Icons.phone,
                          hasRadius: true,
                          backgroundColor: Colors.white,
                          textColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: mediaQuery.size.width - 100,
                        child: KkButton.rounded(
                          "Login with affection",
                          onPressed: () {},
                          icon: Icons.g_mobiledata,
                          hasRadius: true,
                          backgroundColor: Colors.white,
                          textColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: mediaQuery.size.width - 100,
                        child: KkButton.rounded(
                          "Login with Apple",
                          onPressed: () {},
                          icon: Icons.apple,
                          hasRadius: true,
                          backgroundColor: Colors.white,
                          textColor: Colors.blue,
                          borderColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          PageViewModel(Colors.white, Text("Page 2")),
          PageViewModel(Colors.white, Text("Page 3"))
        ],
        selectedIndicatorColor: Colors.blue,
        unSelectedIndicatorColor: Colors.black,
        skipWidget: Row(
          children: [
            CaText.caption("Don't have an account"),
            KkButton.textSmall(
              "Sign UP",
              onPressed: () {},
            ),
          ],
        ),
        doneWidget: Container(),
      ),
    );
  }
}
