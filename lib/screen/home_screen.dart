import 'package:flutter/material.dart';
import 'package:monews/constants/constants.dart';
import 'package:monews/screen/show_news_screen.dart';
import 'package:monews/utility/go_to_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back_color,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 13),
              _getAppBar(),
              _getTabs(),
              Expanded(child: _getContentTabs()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getItemFollow(int index) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(right: 17, left: 17, top: 20),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              color: main_red,
              width: 6,
              height: 6,
            ),
          ),
          SizedBox(width: 7),
          ClipOval(
            child: Image.asset(
              listNewsAgency[index].icon!,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listNewsAgency[index].name!,
                style: TextStyle(
                  color: main_black,
                  fontFamily: 'SB',
                  fontSize: 12,
                ),
              ),
              Text(
                listNewsAgency[index].description!,
                maxLines: 1,
                style: TextStyle(
                  color: main_grey,
                  fontFamily: 'SS',
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "مشاهده",
              style: TextStyle(
                color: main_grey,
                fontFamily: 'SS',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTabs() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: white,
      ),
      height: 43,
      margin: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: TabBar(
        labelStyle: TextStyle(
          color: main_grey,
          fontFamily: 'SB',
          fontSize: 16,
        ),
        unselectedLabelStyle: TextStyle(
          color: white,
          fontFamily: 'SB',
          fontSize: 16,
        ),
        labelColor: white,
        unselectedLabelColor: main_grey,
        indicator: BoxDecoration(
            color: main_red, borderRadius: BorderRadius.circular(22)),
        controller: _tabController,
        tabs: [
          Tab(text: "پیشنهادی"),
          Tab(text: "دنبال میکنید"),
        ],
      ),
    );
  }

  Widget _getPageOffers() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _getHeaderPostNews("خبر های داغ"),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 300,
            margin: EdgeInsets.only(top: 24),
            child: ListView.builder(
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
              itemCount: 5,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 2),
            child: _getHeaderPostNews("خبر هایی که علاقه داری"),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: _getContentPostNewsInterested(),
              );
            },
            childCount: 5,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
          ),
        ),
      ],
    );
  }

  Widget _getPageFollow() {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getItemFollow(index);
            },
            childCount: 4,
          ),
        ),
      ],
    );
  }

  Widget _getContentPostNewsInterested() {
    return Container(
      width: 380,
      height: 142,
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
            child: Stack(
              children: [
                Container(
                  height: 116,
                  width: 116,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/news_interest.png",
                      fit: BoxFit.cover,
                    ),
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
                        "تکنولوژی",
                        style: TextStyle(
                            fontFamily: 'SB', fontSize: 10, color: white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "سـاعـت هوشـمـنـد گــارمـیـن Venu Sq 2 بـا عمر باتری ۱۱ روزه معرفی شد",
                    style: TextStyle(
                      color: main_black,
                      fontFamily: 'SB',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "گارمین در رویداد IFA ۲۰۲۲ ساعت هوشمند Venu Sq 2 و ردیاب سلامت کودکان موسوم به Black Panther Vivofit Jr 3 را معرفی کرد.",
                    style: TextStyle(
                      color: main_grey,
                      fontFamily: 'SM',
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/news_agency02.png',
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "خبرگزاری زومیت",
                          style: TextStyle(
                            color: main_black,
                            fontFamily: 'SS',
                            fontSize: 8,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/short_Menu.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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

  Widget _getContentTabs() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
          color: back_color,
          child: _getPageOffers(),
        ),
        Container(
          color: back_color,
          child: _getPageFollow(),
        ),
      ],
    );
  }

  Widget _getAppBar() {
    return Row(
      children: [
        Spacer(),
        Image.asset("assets/images/logo.png"),
        Spacer(),
        Image.asset('assets/images/notification_status.png'),
        SizedBox(width: 24),
      ],
    );
  }
}
