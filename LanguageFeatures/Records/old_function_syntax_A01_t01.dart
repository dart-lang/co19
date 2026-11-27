// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In the type system, each record has a corresponding record type.
/// A record type looks similar to a function type's parameter list. The type is
/// surrounded by parentheses and may contain comma-separated positional fields:
///
/// (int, String name, bool) triple;
/// Each field is a type annotation and an optional name which isn't meaningful
/// but is useful for documentation purposes.
///
/// Named fields go inside a brace-delimited section of type and name pairs:
///
/// ({int n, String s}) pair;
/// A record type may have both positional and named fields:
///
/// (bool, num, {int n, String s}) quad;
/// ...
/// The grammar is:
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
/// @description Checks record types in declarations which use the old function
/// type syntax: type aliases and function-typed parameters. Test positional and
/// named fields, metadata, nullable types, trailing commas and field names like
/// `$1`.
/// @author sgrekhov22@gmail.com

// @dart=3.15

import "../../Utils/expect.dart";

class Meta {
  const Meta();
}

typedef (int, String name, bool) R1((int, String name, bool) r);
typedef (int i, String s, bool b) R2((int i, String s, bool b) r);
typedef (int, String, bool) R3({required (int, String, bool) r});
typedef ({int n, String s}) R4(({int n, String s}) r);
typedef (bool, num, {int n, String s}) R5((bool, num, {int n, String s}) r);
typedef (@Meta() int i, {@Meta() String s}) R6();
typedef void R7((@Meta() int i, {@Meta() String s}) r);
typedef (int? i, {String? s}) R8();
typedef void R9((int? i, {String? s}) r);
typedef (int? i, {String? s})? R10();
typedef void R11((int? i, {String? s})? r);
typedef (int,) R12();
typedef void R13((String s,) r);
typedef (int, String s,) R14();
typedef void R15((String s, int,) r);
typedef (int, {String s,}) R16();
typedef void R17(({String s, int i,}) r);
typedef ({int j}) R18();
typedef void R19(({String s}) r);
typedef (int $1, {int i}) R20();
typedef (int, {int $2}) R21();
typedef void R22((String s, {String $2}) r);

(int, {String s}) f1((int, {String s}) g((int i, String s) r)) => g((1, "a"));

int f2(int g((int,)? r, {required ({int i}) n}), [(int,)? h()?]) =>
    g(h?.call(), n: (i: 2));

class C {
  (int, {String s}) m1((int, {String s}) g((int i, String s) r)) =>
      g((3, "b"));
  static (String,) m2((String,) g(({@Meta() String s}) r)) => g((s: "c"));
}

main() {
  Expect.equals(typeOf<(int, String, bool) Function((int, String, bool))>(),
      typeOf<R1>());
  Expect.equals(typeOf<R1>(), typeOf<R2>());
  Expect.equals(
      typeOf<(int, String, bool) Function({required (int, String, bool) r})>(),
      typeOf<R3>());
  Expect.equals(typeOf<({int n, String s}) Function(({int n, String s}))>(),
      typeOf<R4>());
  Expect.equals(
      typeOf<(bool, num, {int n, String s}) Function(
          (bool, num, {int n, String s}))>(),
      typeOf<R5>());
  Expect.equals(typeOf<(int, {String s}) Function()>(), typeOf<R6>());
  Expect.equals(typeOf<void Function((int, {String s}))>(), typeOf<R7>());
  Expect.equals(typeOf<(int?, {String? s}) Function()>(), typeOf<R8>());
  Expect.equals(typeOf<void Function((int?, {String? s}))>(), typeOf<R9>());
  Expect.equals(typeOf<(int?, {String? s})? Function()>(), typeOf<R10>());
  Expect.equals(typeOf<void Function((int?, {String? s})?)>(), typeOf<R11>());
  Expect.equals(typeOf<(int,) Function()>(), typeOf<R12>());
  Expect.equals(typeOf<void Function((String,))>(), typeOf<R13>());
  Expect.equals(typeOf<(int, String) Function()>(), typeOf<R14>());
  Expect.equals(typeOf<void Function((String, int))>(), typeOf<R15>());
  Expect.equals(typeOf<(int, {String s}) Function()>(), typeOf<R16>());
  Expect.equals(typeOf<void Function(({String s, int i}))>(), typeOf<R17>());
  Expect.equals(typeOf<({int j}) Function()>(), typeOf<R18>());
  Expect.equals(typeOf<void Function(({String s}))>(), typeOf<R19>());
  Expect.equals(typeOf<(int, {int i}) Function()>(), typeOf<R20>());
  Expect.equals(typeOf<(int, {int $2}) Function()>(), typeOf<R21>());
  Expect.equals(typeOf<void Function((String, {String $2}))>(), typeOf<R22>());

  R1 r1 = ((int, String name, bool) r) => r;
  Expect.equals((1, "", true), r1((1, "", true)));
  R3 r3 = ({required (int, String, bool) r}) => r;
  Expect.equals((2, "", false), r3(r: (2, "", false)));
  R6 r6 = () => (6, s: "s");
  Expect.equals((6, s: "s"), r6());
  R10 r10 = () => null;
  Expect.isNull(r10());
  R20 r20 = () => (20, i: 0);
  Expect.equals(20, r20().$1);

  Expect.equals((1, s: "a"), f1(((int i, String s) r) => (r.$1, s: r.$2)));
  Expect.equals(2, f2(((int,)? r, {required ({int i}) n}) => n.i));
  Expect.equals(3, f2(((int,)? r, {required ({int i}) n}) => r!.$1 + n.i,
      () => (1,)));
  Expect.equals((3, s: "b"),
      C().m1(((int i, String s) r) => (r.$1, s: r.$2)));
  Expect.equals(("c",), C.m2((({String s}) r) => (r.s,)));
}
