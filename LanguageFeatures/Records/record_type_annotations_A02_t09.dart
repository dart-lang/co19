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
/// @description Checks that records may have metadata
/// @author sgrekhov22@gmail.com

class Meta {
  const Meta();
}

typedef R1 = (@Meta() int i, @Meta() String s);
typedef R2 = (@Meta() int i,{@Meta() String s});
typedef R3 = ({@Meta() int i, @Meta() String s});

typedef (@Meta() int i, {@Meta() String s}) R4();
typedef void R5((@Meta() int i, {@Meta() String s}) r);

(@Meta() int i, {@Meta() String s}) foo() => (42, s: "");

void bar((@Meta() int i, {@Meta() String s}) r) {}

main() {
  (@Meta() int i, @Meta() String s) r1 = (42, "");
  (@Meta() int i, {@Meta() String s}) r2 = (42, s: "");
  ({@Meta() int i, @Meta() String s}) r3 = (i: 42, s: "");
}
