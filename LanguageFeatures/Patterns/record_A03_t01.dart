// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// recordPattern         ::= '(' patternFields? ')'
/// patternFields         ::= patternField ( ',' patternField )* ','?
/// patternField          ::= ( identifier? ':' )? pattern
/// ...
/// It is a compile-time error if any pair of named fields have the same name.
/// This applies to both explicit and inferred field names.
///
/// @description Checks that it is a compile-time error if any pair of named
/// fields have the same name
/// @author sgrekhov22@gmail.com

main() {
  var (n1: a1, b1, n1: c1) = (n1: 1, 2);
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (n2: a2, b2, :n2) = (n2: 1, 2);
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (:n3, :n3) = (n3: 1);
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

  final (n4: a4, b4, n4: c4) = (n4: 1, 2);
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  final (n5: a5, b5, :n5) = (n5: 1, 2);
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
  final (:n6, :n6) = (n6: 1);
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  var (n7: int a7, int b7, n7: int c7) = (n7: 1, 2);
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (n8: int a8, int b8, :int n8) = (n8: 1, 2);
//                              ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (:int n9, :int n9) = (n9: 1);
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
}
