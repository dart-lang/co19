// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// recordPattern         ::= '(' patternFields? ')'
/// patternFields         ::= patternField ( ',' patternField )* ','?
/// patternField          ::= ( identifier? ':' )? pattern
///
/// A record pattern matches a record object and destructures its fields. If the
/// value isn't a record with the same shape as the pattern, then the match
/// fails. Otherwise, the field subpatterns are matched against the
/// corresponding fields in the record.
///
/// Field subpatterns can be in one of three forms:
///
/// A bare `pattern` destructures the corresponding positional field from the
/// record and matches it against pattern.
///
/// An `identifier: pattern` destructures the named field with the name
/// identifier and matches it against pattern.
///
/// A `: pattern` is a named field with the name omitted. When destructuring
/// named fields, it's very common to want to bind the resulting value to a
/// variable with the same name.
///
/// As a convenience, the identifier can be omitted and inferred from pattern.
/// The subpattern must be a variable pattern which may be wrapped in a unary
/// pattern. The field name is then inferred from the name in the variable
/// pattern.
///
/// @description Checks that record patterns with a null-assert subpattern in a
/// declaration context produces a static warning
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

main() {
  var (a1!,) = (-1,);
//     ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (n: a2!) = (n: 42);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (n: a3!,
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
            b3!) = (n: 42, -1);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  final (a4!,) = (-1,);
//       ^^
// [analyzer] unspecified
// [cfe] unspecified
  final (n: a5!) = (n: 42);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
  final (n: a6!,
//          ^^
// [analyzer] unspecified
// [cfe] unspecified;
                b6!) = (n: 42, -1);
//              ^^
// [analyzer] unspecified
// [cfe] unspecified;
  final (:n2!) = (n2: 42);
//        ^^
// [analyzer] unspecified
// [cfe] unspecified

  var (num a7!,) = (-1,);
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (n: num a8!) = (n: 42);
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (n: num a9!,
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
              num b9!) = (n: 42, -3);
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
  var (:num n3!) = (n3: 42);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
}
