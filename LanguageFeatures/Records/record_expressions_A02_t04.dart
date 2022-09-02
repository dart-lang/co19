// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record is created using a record expression. The grammar is:
///
/// literal      ::= record
///                | // Existing literal productions...
/// record       ::= 'const'? '(' recordField ( ',' recordField )* ','? ')'
/// recordField  ::= (identifier ':' )? expression
///
/// This is identical to the grammar for a function call argument list. There
/// are a couple of syntactic restrictions not captured by the grammar. It is a
/// compile-time error if a record has any of:
///
/// The same field name more than once.
///
/// Only one positional field and no trailing comma.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: ('pos', $0: 'named') since the named field '$0' collides
/// with the getter for the first positional field.
///
/// @description Checks that it is a compile-time error if a record has more
/// than one trailing comma
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

Record foo1() => (1,,);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

Record foo2() => ((2),,);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

Record foo3() => ((3,,),);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified

Record foo4() => ((3,),,);
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

Record foo5() => (n1: 1,,);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

Record foo6() => ((2), n: 3,,);
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

Record foo7() => (1, 2, n: 3, 4,,);
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

dynamic bar(Record r) => r

main() {
  var r1 = (1,,);
//            ^
// [analyzer] unspecified
// [cfe] unspecified

  var r2 = ((2),,);
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  var r3 = ((3,),,);
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  var r4 = (n1: 1,,);
//                ^
// [analyzer] unspecified
// [cfe] unspecified

  var r5 = (1, 2, n: "n", 3,,);
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}
