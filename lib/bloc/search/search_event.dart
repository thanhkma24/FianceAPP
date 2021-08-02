abstract class SearchEvent{}

class SearchEventIpl extends SearchEvent{
  final String textSearch;

  SearchEventIpl(this.textSearch);
}