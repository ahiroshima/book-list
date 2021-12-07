import 'package:app/data/model/book.dart';
import 'package:app/data/model/books.dart';
import 'package:app/data/model/collection.dart';
import 'package:app/data/model/collections.dart';
import 'package:app/data/provider/firebase_auth_provider.dart';
import 'package:app/data/provider/firebase_firestore_provider.dart';
import 'package:app/data/remote/books_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final booksDataSourceProvider =
    Provider((ref) => BooksDataSourceImpl(ref.read));

class BooksDataSourceImpl implements BooksDataSource {
  BooksDataSourceImpl(this._reader);

  final Reader _reader;

  late final firebase.FirebaseFirestore _firebaseFirestore =
      _reader(firebaseFirestoreProvider);

  late final auth.FirebaseAuth _firebaseAuth = _reader(firebaseAuthProvider);

  late final String _uid = _firebaseAuth.currentUser!.uid;

  @override
  Future<void> addBook(book) async {
    _firebaseFirestore
        .collection('book_list')
        .doc(_uid)
        .collection('books')
        .add(book.toJson());
  }

  @override
  Future<Books> getBooks() async {
    final snapshot = await _firebaseFirestore
        .collection('book_list')
        .doc(_uid)
        .collection('books')
        .get();

    List<Book> books = [];

    if (snapshot.size > 0) {
      books = snapshot.docs
          .map((doc) => Book(
                isbn: doc.get('isbn'),
                title: doc.get('title'),
                subtitle: doc.get('subtitle'),
                authors: doc.get('authors'),
                publishedDate: doc.get('publishedDate'),
                description: doc.get('description'),
                pageCount: doc.get('pageCount') ?? 0,
                categories: doc.get('categories'),
                smallThumbnail: doc.get('smallThumbnail'),
                thumbnail: doc.get('thumbnail'),
                urlToDetailPage: doc.get('urlToDetailPage'),
                publisher: doc.get('publisher'),
                price: doc.get('price'),
              ))
          .toList();
    }
    return Books(status: 'success', totalResults: books.length, books: books);
  }

  @override
  Future<Collections> getCollections() async {
    final snapshot = await _firebaseFirestore
        .collection('book_list')
        .doc(_uid)
        .collection('collections')
        .get();

    List<Collection> userCollections = [];
    List<Collection> collections = [];

    // "全て"は固定とする
    collections
        .add(Collection(id: '000', name: '全て', books: ['All']));

    if (snapshot.size > 0) {
      userCollections = snapshot.docs
          .map((doc) => Collection(
                id: doc.get('id'),
                name: doc.get('name'),
                books: doc.get('books'),
              ))
          .toList();
    }
    collections.addAll(userCollections);

    return Collections(
        status: 'success', totalResults: collections.length, col: collections);
  }
}
