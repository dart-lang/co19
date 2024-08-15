// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// ...
/// - Add initializers to the initializer list. If the augmenting constructor
///   has an initializer list then:
///   - It's a compile-time error if the augmented constructor has
///     super-initializer, and the augmenting constructor's initializer list
///     also contains a super-initializer.
///
/// @description Checks that it is still a compile-time error if the augmenting
/// constructor has a super-initializer not at the last position in the
/// initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A14_t02_lib.dart';

class A {
  int x;
  A(this.x);
}

class C extends A {
  C(int x);
}

main() {
  print(C);
}
