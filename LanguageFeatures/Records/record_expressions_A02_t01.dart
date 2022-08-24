// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record is created using a record expression. The grammar is:
///
/// literal      ::= record
///                | // Existing literal productions...
/// record       ::= '(' recordField ( ',' recordField )* ','? ')'
/// recordField  ::= (identifier ':' )? expression
///
/// This is identical to the grammar for a function call argument list. There
/// are a couple of syntactic restrictions not captured by the grammar. It is a
/// compile-time error if a record has any of:
///
/// The same field name more than once.
///
/// No named fields and only one positional field. This avoids ambiguity with
/// parenthesized expressions.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// @description Checks that it is a compile-time error if a record has no named
/// fields and only one positional field
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

main() {
  Record r1 = (42);
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

  Record r2 = ((42));
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
