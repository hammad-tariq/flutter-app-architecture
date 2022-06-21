import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart' as paths;
import '../model/categories.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
part 'app_database.g.dart';

@DriftDatabase(tables: [Categories])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 3;

  /*
  * All DB Queries
  * */
  Future<List<Category>> get allCategories => select(categories).get();

  Stream<List<Category>> watchAllCategories() => select(categories).watch();

  Future insertNewCategory(Category category) =>
      into(categories).insert(category);

  Future deleteCategory(Category category) =>
      delete(categories).delete(category);
}

AppDatabase openConnection({bool logStatements = true}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'dukkantekpos.sqlite'));
      return NativeDatabase(dbFile, logStatements: logStatements);
    });
    return AppDatabase(executor);
  }
  return AppDatabase(NativeDatabase.memory(logStatements: logStatements));
}
