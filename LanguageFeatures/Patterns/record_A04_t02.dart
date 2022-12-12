// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// recordPattern         ::= '(' patternFields? ')'
/// patternFields         ::= patternField ( ',' patternField )* ','?
/// patternField          ::= ( identifier? ':' )? pattern
/// ...
/// It is a compile-time error if a name cannot be inferred for a named field
/// pattern with the field name omitted
///
/// @description Checks that it is a compile-time error if a name cannot be
/// inferred for a named field pattern with the field name omitted
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

main() {
  var (:_) = (x1: 1);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  final (:_) = (x2: 1);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  var (:int _) = (x3: 1);
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  var (:_?) = (x4: 1);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  final (:_?) = (x5: 1);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  var (:int _?) = (x6: 1);
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  var (:_!) = (x7: 1);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  final (:_!) = (x8: 1);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  var (:int _!) = (x9: 1);
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  var (:_ as int) = (x10: 1);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  final (:_ as int) = (x11: 1);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  var (:num _ as int) = (x12: 1);
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  var (:(_)) = (x13: 1);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  final (:(_)) = (x14: 1);
//         ^
// [analyzer] unspecified
// [cfe] unspecified
  var (:(int _)) = (x15: 1);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}
