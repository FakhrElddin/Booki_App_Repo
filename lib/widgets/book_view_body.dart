import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/models/book_model.dart';
import 'package:graduation_project/views/chat_room_view.dart';
import 'package:graduation_project/views/confirm_order.dart';
import 'package:graduation_project/widgets/book_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';
import '../views/book_owner_view.dart';
import '../views/confirm_exchange.dart';
import 'book_details.dart';


class BookViewBody extends StatefulWidget {
  const BookViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookViewBody> createState() => _BookViewBodyState();
}

class _BookViewBodyState extends State<BookViewBody> {

  PageController bookImagesController = PageController();
  String imageName = 'Cover';
  late List<String> bookImages = [
    widget.bookModel.bookCoverImage,
    widget.bookModel.bookStubImage,
    widget.bookModel.bookPrintingImage,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    if(state is AppCreateConversationFailureState){
      showToastMessage(
        context,
        message: state.errorMessage,
        state: ToastStates.ERROR,
      );
    }
    if (state is AppCreateConversationSuccessState && BlocProvider.of<AppCubit>(context).conversationId != null) {
      BlocProvider.of<AppCubit>(context).createMessage(
                            conversationId: BlocProvider.of<AppCubit>(context).conversationId!,
                            message: "hello, I want to order '${widget.bookModel.title}'",
                          );
      BlocProvider.of<AppCubit>(context).getMessagesOfSpecificConversation(
        conversationId: BlocProvider.of<AppCubit>(context).conversationId!,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ChatRoomView(
                              name: widget.bookModel.bookOwnerName,
                              conversationId: BlocProvider.of<AppCubit>(context).conversationId!,
                            );
                          }));
    } else {}
  },
  builder: (context, state) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 300,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: bookImagesController,
                      onPageChanged: (index) {
                        if(index == 0){
                         setState(() {
                           imageName = 'Cover';
                         });
                        }
                        else if(index == 1){
                          setState(() {
                            imageName = 'Printing';
                          });
                        }
                        else{
                          setState(() {
                            imageName = 'Stub';
                          });
                        }
                      },
                      itemBuilder: (context, index) => Center(
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Image.network(
                              bookImages[index],
                              //width: 200,
                              height: 300,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    imageName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: bookImages.length,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SmoothPageIndicator(
                  controller: bookImagesController,
                  count: bookImages.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: kPrimaryColor,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.bookModel.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                BookDetails(
                    editionDetails: widget.bookModel.edition.toString(),
                    categoryDetails: widget.bookModel.category,
                    timeUsedDetails: '${widget.bookModel.timeUsed} years',
                    priceDetails: '${widget.bookModel.price} L.E',
                    statusDetails: widget.bookModel.status,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 10,
                  thickness: 2.35,
                  color: Colors.grey,
                  indent: 50,
                  endIndent: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const BookOwnerProfile();
                          }));
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            imageUrl: "https://t3.ftcdn.net/jpg/06/92/34/64/240_F_692346400_UzYGmrJm6qhyPPXyZeUGuyEhkwr1iSFN.jpg",
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                          ),
                        ),
                        const Spacer(
                          flex: 10,
                        ),
                        Text(
                          widget.bookModel.bookOwnerName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(
                          flex: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 16.0,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Related Books',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 250,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          BookItem(
                            image: 'https://m.media-amazon.com/images/I/51boxfSXi0L._SY445_SX342_.jpg',
                            price: '500',
                            title: 'Harry Potter and the Goblet of Fire (Book 4)',
                            name: 'hossam',
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          BookItem(
                            image: 'https://m.media-amazon.com/images/I/61XGdLECZ5L._SX342_SY445_.jpg',
                            price: '300',
                            title: 'Harry Potter and the Chamber of Secrets (Book 2)',
                            name: 'hossam',
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          BookItem(
                            image: 'https://m.media-amazon.com/images/I/51KHVovUpGL.jpg',
                            price: '200',
                            title: 'Harry Potter and the Order of the Phoenix (Book 5)',
                            name: 'hossam',
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          BookItem(
                            image: 'https://m.media-amazon.com/images/I/61Ddo7TSTCL._SX342_SY445_.jpg',
                            price: '100',
                            title: 'Harry Potter and the Sorcerer s Stone (Book 1)',
                            name: 'hossam',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 20,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: kPrimaryColor,
                    fixedSize: const Size(220, 60),
                  ),
                  onPressed: () {
                    BlocProvider.of<AppCubit>(context).createConversation(bookId: widget.bookModel.bookId,);

                  },
                  child: const Text(
                    'Order',
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              // Expanded(
              //   flex: 1,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       textStyle: const TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.w500,
              //       ),
              //       backgroundColor: const Color(0xffE2E7F0),
              //       fixedSize: const Size(140, 60),
              //       foregroundColor: Colors.black,
              //     ),
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) {
              //             return const ConfirmExchange();
              //           }));
              //     },
              //     child: const Text(
              //       'Exchange',
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  },
);
  }
}
