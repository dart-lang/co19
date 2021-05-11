// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar changes for map and set are a little more complex
/// because of the potential ambiguity of collections containing only spreads.
/// The changed and new rules are:
///
///    setOrMapLiteral:
///    mapLiteral |
///    setLiteral |
///    mapOrSetLiteral
///    ;
///
///    mapLiteral:
///    const? typeArguments? '{' mapLiteralEntryList? '}'
///    ;
///
///    mapLiteralEntryList:
///    mapLiteralEntry ( ',' mapLiteralEntry )* ','?
///    ;
///
///    mapLiteralEntry:
///    expression ':' expression |
///    spread
///    ;
///
///    setLiteral:
///    'const'? typeArguments? '{' spreadableList '}' ;
///
///    mapOrSetLiteral:
///    'const'?  '{' spread (',' spread)* '}' ;
///
/// @description Checks that spreadable set can not be declared as constant if
/// spreadable element is not a constant.
/// @author iarkh@unipro.ru


late Set set2;

main() {
  Set set1 = {"abc", "int", "hello"};
  List list = [];
  int i = 0;

  List a;
  a = const {...set2};
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {"testme", ...set2};
//    ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {...set2, "testme"};
//    ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a = const {...list};
//    ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {"testme", ...list};
//    ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {...list, "testme"};
//    ^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a = const {"abc", ...set1, "int", "hello", 1, ...list, 2, 12};
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {"abc", ...set1, "int", "hello", 1, ...set2, 2, 12};
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a = const {...set1, i};
//    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {...list, i};
//    ^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
