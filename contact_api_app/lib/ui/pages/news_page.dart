
import 'package:contact_api_app/bloc/news/news_bloc.dart';
import 'package:contact_api_app/bloc/news/news_event.dart';
import 'package:contact_api_app/bloc/news/news_state.dart';
import 'package:contact_api_app/ui/widget_news/list_news.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/contact/contact_state.dart';
import '../widget_news/button_reload_news.dart';

class NewsPage extends StatelessWidget{

  TextEditingController keyController = TextEditingController();

  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //final format = DateFormat("yyyy-MM-dd");
    return Scaffold(
      appBar: AppBar(title: const Text("News")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.brown,
              child: Padding(padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: keyController,
                      decoration: InputDecoration(
                          labelText: "key",
                          prefixIcon: const Icon(Icons.key_off),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(height: 10),

                    DateTimeField(
                      controller: dateController,
                      decoration: InputDecoration(
                          labelText: "Date",
                          prefixIcon: const Icon(Icons.access_time),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      format: DateFormat("yyyy-MM-dd"),
                      onShowPicker: (context, currentValue){
                        return showDatePicker(
                            context: context,
                            //?? Called also null operator. This operator returns expression on its left,
                            // except if it is null, and if so, it returns right
                            initialDate: currentValue ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now());
                      },
                    ),

                    const SizedBox(height: 14),
                    MaterialButton(
                      onPressed: (){
                        context.read<NewsBloc>().add(SearchNewsEvent(key: keyController.text, date: dateController.text));

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.brown,
                      textColor: Colors.white,
                      minWidth: 316,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.login),
                          SizedBox(width: 10,),
                          Text("Search", style: TextStyle(fontSize: 20),)
                        ],
                      ),
                    ),
                  ],),
              ),
            ),
            BlocBuilder<NewsBloc,NewsState>(
                builder: (context, state) {
                  if(state.requestState==RequestState.Loading){
                    return Column(
                      children: [
                        SizedBox(height: 200,),
                        Center(child: CircularProgressIndicator()),
                      ],
                    );
                  }else if(state.requestState==RequestState.Loaded){
                    return Expanded(
                      child: ListNews(newsState: state,),
                    );
                  }else if(state.requestState==RequestState.Error){
                    return Column(
                      children: [
                        SizedBox(height: 200,),
                        Center(child: Text("${state.errorMessage}", style: TextStyle(fontSize: 18, ),textAlign: TextAlign.center,)),
                        SizedBox(height: 20,),
                        Center(child: ButtonReloadNews(state: state,)),
                      ],
                    );
                  }
                  else{
                    return Center(child: Text("Aucun élément"),);
                  }
                }),
            ],
        ),
      ),
    );
  }
}