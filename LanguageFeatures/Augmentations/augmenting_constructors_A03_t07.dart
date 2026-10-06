// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is a compile-time error when more than one
/// augmenting factory constructor declaration specify default values. Test the
/// case when one constructor is declared using the keyword `factory` and
/// another has the same name as the enclosing class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1 {
  C1._(int _);
  factory([int x]);
}

augment class C1 {
  augment factory C1([int x = 0]) => C1._(x);
}

augment class C1 {
  augment factory([int x = 0]);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2._(int _);
  factory C2({int x});
}

augment class C2 {
  augment factory({int x = 0}) => C2._(x);
}

augment class C2 {
  augment factory C2({int x = 0});
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0._();

  const E1._();
  factory([int x]);
}

augment enum E1 {
  ;
  augment factory E1([int x = 0]) => E1.e0;
}

augment enum E1 {
  ;
  augment factory([int x = 0]);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0._();

  const E2._();
  factory E2({int x});
}

augment enum E2 {
  ;
  augment factory({int x = 0}) => E2.e0;
}

augment enum E2 {
  ;
  augment factory E2({int x = 0});
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1._(int id) {
  factory([int x]);
}

augment extension type ET1 {
  augment factory ET1([int x = 0]) => ET1._(x);
}

augment extension type ET1 {
  augment factory([int x = 0]);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int id) {
  factory ET2({int x});
}

augment extension type ET2 {
  augment factory({int x = 0}) => ET2._(x);
}

augment extension type ET2 {
  augment factory ET2({int x = 0});
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET1);
  print(ET2);
}
