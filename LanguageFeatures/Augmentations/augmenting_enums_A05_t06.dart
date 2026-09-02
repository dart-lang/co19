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
/// @description Checks that it is not an error to augment enum's `index`,
/// `hashCode` or `==` members by an incomplete declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E1 {
  e0;
}

augment enum E1 {
  ;
  augment int get index;
}

enum E2 {
  e0;
}

augment enum E2 {
  ;
  augment int get hashCode;
}

enum E3 {
  e0;
}

augment enum E3 {
  ;
  augment bool operator ==(Object other);
}

main() {
  print(E1.e0.index);
  print(E2.e0.hashCode);
  print(E3.e0 == E3.e0);
}
