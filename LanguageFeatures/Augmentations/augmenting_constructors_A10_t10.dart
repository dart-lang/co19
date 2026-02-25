// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`. or none of them have it.
/// ...
/// It is a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is a compile-time error if the signature of the
/// constructor augmentation does not match the original constructor. Test
/// incorrect optionality of parameters of a primary constructor in an
/// augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1(var int x) {}

augment class C1 {
  augment C1([int x = 0]);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(final int x) {}

augment class C2 {
  augment C2({int x = 0});
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3(var int x) {}

augment class E3 {
  augment C3({required int x});
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4([final int x = 0]) {}

augment class C4 {
  augment C4(int x);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5([var int x = 0]) {}

augment class C5 {
  augment C5({int x});
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6([final int x = 0]) {}

augment class C6 {
  augment C6({required int x});
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7({var int x = 0}) {}

augment class C7 {
  augment C7(int x);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8({final int x = 0}) {}

augment class C8 {
  augment C8([int x]);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C9({var int x = 0}) {}

augment class C9 {
  augment C9({required int x});
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C10({required final int x}) {}

augment class C10 {
  augment C10(int x);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C11({required var int x}) {}

augment class C11 {
  augment C11([int x = 0]);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C12({required final int x}) {}

augment class C12 {
  augment C12({int x = 0});
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1(final int x) {
  e0(0);
}

augment enum E1 {
  ;
  augment const E1([int x = 0]);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2(final int x) {
  e0(0);
}

augment enum E2 {
  ;
  augment const E2({int x = 0});
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3(final int x) {
  e0(0);
}

augment enum E3 {
  ;
  augment const E3({required int x});
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4([final int x = 0]) {
  e0;
}

augment enum E4 {
  ;
  augment const E4(int x);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E5([final int x = 0]) {
  e0;
}

augment enum E5 {
  ;
  augment const E5({int x});
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E6([final int x = 0]) {
  e0;
}

augment enum E6 {
  ;
  augment const E6({required int x});
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E7({final int x = 0}) {
  e0;
}

augment enum E7 {
  ;
  augment const E7(int x);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E8({final int x = 0}) {
  e0;
}

augment enum E8 {
  ;
  augment const E8([int x]);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E9({final int x = 0}) {
  e0;
}

augment enum E9 {
  ;
  augment const E9({required int x});
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E10({required final int x}) {
  e0(x: 0);
}

augment enum E10 {
  ;
  augment const E10(int x);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E11({required final int x}) {
  e0(x: 0);
}

augment enum E11 {
  ;
  augment const E11([int x = 0]);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E12({required final int x}) {
  e0(x: 0);
}

augment enum E12 {
  ;
  augment const E12({int x = 0});
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1(int x) {}

augment extension type ET1 {
  augment ET1([int x = 0]);
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(final int x) {}

augment extension type ET2 {
  augment ET2({int x = 0});
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int x) {}

augment extension type ET3 {
  augment ET3({required int x});
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
  print(C9);
  print(C10);
  print(C11);
  print(C12);
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(E6);
  print(E7);
  print(E8);
  print(E9);
  print(E10);
  print(E11);
  print(E12);
  print(ET1);
  print(ET2);
  print(ET3);
}
