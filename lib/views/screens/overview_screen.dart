import 'package:flutter/material.dart';
import 'package:task/utilities/app_colors.dart';
import 'package:task/utilities/app_constants.dart';
import 'package:task/utilities/font_manager.dart';
import 'package:task/views/screens/home.dart';

import '../../utilities/app_components.dart';
import '../../utilities/app_strings.dart';
import '../../utilities/size_config.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: SingleChildScrollView(
              child: SizeConfig.orientation == Orientation.portrait
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          height: AppSize.s35,
                        ),
                        buildStack(),
                        buildSizedBox(),
                        buildPadding(context),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Image.asset(
                          image2,
                          scale: 3,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: AppSize.s35,
                                ),
                                buildStack(),
                                buildSizedBox(),
                                buildPadding(context),
                                const SizedBox(
                                  height: AppSize.s20,
                                ),
                              ],
                            ),
                            Image.asset(
                              image2,
                              scale: 3,
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildPadding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: SizedBox(
        width: 150,
        height: 50,
        child: customElevatedButton(
          text: btnNext,
          fontSize: FontSize.s18,
          fontWeight: FontWightManager.semiBold,
          alignment: Alignment.center,
          textColor: white,
          backGroundColor: mainColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
        height: 300,
        width: 250,
        child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              image3,
              scale: 2.5,
            )));
  }

  Stack buildStack() {
    return Stack(
      children: [
        Align(alignment: Alignment.center, child: Image.asset(image5)),
        const SizedBox(
          height: AppSize.s4,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.screenHeight * 0.05,
              top: SizeConfig.screenHeight * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: intro,
                    style: bodyTextStyle.copyWith(fontSize: FontSize.s16),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Oranobot",
                        style: headerTextStyle.copyWith(
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  intro1,
                  style: bodyTextStyle.copyWith(fontSize: FontSize.s16),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  intro2,
                  style: bodyTextStyle.copyWith(fontSize: FontSize.s16),
                ),
              ),
              const SizedBox(height: AppSize.s8),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    text: "Say ",
                    style: bodyTextStyle.copyWith(fontSize: FontSize.s16),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Start ",
                        style: headerTextStyle.copyWith(
                          fontSize: FontSize.s16,
                        ),
                      ),
                      TextSpan(
                        text: intro3,
                        style: bodyTextStyle.copyWith(
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
