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
/// augmenting constructor declaration specify default values. Test the case
/// when one constructor has name `new` and another has the same name as the
/// enclosing class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1 {
  new([int x]);
}

augment class C1 {
  augment C1([int x = 0]);
}

augment class C1 {
  augment new([int x = 0]);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  C2({int x});
}

augment class C2 {
  augment new({int x = 0});
}

augment class C2 {
  augment C2({int x = 0});
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;

  new([int x]);
}

augment enum E1 {
  ;
  augment E1([int x = 0]);
}

augment enum E1 {
  ;
  augment new([int x = 0]);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;

  E2({int x});
}

augment enum E2 {
  ;
  augment new({int x = 0});
}

augment enum E2 {
  ;
  augment E2({int x = 0});
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1._(int id) {
  new(this.id, [int x]);
}

augment extension type ET1 {
  augment ET1(int id, [int x = 0]);
}

augment extension type ET1 {
  augment new(int id, [int x = 0]);
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2._(int id) {
  ET2(this.id, {int x});
}

augment extension type ET2 {
  augment new(int id, {int x = 0});
}

augment extension type ET2 {
  augment ET2(int id, {int x = 0});
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
