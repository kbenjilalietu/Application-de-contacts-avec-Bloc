
import 'package:contact_api_app/bloc/news/news_bloc.dart';
import 'package:contact_api_app/bloc/news/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ButtonReloadNews extends StatelessWidget {
  final NewsState state;
  const ButtonReloadNews({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      NewsBloc messageBloc=context.read<NewsBloc>();
      context.read<NewsBloc>().add(state.currentEvent);

    }, child: Text("Reload"));
  }
}
