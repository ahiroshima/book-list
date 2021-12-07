import 'package:app/data/model/collection.dart';
import 'package:app/data/model/collections.dart';

import 'dummy_collection.dart';

final dummyCollections = Collections(status: 'success', totalResults: 3, col: <Collection>[
  dummyCollection,
  dummyCollection,
  dummyCollection,
]);