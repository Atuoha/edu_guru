import 'package:cool_alert/cool_alert.dart';
import 'package:edu_guru/business_logic/carousel_slider/carousel_slider_cubit.dart';
import 'package:edu_guru/business_logic/course_list/course_list_cubit.dart';
import 'package:edu_guru/constants/constants.dart';
import 'package:edu_guru/constants/enums/processing_status.dart';
import 'package:edu_guru/pages/main/application/courses/course_details.dart';
import 'package:edu_guru/pages/main/components/course_category_section.dart';
import 'package:edu_guru/pages/main/components/search_section.dart';
import 'package:edu_guru/pages/main/widgets/kcool_alert.dart';
import 'package:edu_guru/pages/main/widgets/loading.dart';
import 'package:edu_guru/repositories/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';
import '../../../common/models/user.dart';
import '../../../constants/color.dart';
import '../components/drawer.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/drawer_opener.dart';
import '../widgets/kdot_indicator.dart';
import '../widgets/row_text.dart';
import '../widgets/single_grid_course.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  UserItem userItem = UserItem();

  void setFilter() {
    // Todo set filter
  }

  void seeAllCourses() {
    // Todo see all courses
  }

  void carouselContinueFnc() {
    // Todo carousel continue fnc
  }

  @override
  void initState() {
    super.initState();
    // homeRepo = HomeRepo(context: context);
    // homeRepo.init();
    HomeRepo(context: context).init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userItem = HomeRepo(context: context).userItem;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 40.w,
          leading: drawerOpener(context: context),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Container(
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('${userItem.avatar}'),
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: const DrawerComponent(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18.0,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello ${userItem.name}!',
                          style: TextStyle(
                            fontSize: 23.sp,
                            color: AppColors.primaryThreeElementText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Welcome to Eduguru',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SearchSection(
                      size: size,
                      searchController: searchController,
                      setFilter: setFilter,
                    ),
                  ).redacted(
                    context: context,
                    redact: true,
                    configuration: RedactedConfiguration(
                      animationDuration: const Duration(
                        milliseconds: 800,
                      ), //default
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<CarouselSliderCubit, CarouselSliderState>(
                    builder: (context, state) => Column(
                      children: [
                        KCarouselSlider(
                          carouselSliders: state.carouselSliders,
                          setCurrentCarouselIndex: context
                              .read<CarouselSliderCubit>()
                              .setCurrentCarouselIndex,
                          carouselContinueFnc: carouselContinueFnc,
                        ),
                        const SizedBox(height: 10),
                        KDotsIndicator(
                          currentCarouselIndex: state.currentCarouselIndex,
                          carouselSliders: state.carouselSliders,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RowText(
                          title: 'Select your course',
                          actionText: 'See all',
                          actionHandler: seeAllCourses,
                        ),
                        const SizedBox(height: 20),
                        CourseCategorySection(size: size),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              sliver: BlocConsumer<CourseListCubit, CourseListState>(
                listener: (context, state) {
                  if (state.processingStatus == ProcessingStatus.waiting ||
                      state.processingStatus == ProcessingStatus.initial) {
                    const Center(
                      child: LoadingWidget(
                        size: 50,
                      ),
                    );
                  } else if (state.processingStatus == ProcessingStatus.error) {
                    print('Error occurred');
                    kCoolAlert(
                      message: 'An error occurred!',
                      context: context,
                      alert: CoolAlertType.error,
                    );
                    Image.network(AppConstants.errorImg);
                  }
                },
                builder: (context, state) {
                  return SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    itemCount:
                        context.read<CourseListCubit>().state.courseList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var course = context
                          .read<CourseListCubit>()
                          .state
                          .courseList[index];

                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CourseDetails(
                              course: course,
                            ),
                          ),
                        ),
                        child: SingleGridCourse(
                          size: size,
                          courseTitle: course.title!,
                          numberOfCourses: course.lesson_num.toString(),
                          imgUrl:
                              '${AppConstants.uploadURL}/${course.thumbnail!}',
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
