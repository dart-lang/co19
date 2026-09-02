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
/// @description Checks that it is a compile-time error to augment enum's
/// `values` getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E1 {
  e0;
}

augment enum E1 {
  ;
  augment static List<E1> get values;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
}

augment enum E2 {
  ;
  augment static List<E2> get values => [e0];
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
}
