import 'package:app/data/model/book.dart';
import 'package:app/data/model/books.dart';
import 'package:app/data/provider/firebase_firestore_provider.dart';
import 'package:app/data/remote/books_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase;
import 'package:hooks_riverpod/hooks_riverpod.dart';

final booksDataSourceProvider = Provider((ref) => BooksDataSourceImpl(ref.read));

class BooksDataSourceImpl implements BooksDataSource {
  BooksDataSourceImpl(this._reader);

  final Reader _reader;

  late final firebase.FirebaseFirestore _firebaseFirestore =
      _reader(firebaseFirestoreProvider);

  @override
  Future<Books> getBooks() async {
    final snapshot = await _firebaseFirestore.collection('books').get();
    List<Book>articles = snapshot.docs.map(
              (doc) => Book(
                title: doc.get('title'),
                author: doc.get('author'),
                urlToLargeImage: doc.get('urlToLargeImage'),
                urlToMediumImage: doc.get('urlToMediumImage'),
                urlToDetailPage: doc.get('urlToDetailPage'),
                publisher: doc.get('publisher'),
                publicationDate: doc.get('publicationDate'),
                price: doc.get('price'))).toList();
    return Books(status: 'success', totalResults: articles.length, books: articles);
  }
}