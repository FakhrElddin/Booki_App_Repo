import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/widgets/chat_person_item.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var appCubit = BlocProvider.of<AppCubit>(context);
        return ConditionalBuilder(
          condition: appCubit.conversationsModel != null,
          builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Chats',
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ChatPersonItem(
                    conversationsDataModel: appCubit.conversationsModel!.data[index],
                  ),
                  separatorBuilder: (context, index) =>
                  const Divider(
                    color: kPrimaryColor,
                    height: 48,
                    thickness: 1.5,
                    endIndent: 16,
                    indent: 16,
                  ),
                  itemCount: appCubit.conversationsModel!.data.length,
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
          fallback: (context) => Center(child: CircularProgressIndicator()),);
      },
    );
  }
}
