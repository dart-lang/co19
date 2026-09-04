// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An introductory `enum` declaration introduces implicit
/// introductory and complete declarations of:
/// - `int get index`
/// - `int get hashCode`
/// - `bool operator ==(Object)`
/// - `static const List<E> values;` where `E` is the enum type.
/// For ordering purposes, these implicit declarations are before any members
/// declared in the declaration.
///
/// @description Checks that it is a compile-time error if an augmentation adds
/// an instance member or an enum value named `values`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E1 {
  e0;
}

augment enum E1 {
  values;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
}

augment enum E2 {
  ;
  List<E2> get values => [e0];
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e0;
}

augment enum E3 {
  ;
  void values() {}
//     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4 {
  e0;
}

augment enum E4 {
  ;
  final int values = 0;
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E5 {
  e0;
}

augment enum E5 {
  ;
  void set values(int _) {}
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
}
