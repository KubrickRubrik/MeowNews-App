import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_item_event.dart';
part 'news_item_state.dart';

class NewsItemBloc extends Bloc<NewsItemEvent, NewsItemState> {
  NewsItemBloc() : super(NewsItemInitial()) {
    on<NewsItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
