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

    List<Book> books = [];

    if(snapshot.size > 0) {
      books = snapshot.docs.map( (doc) =>
        Book(
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
        )
      ).toList();
    };
    return Books(status: 'success', totalResults: books.length, books: books);
  }
}