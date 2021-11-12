// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s also a compile-time error if a constructor has a positional
/// super-parameter and the super-constructor invocation at the end of its
/// initializer list has a positional argument.
///
/// @description Check that it is no compile-time error if a constructor has a
/// positional super-parameter and the super-constructor invocation at the end
/// of its initializer list has a named argument
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

import "../../Utils/expect.dart";

class S {
  int s1;
  int s2 = 0;
  S({required int s1}) : this.s1 = s1;
}

class C extends S {
  int i1;
  int i2;
  C(this.i1, super.s2, int i) : this.i2 = i, super(s1: i);
}
main() {
  Expect.equals(3, C(1, 2, 3).s1);
  Expect.equals(2, C(1, 2, 3).s2);
  Expect.equals(1, C(1, 2, 3).i1);
  Expect.equals(3, C(1, 2, 3).i2);
}
