import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/color.dart';
import '../../../../gen/assets.gen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                                  color:
                                      AppColors.secondaryColor.withOpacity(0.8),
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
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
