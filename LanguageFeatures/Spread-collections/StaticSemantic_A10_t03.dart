// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// A spread element in a list or set literal has a static type that is not
/// dynamic and not a subtype of Iterable<Object>.
/// @description Checks that compile error is thrown if null-aware spread element
/// in the list is not dynamic and is not assignable to [Iterable] or [Null]
/// @author iarkh@unipro.ru


import "dart:async";

main() {
  Object? x1;
  Map? x2;
  int? x3;
  void x4;
  Future? x5;
  FutureOr x6;

  List l1 = [...?x1];
//               ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'Object?' of a spread.  Expected 'dynamic' or an Iterable.
  List l2 = [...?x2];
//               ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'Map<dynamic, dynamic>?' of a spread.  Expected 'dynamic' or an Iterable.
  List l3 = [...?x3];
//               ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'int?' of a spread.  Expected 'dynamic' or an Iterable.
  List l4 = [...?x4];
//               ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'void' of a spread.  Expected 'dynamic' or an Iterable.
  List l5 = [...?x5];
//               ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'Future<dynamic>?' of a spread.  Expected 'dynamic' or an Iterable.
  List l6 = [...?x6];
//               ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'FutureOr<dynamic>' of a spread.  Expected 'dynamic' or an Iterable.
}
