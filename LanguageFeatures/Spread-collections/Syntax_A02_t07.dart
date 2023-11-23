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
/// @description Checks that spreadable map can not be declared as constant if
/// spreadable element is not a constant.
/// @author iarkh@unipro.ru


late Map map2;

main() {
  Map map1 = {1: 1, 2: 4, 3: 6};
  int i = 0;

  Map a;
  a = const {...map2};
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {...map1, ...map2};
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {...map2, ...map1};
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a = const {...map2, 10: 2};
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {10: 2, ...map2};
//                     ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a = const {...map1, i: 10};
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {...map1, 10: i};
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {i: 10, ...map1};
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  a = const {10: i, map1};
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}
