import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:contact_api_app/bloc/contact/contact_state.dart';
import 'package:contact_api_app/bloc/news/news_event.dart';
import 'package:contact_api_app/bloc/news/news_state.dart';
import 'package:contact_api_app/models/news_model.dart';
import 'package:contact_api_app/repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{
  NewsRepository newsRepository;
  NewsBloc({required NewsState initialState, required this.newsRepository}) : super(initialState) {
    on<SearchNewsEvent>((event, emit) async {
      var news = await newsRepository.searchNews(event.key, event.date);
      emit(NewsState(news: news,requestState: RequestState.Loaded,errorMessage: "",currentEvent: event));
    });
  }
}
