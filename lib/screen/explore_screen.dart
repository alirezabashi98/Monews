import 'package:flutter/material.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/model/news_agency_model.dart';
import 'package:monews/screen/show_news_screen.dart';
import 'package:monews/utility/go_to_page.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back_color,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _getAppBar(),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 32),
                sliver: SliverToBoxAdapter(
                  child: _getImageSlider(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 32),
                sliver: SliverToBoxAdapter(
                  child: _getGrouping(mainGrouping),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 32),
                sliver: SliverToBoxAdapter(
                  child: _getListNewsAgency(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 32),
                sliver: SliverToBoxAdapter(
                  child: _getPost(),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPost() {
    return Column(
      children: [
        _getHeaderPostNews("پیشنهاد سردبیر"),
        SizedBox(height: 24),
        Container(
          height: 300,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoToPaget(
                    context,
                    ShowNewsScreen(),
                  );
                },
                child: _getContentPostNews(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _getContentPostNews() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 4),
      child: Container(
        height: 294,
        width: 279,
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/news_hot_01.png"),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: main_red.withOpacity(0.5),
                    ),
                    width: 58,
                    height: 28,
                    child: Center(
                      child: Text(
                        "ورزشی",
                        style: TextStyle(
                            fontFamily: 'SB', fontSize: 10, color: white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset("assets/images/flash_circle.png"),
                  SizedBox(width: 10),
                  Text(
                    "پیشنهاد مونیوز",
                    style: TextStyle(
                      color: main_grey,
                      fontFamily: 'SB',
                      fontSize: 10,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "۵ دقیقه قبل",
                    style: TextStyle(
                      color: main_grey,
                      fontFamily: 'SB',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "پــاسـخ منـفـی پــورتـــو بـه چلـسـی بـرای جذب طارمی با طعم تهدید!",
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/news_agency01.png',
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "خبرگزاری آخرین خبر",
                    style: TextStyle(
                      color: main_black,
                      fontSize: 8,
                      fontFamily: 'SS',
                    ),
                  ),
                  Spacer(),
                  Image.asset("assets/images/short_Menu.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getListNewsAgency() {
    return Column(
      children: [
        _getHeaderPostNews("خبرگزاری ها"),
        SizedBox(height: 20),
        Container(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listNewsAgency.length,
            itemBuilder: (context, index) {
              return _getContentListNewsAgency(
                listNewsAgency[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _getContentListNewsAgency(NewsAgencyModel newAgency) {
    return Container(
      width: 133,
      height: 160,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          ClipOval(
            child: Image.asset(
              newAgency.icon!,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            newAgency.name!,
            style: TextStyle(
              color: main_black,
              fontFamily: 'SB',
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: light_red,
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 0),
            onPressed: () {},
            child: Text(
              "دنبال کردن",
              style: TextStyle(
                color: main_red,
                fontFamily: 'SB',
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getHeaderPostNews(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'SB',
                color: main_black,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Text(
              "مشاهده بیشتر",
              style: TextStyle(
                fontFamily: 'SB',
                color: main_red,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getGrouping(List<String> listDate) {
    return Container(
      height: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListView.builder(
        itemCount: listDate.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  color: _selectedIndex == index ? light_red : white,
                  borderRadius: BorderRadius.circular(18),
                ),
                margin: EdgeInsets.only(left: 15),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    listDate[index],
                    style: TextStyle(
                      color: _selectedIndex == index ? main_red : main_grey,
                      fontFamily: 'SB',
                      fontSize: 12,
                    ),
                  ),
                )),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getImageSlider() {
    return SizedBox(
      height: 164,
      child: ScrollPageView(
        controller: ScrollPageController(),
        children: listBanner.map((image) => _imageView(image)).toList(),
      ),
    );
  }

  ///Image
  Widget _imageView(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }

  Widget _getAppBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 13),
      child: Row(
        children: [
          Spacer(
            flex: 4,
          ),
          Image.asset("assets/images/logo.png"),
          Spacer(
            flex: 3,
          ),
          Image.asset("assets/images/filter_edit.png"),
          SizedBox(width: 27),
          Image.asset("assets/images/search_normal.png"),
        ],
      ),
    );
  }
}
