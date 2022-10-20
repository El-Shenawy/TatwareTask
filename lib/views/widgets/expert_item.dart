import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/utilities/app_colors.dart';
import 'package:task/utilities/app_constants.dart';
import 'package:task/utilities/font_manager.dart';

import '../../utilities/app_components.dart';
import '../../utilities/size_config.dart';

class ExpertsItem extends StatelessWidget {
  const ExpertsItem(
      {Key? key,
      required this.expertImage,
      required this.expertName,
      required this.expertSpeciality,
      required this.rate})
      : super(key: key);
  final String expertImage, expertName, expertSpeciality;
  final double rate;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: customOutLineBorderContainer(
        height: AppSize.s35,
        child: Container(
          decoration: boxDecoration(
            radius: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0)),
                      child: Image.asset(expertImage),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.star,
                          color: orange,
                        ),
                      ),
                      Text(
                        "($rate)",
                        style: bodyTextStyle.copyWith(
                            fontSize: FontSize.s12,
                            color: lightGray,
                            fontWeight: FontWightManager.light),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: lightGray,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      expertName,
                      style: bodyTextStyle.copyWith(fontSize: FontSize.s14),
                    ),
                    const SizedBox(height: AppSize.s4),
                    Text(expertSpeciality,
                        style: bodyTextStyle.copyWith(
                            fontSize: FontSize.s12, color: gray)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
