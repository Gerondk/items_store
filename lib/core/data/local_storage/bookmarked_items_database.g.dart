// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarked_items_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $BookmarkedItemsDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $BookmarkedItemsDatabaseBuilderContract addMigrations(
      List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $BookmarkedItemsDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<BookmarkedItemsDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorBookmarkedItemsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $BookmarkedItemsDatabaseBuilderContract databaseBuilder(String name) =>
      _$BookmarkedItemsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $BookmarkedItemsDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$BookmarkedItemsDatabaseBuilder(null);
}

class _$BookmarkedItemsDatabaseBuilder
    implements $BookmarkedItemsDatabaseBuilderContract {
  _$BookmarkedItemsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $BookmarkedItemsDatabaseBuilderContract addMigrations(
      List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $BookmarkedItemsDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<BookmarkedItemsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BookmarkedItemsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BookmarkedItemsDatabase extends BookmarkedItemsDatabase {
  _$BookmarkedItemsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookedItemsDao? _bookedItemsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `BookmarkedItemEntity` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookedItemsDao get bookedItemsDao {
    return _bookedItemsDaoInstance ??=
        _$BookedItemsDao(database, changeListener);
  }
}

class _$BookedItemsDao extends BookedItemsDao {
  _$BookedItemsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _bookmarkedItemEntityInsertionAdapter = InsertionAdapter(
            database,
            'BookmarkedItemEntity',
            (BookmarkedItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookmarkedItemEntity>
      _bookmarkedItemEntityInsertionAdapter;

  @override
  Stream<List<BookmarkedItemEntity>> getAllBookedItems() {
    return _queryAdapter.queryListStream('SELECT * FROM BookmarkedItemEntity',
        mapper: (Map<String, Object?> row) => BookmarkedItemEntity(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String),
        queryableName: 'BookmarkedItemEntity',
        isView: false);
  }

  @override
  Future<void> deleteItemById(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM BookmarkedItemEntity WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertBookedItems(BookmarkedItemEntity item) async {
    await _bookmarkedItemEntityInsertionAdapter.insert(
        item, OnConflictStrategy.replace);
  }
}
