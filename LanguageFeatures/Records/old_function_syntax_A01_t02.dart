// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// ...
/// It is a compile-time error if a record type has any of:
///
/// The same field name more than once. This is true even if one or both of the
/// colliding fields is positional. We could permit collisions with positional
/// field names since they are only used for documentation, but we disallow it
/// because it's confusing and not useful.
///
/// Only one positional field and no trailing comma. This isn't ambiguous, since
/// there are no parenthesized type expressions in Dart. But prohibiting this is
/// symmetric with record expressions and leaves the potential for later support
/// for parentheses for grouping in type expressions.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: (int, $1: int) since the named field '$1' collides with
/// the getter for the first positional field.
///
/// @description Checks that it is a compile-time error if a record type which
/// is used in a declaration with the old function type syntax doesn't conform
/// to the grammar or has a field name which is not allowed.
/// @author sgrekhov22@gmail.com

// @dart=3.15

typedef ({required int i, String s}) R1();
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R2(({required int i, String s}) r);
//                ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef ([int? i, String? s]) R3();
//       ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R4(([int? i, String? s]) r);
//               ^
// [analyzer] unspecified
// [cfe] unspecified

typedef ({int i, String s}, int j) R5();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R6(({int i, String s}, int) r);
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (var i,) R7();
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R8(({var s}) r);
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef ({int i, String s, int i}) R9();
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R10(({int i, String s, int i}) r);
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int i, {String s, int i}) R11();
//                             ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int i, int i, {String s}) R12();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R13((int i, {String s, int i}) r);
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R14((int i, int i, {String s}) r);
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int) R15();
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R16((String s) r);
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, String s,,) R17();
//                     ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R18((String s, int,,) r);
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, {String s,,}) R19();
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R20(({String s, int i,,}) r);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, {String s},) R21();
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R22(({String s, int i},) r);
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, {int hashCode}) R23();
//                 ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R24((String s, {String hashCode}) r);
//                                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, {Type runtimeType}) R25();
//                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R26((String s, {String runtimeType}) r);
//                                  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, {Function noSuchMethod}) R27();
//                      ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R28((String s, {String noSuchMethod}) r);
//                                  ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, {int toString}) R29();
//                 ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R30((String s, {String toString}) r);
//                                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int hashCode, {int i}) R31();
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R32((String hashCode, {String s}) r);
//                       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (Type runtimeType, {int i}) R33();
//            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R34((Type runtimeType, {String s}) r);
//                     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (Function noSuchMethod, {int i}) R35();
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R36((Function noSuchMethod, {String s}) r);
//                         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (String toString, {int i}) R37();
//              ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R38((String toString, {String s}) r);
//                       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, {int _n}) R39();
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R40((String s, {String _s}) r);
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int __, {int n}) R41();
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R42((String _s, {String s}) r);
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (int, {int $1}) R43();
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R44((String s, {String $1}) r);
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified

void f1(void g(({required int i, String s}) r)) {}
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f2((int) g()) {}
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f3(void g((int i, {String s, int i}) r)) {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

void f4(void g(({int i, String s}, int j) r)) {}
//                               ^
// [analyzer] unspecified
// [cfe] unspecified

void f5((int, {int hashCode}) g()) {}
//                 ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void f6(void g((String s, {String _s}) r)) {}
//                                ^^
// [analyzer] unspecified
// [cfe] unspecified

void f7((int, {int $1}) g()) {}
//                 ^^
// [analyzer] unspecified
// [cfe] unspecified

void f8(void g(([int? i, String? s]) r)) {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(R1);
  print(R2);
  print(R3);
  print(R4);
  print(R5);
  print(R6);
  print(R7);
  print(R8);
  print(R9);
  print(R10);
  print(R11);
  print(R12);
  print(R13);
  print(R14);
  print(R15);
  print(R16);
  print(R17);
  print(R18);
  print(R19);
  print(R20);
  print(R21);
  print(R22);
  print(R23);
  print(R24);
  print(R25);
  print(R26);
  print(R27);
  print(R28);
  print(R29);
  print(R30);
  print(R31);
  print(R32);
  print(R33);
  print(R34);
  print(R35);
  print(R36);
  print(R37);
  print(R38);
  print(R39);
  print(R40);
  print(R41);
  print(R42);
  print(R43);
  print(R44);
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
  print(f6);
  print(f7);
  print(f8);
}
