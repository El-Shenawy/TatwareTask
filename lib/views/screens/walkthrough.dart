import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/utilities/app_colors.dart';
import 'package:task/utilities/app_components.dart';
import 'package:task/utilities/app_constants.dart';
import 'package:task/views/screens/overview_screen.dart';

import '../../utilities/app_strings.dart';
import '../../utilities/font_manager.dart';
import '../../utilities/size_config.dart';

class WalkThroughPage extends StatefulWidget {
  const WalkThroughPage({Key? key}) : super(key: key);

  @override
  WalkThroughPageState createState() => WalkThroughPageState();
}

class WalkThroughPageState extends State<WalkThroughPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const <Widget>[
          WalkThrough(),
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  const WalkThrough({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(image1),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                oranos,
                scale: 2,
              ),
              const SizedBox(height: AppSize.s14),
              Text(
                appTitle1,
                style: bodyTextStyle.copyWith(
                    color: gray,
                    fontSize: AppSize.s14,
                    fontWeight: FontWightManager.semiBold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.p16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppPadding.p18),
                child: SizedBox(
                  width: SizeConfig.orientation == Orientation.landscape
                      ? 150
                      : SizeConfig.screenWidth * 0.85,
                  height: SizeConfig.orientation == Orientation.landscape
                      ? 50
                      : SizeConfig.screenHeight * 0.06,
                  child: customElevatedButton(
                    text: btnText,
                    fontSize: FontSize.s18,
                    fontWeight: FontWightManager.semiBold,
                    alignment: Alignment.center,
                    textColor: white,
                    backGroundColor: mainColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OverviewScreen()),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    lblDonHaveAnAccount,
                    style: bodyTextStyle.copyWith(
                        color: black,
                        fontSize: AppSize.s12,
                        fontWeight: FontWightManager.regular),
                  ),
                  Text(
                    lblSignUp,
                    style: bodyTextStyle.copyWith(
                        color: mainColor,
                        fontSize: AppSize.s12,
                        fontWeight: FontWightManager.regular),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Image.asset(
                image2,
                scale: 3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
