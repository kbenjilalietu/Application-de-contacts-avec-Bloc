abstract class NewsEvent{}

class SearchNewsEvent extends NewsEvent{
  String key;
  String date;

  SearchNewsEvent({required this.key, required this.date});
}