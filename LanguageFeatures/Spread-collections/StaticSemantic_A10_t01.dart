// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// A spread element in a list or set literal has a static type that is not
/// dynamic and not a subtype of Iterable<Object>.
/// @description Checks that compile error is thrown if spread element in the
/// list is not dynamic and is not assignable to [Iterable]
/// @author iarkh@unipro.ru


import "dart:async";

main() {
  Object x1 = Object();
  Map x2 = {};
  int x3 = 0;
  void x4;
  FutureOr x5 = 0;
  Null x6 = null;
  Future x7;

  List l1 = [...x1];
//              ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'Object' of a spread.  Expected 'dynamic' or an Iterable.
  List l2 = [...x2];
//              ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'Map<dynamic, dynamic>' of a spread.  Expected 'dynamic' or an Iterable.
  List l3 = [...x3];
//              ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'int' of a spread.  Expected 'dynamic' or an Iterable.
  List l4 = [...x4];
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l5 = [...x5];
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l6 = [...x6];
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  List l7 = [...x7];
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}
