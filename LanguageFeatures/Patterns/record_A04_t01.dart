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
  var (:n1) = (x1: 1);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:n2) = (x2: 1);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (:int n3) = (x3: 1);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:n4?) = (x4: 1);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:n5?) = (x5: 1);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (:int n6?) = (x6: 1);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:n7!) = (x7: 1);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:n8!) = (x8: 1);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (:int n9!) = (x9: 1);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:n10 as int) = (x10: 1);
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:n11 as int) = (x11: 1);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
  var (:num n12 as int) = (x12: 1);
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var (:(n13)) = (x13: 1);
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:(n14)) = (x14: 1);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  var (:(int n15)) = (x15: 1);
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
