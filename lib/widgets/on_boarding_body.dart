
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/local/cache_helper.dart';
import 'package:graduation_project/models/boarding_model.dart';
import 'package:graduation_project/views/login_view.dart';
import 'package:graduation_project/widgets/boarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {

  final List<BoardingModel> boardingList = const [
    BoardingModel(
      image: 'assets/images/onboarding_1.svg',
      title: 'Boarding 1 title',
      body: 'User-friendly book store app with diverse genres, reviews, and a simple interface for effortless browsing and buying',
    ),
    BoardingModel(
      image: 'assets/images/onboarding_2.svg',
      title: 'Boarding 2 title',
      body: 'Explore a virtual haven for bookworms with our app—browse, discover, and purchase your favorite reads anytime, anywhere',
    ),
    BoardingModel(
      image: 'assets/images/onboarding_3.svg',
      title: 'Boarding 3 title',
      body: 'Boarding 3 body',
    ),
    BoardingModel(
      image: 'assets/images/onboarding_4.svg',
      title: 'Boarding 4 title',
      body: 'Boarding 4 body',
    ),
  ];

  PageController boardingController = PageController();
  bool isLast = false;
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: boardingController,
              onPageChanged: (index) {
                if(index == boardingList.length - 1){
                  isLast = true;
                } else{
                  isLast = false;
                }
                if(index == 0){
                  isFirst = true;
                } else{
                  isFirst = false;
                }
              },
              itemBuilder: (context, index) => BoardingItem(
                boardingModel: boardingList[index],
              ),
              itemCount: boardingList.length,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: boardingController,
                count: boardingList.length,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: kPrimaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 3,
                  spacing: 5,
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: (){
                  if(isFirst){
                    // showAwesomeDialog(
                    //   context,
                    //   title: 'Exit Confirmation',
                    //   body: 'Are you sure you want to exit the app?',
                    //   cancelOnPress: (){},
                    //   okOnPress: (){
                    //     SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    //   },
                    //   dialogType: DialogType.warning,
                    // );
                  } else{
                    boardingController.previousPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve:  Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              FloatingActionButton(
                onPressed: (){
                  if(isLast == false){
                    boardingController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve:  Curves.fastLinearToSlowEaseIn,
                    );
                  } else{
                    CacheHelper.saveData(key: 'onBoarding', value: true).then((value){
                      if(value){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return const LoginView();
                        }));
                      }
                    });
                  }
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 32,
          // ),
        ],
      ),
    );
  }
}