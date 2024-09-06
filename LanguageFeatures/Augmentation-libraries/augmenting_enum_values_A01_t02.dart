// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Enum values can only be augmented by enum values, and the
/// implicit getter introduced by them is not augmentable.
///
/// @description Checks that it is a compile-time error to augment enum's
/// `values` getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_enum_values_A01_t02_lib.dart';

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
