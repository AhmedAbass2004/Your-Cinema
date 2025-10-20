import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_cinema/features/authentication/data/data_sources/firebase_store_data_source.dart';

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final firebaseStoreDataSourceProvider = Provider<FirebaseStoreDataSource>((
  ref,
) {
  final fireStore = ref.read(firebaseFirestoreProvider);
  return FirebaseStoreDataSource(firestore: fireStore);
});
