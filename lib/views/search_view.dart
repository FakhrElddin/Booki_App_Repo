import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';
import 'package:graduation_project/widgets/search_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AppSearchForBookFailureState) {
          showToastMessage(
            context,
            message: state.errorMessage,
            state: ToastStates.ERROR,
            positionedToastBuilder: (context, child){
              return Positioned(
                bottom: 70.0,
                left: 32.0,
                right: 32.0,
                child: child,
              );
            },
          );
        }
      },
      builder: (context, state) {
        var appCubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.black,
              ),
            ),
            title: SafeArea(
              child: SizedBox(
                height: 56,
                child: CustomTextFormField(
                  controller: searchController,
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  onFieldSubmitted: (value) {
                    if (value?.isNotEmpty ?? false) {
                      appCubit.searchForBook(bookName: value!);
                    }
                  },
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: state is AppSearchForBookFailureState
                ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 50,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                )
                : Column(
                    children: [
                      if (state is AppSearchForBookLoadingState)
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: LinearProgressIndicator(),
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => SearchItem(
                            searchDataModel: appCubit.searchedBooksList[index],
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemCount: appCubit.searchedBooksList.length,
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
