import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/theme/font_manager.dart';
import '../../../../constants/color.dart';
import '../../../../gen/assets.gen.dart';
import '../../widgets/single_profile_menu_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void navigateToSettings() {}

  void navigateToAchievements() {}

  void navigateToPaymentDetails() {}

  void navigateToWishList() {}

  void navigateToLearningRemainders() {}

  void navigateToBuyCourse() {}

  void navigateToMyCourses() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            leadingWidth: 30.w,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 18),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryColor,
            expandedHeight: 150,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  centerTitle: false,
                  title: AnimatedOpacity(
                    opacity: constraints.biggest.height <= 120 ? 1 : 0,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.primaryColor,
                              backgroundImage: AssetImage(
                                Assets.icons.b02.path,
                              ),
                            ),
                            Positioned(
                              bottom: 3,
                              right: 5,
                              child: Container(
                                height: 15.h,
                                width: 15.h,
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryOpacity,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    Assets.icons.editIcon.path,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'John Phil',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor,
                          Colors.black26,
                        ],
                        stops: [0.1, 1],
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.paddingOf(context).top,
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  Assets.icons.b02.path,
                                ),
                              ),
                              Positioned(
                                bottom: 3,
                                right: 5,
                                child: Container(
                                  height: 30.h,
                                  width: 30.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.8),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      Assets.icons.editIcon.path,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            'John Phils',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: size.width / 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => navigateToMyCourses(),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.icons.videoCall.path,
                                  color: AppColors.primaryFourElementText,
                                  width: 25.w,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'My Courses',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: FontSize.s14,
                                    color: AppColors.primaryFourElementText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => navigateToWishList(),
                            child: const Text(
                              'Wishlist',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: FontSize.s14,
                                color: AppColors.primaryFourElementText,
                              ),
                            ),
                          ),
                          const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.military_tech,
                                color: AppColors.primaryFourElementText,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Achievements',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: FontSize.s14,
                                  color: AppColors.primaryFourElementText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: ListView(
                      children: [
                        SingleProfileMenuTile(
                          icon: CupertinoIcons.settings,
                          title: 'Settings',
                          fnc: navigateToSettings,
                        ),
                        SingleProfileMenuTile(
                          icon: Icons.wallet,
                          title: 'Payment Details',
                          fnc: navigateToPaymentDetails,
                        ),
                        SingleProfileMenuTile(
                          icon: Icons.credit_card,
                          title: 'Buy course',
                          fnc: navigateToBuyCourse,
                        ),
                        SingleProfileMenuTile(
                          icon: CupertinoIcons.heart_fill,
                          title: 'Wishlist',
                          fnc: navigateToWishList,
                        ),
                        SingleProfileMenuTile(
                          icon: CupertinoIcons.alarm,
                          title: 'Learning Remainder',
                          fnc: navigateToWishList,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
