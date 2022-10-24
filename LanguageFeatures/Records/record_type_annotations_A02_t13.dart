// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar is:
///
/// // Existing rules:
/// type                   ::= functionType '?'?      // Existing production.
///                          | recordType             // New production.
///                          | typeNotFunction        // Existing production.
///
/// typeNotFunction        ::= 'void'                 // Existing production.
///                          | recordType             // New production.
///                          | typeNotVoidNotFunction // Existing production.
///
/// // New rules:
/// recordType            ::= '(' recordTypeFields ',' recordTypeNamedFields ')'
///                          | '(' recordTypeFields ','? ')'
///                          | '(' recordTypeNamedFields ')'
///
/// recordTypeFields       ::= recordTypeField ( ',' recordTypeField )*
/// recordTypeField        ::= metadata type identifier?
///
/// recordTypeNamedFields  ::= '{' recordTypeNamedField
///                            ( ',' recordTypeNamedField )* ','? '}'
/// recordTypeNamedField   ::= type identifier
/// recordTypeNamedField   ::= metadata typedIdentifier
///
/// The grammar is exactly the same as parameterTypeList in function types but
/// without `()`, `required`, and optional positional parameters since those
/// don't apply to record types. A record type can't appear in an extends,
/// implements, with, or mixin on clause, which is enforced by being a
/// production in `type` and not `typeNotVoid`.
///
/// @description Checks that it is a compile-time error if `var` keyword is used
/// instead of type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R1 = (var i,);
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef R2 = ({var s});
//             ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (var i,) R3();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R5(({var s}) r);
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (var i,) foo() => (null, );
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

void bar(({var s}) r) {}
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  (var i,) r1 = (null, );
// ^^^
// [analyzer] unspecified
// [cfe] unspecified
  ({var s}) r3 = (s: null);
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
