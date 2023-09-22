import 'package:edu_guru/gen/assets.gen.dart';

class CarouselSliderItem {
  final int id;
  final String title;
  final String dataSubtitle;
  final AssetGenImage imgUrl;

  CarouselSliderItem({
    required this.id,
    required this.imgUrl,
    required this.title,
    required this.dataSubtitle,
  });


}

final List<CarouselSliderItem> carouselSliderItems = [
  CarouselSliderItem(
    id: 1,
    imgUrl: Assets.icons.image,
    title: 'Art & Illustrations',
    dataSubtitle: '20/25 Lessons',
  ),
  CarouselSliderItem(
    id: 1,
    imgUrl: Assets.icons.image1,
    title: 'SEO and Content Marketing',
    dataSubtitle: '10/15 Lessons',
  ),
  CarouselSliderItem(
    id: 2,
    imgUrl: Assets.icons.image2,
    title: 'Machine Learning Basics',
    dataSubtitle: '30/45 Lessons',
  ),
  CarouselSliderItem(
    id: 3,
    imgUrl: Assets.icons.image3,
    title: 'iOS App Development with Swift',
    dataSubtitle: '10/34 Lessons',
  ),
  CarouselSliderItem(
    id: 4,
    imgUrl: Assets.icons.image4,
    title: 'Building Responsive Websites',
    dataSubtitle: '45/60 Lessons',
  ),
];
