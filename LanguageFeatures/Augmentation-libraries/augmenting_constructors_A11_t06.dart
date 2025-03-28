// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// ...
///   - Add initializers (and/or asserts) to the initializer list, as well as a
///     `super`  call at the end of the initializer list.
///
/// @description Checks that the result of applying the augmenting constructor
/// has an initializer list containing first the assertions and field
/// initializers of the augmented constructor, then the assertions and field
/// initializers of the augmenting constructor, and finally super-initializer of
/// either the augmented or augmenting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';

class A {
  int z;
  A(this.z);
}

class C extends A {
  int x, y;
  C(int x, int y, int z): this.x = x, assert(x++ == 0), super(z);
  C.foo(int x, int y, int z): this.x = x, assert(y++ == 0);
  C.bar(int x, int y, int z);
}

augment class C {
  augment C(int x, int y, int z): assert(x++ == 1), this.y = y;
  augment C.foo(int x, int y, int z): this.y = y, assert(y++ == 1), super(++z);
  augment C.bar(int x, int y, int z): this.x = x, this.y = y, super(z);
}

main() {
  C c1 = C(0, 0, 0);
  Expect.equals(0, c1.x);
  Expect.equals(0, c1.y);
  Expect.equals(0, c1.z);

  C c2 = C.foo(0, 0, 0);
  Expect.equals(0, c2.x);
  Expect.equals(1, c2.y);
  Expect.equals(1, c2.z);

  C c3 = C.bar(0, 0, 0);
  Expect.equals(0, c3.x);
  Expect.equals(0, c3.y);
  Expect.equals(0, c3.z);
}
