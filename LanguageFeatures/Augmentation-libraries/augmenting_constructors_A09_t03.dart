// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
///   - If the augmenting constructor has an explicit block body, then that body
///     replaces any existing constructor body.
///
/// @description Checks that it is a compile-time error to augment a default
/// unnamed constructor (that doesn't exist during augmentation).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A09_t03_lib.dart';

class C1 {}
class C2 {}

enum E1 {
  e0;
}
enum E2 {
  e0;
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
}
