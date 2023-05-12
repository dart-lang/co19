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
/// The type () is the type of an empty record with no fields
///
/// @description Checks that it is a compile-time error if record type
/// appear in an `extends` clause
/// @author sgrekhov22@gmail.com

typedef Rec = (int i, String s);

class A extends (int i, String s) {}
//              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C extends Rec {}
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  A();
  C();
}
