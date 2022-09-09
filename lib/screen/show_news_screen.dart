import 'package:flutter/material.dart';
import 'package:monews/constants/constants.dart';

class ShowNewsScreen extends StatelessWidget {
  const ShowNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 24),
                  child: Image.asset('assets/images/short_Menu_horizontal.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, left: 24),
                  child: Image.asset('assets/images/bookmark.png'),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 24),
                  child: Image.asset('assets/images/arrow_right.png'),
                ),
              ],
              bottom: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(10),
              ),
              backgroundColor: white,
              expandedHeight: 329,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/news_hot_01.png',
                  fit: BoxFit.cover,
                ),
                title: Container(
                  height: 32,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Image.asset("assets/images/home_indicator.png"),
                ),
                centerTitle: true,
                titlePadding: EdgeInsets.zero,
              ),
            ),
          ];
        },
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Image.asset('assets/images/flash_circle.png'),
                      SizedBox(width: 5),
                      Text(
                        "پیشنهاد مونیوز",
                        style: TextStyle(
                          color: main_grey,
                          fontFamily: 'SB',
                          fontSize: 10,
                        ),
                      ),
                      Spacer(flex: 2,),
                      Container(
                        height: 26,
                        decoration: BoxDecoration(
                          color: main_red,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          child: Row(
                            children: [
                              Image.asset("assets/images/news_agency01_2.png"),
                              SizedBox(width: 5),
                              Text(
                                "خبرگزاری آخرین خبر",
                                style: TextStyle(
                                  color: white,
                                  fontFamily: 'SS',
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 6,),
                      Text(
                        "5 دقیقه قبل",
                        style: TextStyle(
                          color: main_grey,
                          fontFamily: 'SB',
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "پاسـخ مـنـفی پــورتـو به چـلـسی بـرای جــذب طـارمـی با طعم تهدید!",
                    style: TextStyle(
                      color: main_black,
                      fontFamily: 'SB',
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 20,right: 24),
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                            color: light_red,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                defaultGrouping[index],
                                style: TextStyle(
                                  color: main_red,
                                  fontSize: 10,
                                  fontFamily: 'SB',
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: defaultGrouping.length,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Text(
                    "باشگاه چلسی که پیگیر جذب مهدی طارمی مهاجـم ایران بـود، با پاسـخ منفی باشگاه پورتو مواجه شد و این بازیـکن باوجود رویای بازی در لیگ برتر انگلیس فعلا در پرتغال ماندنی است.",
                    style: TextStyle(
                      color: main_black,
                      fontFamily: 'SB',
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 24, left: 24),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                color: main_red,
                                width: 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            "بحث پیشنهاد باشگاه چلسـی انـگـلیس به پـورتـو بـرای جـذب مـهدی طــارمـی در آخـریــن ســاعــات نــقـل و انـتـقـالـات فــوتـبـال اروپـا یــکـی از سوژه‌های اصلی هواداران دو تیم بود. این خبر در حالی رسانه‌ای شد که گفته می‌شد چلسی برای جذب طارمی مبلغ ۲۵ میلیون یورو را به پورتو پیشنهاد داده است. روزنـامه «ابولا» پرتغال هم روز چهارشنـبـه ایــن خـبر را اعلـام کرد و به دنبال آن بعضی از مطبوعات انگلیس و کشورهای دیگر هم پیشنهاد چلسی به طارمی را دنبال کردند.\n طـارمـی در لـیـگ قـهـرمـانـان دو فــصـل پــیــش اروپـا و در دیـدار مـقـابـل چلسی عملکرد بی نظیری داشت و با یک گل قیچی برگردان، پورتو را به پیروزی رساند. هرچند که نماینده پرتـغال به خاطر مجموع نـتـایـج بازی رفت و برگشت حـذف شد. با ایـن حـال گـل طـارمـی حتـی تـا یک قـدمی انـتخـاب بهـترین گـل سـال فیـفا و دریـافـت جـایزه «پوشکاش» هم پیش رفت.",
                            style: TextStyle(
                              color: main_black,
                              fontFamily: 'SN',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
