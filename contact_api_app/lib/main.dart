import 'package:contact_api_app/bloc/contact/contact_event.dart';
import 'package:contact_api_app/bloc/news/news_bloc.dart';
import 'package:contact_api_app/bloc/news/news_event.dart';
import 'package:contact_api_app/bloc/news/news_state.dart';
import 'package:contact_api_app/repositories/contact_repository.dart';
import 'package:contact_api_app/repositories/message_repository.dart';
import 'package:contact_api_app/repositories/news_repository.dart';
import 'package:contact_api_app/ui/pages/about.dart';
import 'package:contact_api_app/ui/pages/contact_page.dart';
import 'package:contact_api_app/ui/pages/home.dart';
import 'package:contact_api_app/ui/pages/message_page.dart';
import 'package:contact_api_app/ui/pages/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contact/contact_bloc.dart';
import 'bloc/contact/contact_state.dart';
import 'bloc/messages/message_bloc.dart';
import 'bloc/messages/message_state.dart';
import 'bloc/messages/messages_event.dart';
import 'models/contact_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ContactBloc( ContactState(contacts: [], requestState: RequestState.NONE, errorMessage: "", currentEvent: LoadAllContactsEvent()), ContactRepository())),
        BlocProvider(create: (context)=>MessageBloc(initialState: MessageState(messages: [],currentEvent: ContactMessagesEvent(contact: Contact(profile: '', groupe: '', id: 0, name: ''))), messageRepository: MessageRepository()),),
        BlocProvider(create: (context)=>NewsBloc(initialState: NewsState(news: [], currentEvent: SearchNewsEvent(key: "tesla", date: "2022-05-23"),), newsRepository: NewsRepository()),)
      ],
      child: MaterialApp(
        title: 'Chat app',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color:Colors.black87 ,fontSize: 20, fontFamily: 'RobotoMono'),
          ),
          iconTheme: const IconThemeData(
            color: Colors.brown,
            size: 28,
          ),
        ),
        home: Home(),
        routes: {
          "/contact":(context)=>ContactPage(),
          "/messages":(context)=>MessagesPage(),
          "/news":(context)=>NewsPage(),
          "/about":(context)=>About(),
        },
      ),
    );
  }
}
