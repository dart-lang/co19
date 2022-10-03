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
/// No fields and a trailing comma. The expression (,) isn't allowed.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: ('pos', $0: 'named') since the named field '$0' collides
/// with the getter for the first positional field.
///
/// @description Checks that it is a compile-time error if a record has a field
/// named `hashCode`, `runtimeType`, `noSuchMethod`, or `toString`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

Record foo1() => (42, name: "Lily was here", hashCode: "Hello");
//                                           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Record foo2() => (42, name: "Lily was here", runtimeType: String);
//                                           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Record foo3() => (42, name: "Hello", noSuchMethod: (Invocationi) => null);
//                                   ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Record foo4() => (42, name: "Lily was here", toString: "String");
//                                           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void bar(Record r) {}

main() {
  bar((x: 42, hashCode: 42));
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar((x: 42, runtimeType: 42));
//            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar((x: 42, noSuchMethod: 42));
//            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bar((x: 42, toString: 42));
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
