// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Some enum members can not be augmented: It is a compile-time
/// error if an augmenting declaration in an enum declaration (introductory or
/// augmenting) has the name `values`, `index`, `hashCode`, or `==`.
///
/// @description Checks that it is a compile-time error to augment enum's
/// `values` getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_enum_values_A05_t01_lib.dart';

enum E1 {
  e0;
}

enum E2 {
  e0;
}

enum E3 {
  e0;
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
