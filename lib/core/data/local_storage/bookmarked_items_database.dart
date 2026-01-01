import 'dart:async';
import 'dart:developer';

import 'package:floor/floor.dart';
import 'package:items_store/core/data/local_storage/booked_items_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'bookmarked_item_entity.dart';

part 'bookmarked_items_database.g.dart';

@Database(version: 1, entities: [BookmarkedItemEntity])
abstract class BookmarkedItemsDatabase extends FloorDatabase {
  BookedItemsDao get bookedItemsDao;

  static Future<BookmarkedItemsDatabase> init() async {
    log('Bookmarked Db init');
    return await $FloorBookmarkedItemsDatabase
        .databaseBuilder('booked_items.db')
        .build();
  }
}
