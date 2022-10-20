import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/models/experts.dart';
import 'package:task/utilities/app_colors.dart';
import 'package:task/utilities/app_components.dart';
import 'package:task/utilities/app_constants.dart';
import 'package:task/utilities/font_manager.dart';
import 'package:task/views/screens/chat_screen.dart';
import '../widgets/expert_item.dart';

import '../../bloc/expert_bloc.dart';
import '../../models/contacts.dart';
import '../../utilities/app_strings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loadingData = true;
  List<ExpertItem>? expertItems;
  @override
  Widget build(BuildContext context) {
    const minHeight = kToolbarHeight;
    final windowHeight = MediaQuery.of(context).size.height - minHeight;
    final minSize = minHeight / windowHeight;
    return BlocListener<ExpertBloc, ExpertState>(
      listener: (context, state) {
        if (state is ExpertInitial) {
          loadingData = true;
        } else if (state is ExpertPageLoadedState) {
          expertItems = state.expertData!.expertItems;
          loadingData = false;
        }
      },
      child: BlocBuilder<ExpertBloc, ExpertState>(
        builder: (context, state) {
          print("expert page state: $state");

          return Scaffold(
            backgroundColor: white,
            appBar: AppBar(
              backgroundColor: white,
              leading: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Image.asset(appProfile)),
              title: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Image.asset(
                    icon,
                    scale: AppSize.s1_5,
                  )),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p16),
                      child: Image.asset(searchIcon)),
                ),
              ],
              centerTitle: true,
              elevation: 1.0,
            ),
            body: loadingData
                ? const Center(
                    child: Center(
                    child: CircularProgressIndicator(),
                  ))
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p16, right: AppPadding.p16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    recommended,
                                    style: bodyTextStyle.copyWith(
                                        fontSize: AppSize.s16),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_horiz,
                                        color: lightGray,
                                        size: AppSize.s28,
                                      ))
                                ],
                              ),
                            ),
                            Stack(
                              overflow: Overflow.visible,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7,
                                          mainAxisSpacing: 1,
                                          crossAxisSpacing: 1,
                                        ),
                                        itemCount: expertItems!.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return ExpertsItem(
                                            expertImage:
                                                expertItems![index].imageUrl!,
                                            rate: expertItems![index].rate!,
                                            expertName:
                                                expertItems![index].name!,
                                            expertSpeciality:
                                                expertItems![index].speciality!,
                                          );
                                        }),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p16, right: AppPadding.p16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    onlineExperts,
                                    style: bodyTextStyle.copyWith(
                                        fontSize: AppSize.s16),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_horiz,
                                        color: lightGray,
                                        size: AppSize.s28,
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: chatsData.length,
                                itemBuilder: (context, index) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              AppPadding.p8),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ChatScreen()),
                                              );
                                            },
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  chatsData[index].image),
                                              radius: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          chatsData[index].name,
                                          style: bodyTextStyle.copyWith(
                                              fontSize: AppSize.s12,
                                              color: gray),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DraggableScrollableSheet(
                        initialChildSize: minSize,
                        minChildSize: minSize,
                        builder: (_, controller) {
                          return LayoutBuilder(builder: (_, box) {
                            print('minHeight: $minHeight');
                            print('height: ${box.maxHeight}');
                            return Container(
                              color: white,
                              child:
                                  ListView(controller: controller, children: [
                                Image.asset(
                                  rect,
                                  scale: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p16,
                                      right: AppPadding.p16),
                                  child: customOutLineBorderContainer(
                                    height: 20,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppPadding.p16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                tech,
                                                scale: 3,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: AppPadding.p16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Information Technology",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s14),
                                                    ),
                                                    Text(
                                                      "23 Experts",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s12,
                                                              color:
                                                                  colorGrayText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: darkGray,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.s16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p16,
                                      right: AppPadding.p16),
                                  child: customOutLineBorderContainer(
                                    height: 20,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppPadding.p16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                supply,
                                                scale: 3,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: AppPadding.p16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Supply Chain",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s14),
                                                    ),
                                                    Text(
                                                      "12 Experts",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s12,
                                                              color:
                                                                  colorGrayText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: darkGray,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.s16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p16,
                                      right: AppPadding.p16),
                                  child: customOutLineBorderContainer(
                                    height: 20,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppPadding.p16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                security,
                                                scale: 3,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: AppPadding.p16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Security",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s14),
                                                    ),
                                                    Text(
                                                      "14 Experts",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s12,
                                                              color:
                                                                  colorGrayText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: darkGray,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.s16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p16,
                                      right: AppPadding.p16),
                                  child: customOutLineBorderContainer(
                                    height: 20,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppPadding.p16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                hr,
                                                scale: 3,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: AppPadding.p16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Human Resource",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s14),
                                                    ),
                                                    Text(
                                                      "8 Experts",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s12,
                                                              color:
                                                                  colorGrayText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: darkGray,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.s16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p16,
                                      right: AppPadding.p16),
                                  child: customOutLineBorderContainer(
                                    height: 20,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppPadding.p16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                immigration,
                                                scale: 3,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: AppPadding.p28),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Immigration",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s14),
                                                    ),
                                                    Text(
                                                      "18 Experts",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s12,
                                                              color:
                                                                  colorGrayText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: darkGray,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSize.s16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppPadding.p16,
                                      right: AppPadding.p16),
                                  child: customOutLineBorderContainer(
                                    height: 20,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppPadding.p16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                translation,
                                                scale: 3,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: AppPadding.p16),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Translation",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s14),
                                                    ),
                                                    Text(
                                                      "3 Experts",
                                                      style: bodyTextStyle
                                                          .copyWith(
                                                              fontSize:
                                                                  FontSize.s12,
                                                              color:
                                                                  colorGrayText),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            color: darkGray,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            );
                          });
                        },
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
