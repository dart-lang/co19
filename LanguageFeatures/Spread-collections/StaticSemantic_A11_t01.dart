// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// A spread element in a map literal has a static type that is not [dynamic] and
/// not a subtype of [Map<Object, Object>].
/// @description Checks that compile error is thrown if spread element in the
/// map is not dynamic and is not assignable to [Map]
/// @author iarkh@unipro.ru

import "dart:async";

main() {
  Object x1 = Object();
  List x2 = [];
  Set x3 = {1};
  int x4 = 0;
  late Iterable x5;
  Null x6 = null;
  void x7;
  Future x8;
  FutureOr x9 = 4;

  Map m1 = {...x1};
//             ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'Object' of a map spread entry.  Expected 'dynamic' or a Map.
  Map m2 = {...x2};
//         ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Map m3 = {...x3};
//         ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Map m4 = {...x4};
//             ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'int' of a map spread entry.  Expected 'dynamic' or a Map.
  Map m5 = {...x5};
//         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Map m6 = {...x6};
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
  Map m7 = {...x7};
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
  Map m8 = {...x8};
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
  Map m9 = {...x9};
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
}
