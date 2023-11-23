// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// A spread element in a map literal has a static type that is not [dynamic] and
/// not a subtype of [Map<Object, Object>].
/// @description Checks that compile error is thrown if null-aware spread element
/// in the map is not dynamic, is not assignable to [Map] and is not [null]
/// @author iarkh@unipro.ru


import "dart:async";

main() {
  Object? x1;
  List? x2;
  Set? x3;
  int? x4;
  Iterable? x5;
  void x6;
  Future? x7;
  FutureOr x8;

  Map m1 = {...?x1};
//              ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'Object?' of a map spread entry.  Expected 'dynamic' or a Map.
  Map m2 = {...?x2};
//         ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Map m3 = {...?x3};
//         ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Map m4 = {...?x4};
//              ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'int?' of a map spread entry.  Expected 'dynamic' or a Map.
  Map m5 = {...?x5};
//         ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  Map m6 = {...?x6};
//              ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'void' of a map spread entry.  Expected 'dynamic' or a Map.
  Map m7 = {...?x7};
//              ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'Future<dynamic>?' of a map spread entry.  Expected 'dynamic' or a Map.
  Map m8 = {...?x8};
//              ^^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'FutureOr<dynamic>' of a map spread entry.  Expected 'dynamic' or a Map.
}
