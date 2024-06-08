import 'package:booklyapp/features/home/domain/entities/home_entity.dart';
import 'package:hive/hive.dart';

saveBooksData({required List<BookEntity> books, required String boxName}) {
  final box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
