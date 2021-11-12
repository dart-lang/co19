// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s also a compile-time error if a constructor has a positional
/// super-parameter and the super-constructor invocation at the end of its
/// initializer list has a positional argument.
///
/// @description Check that it is a compile-time error if a constructor has a
/// positional super-parameter and the super-constructor invocation at the end
/// of its initializer list has an optional positional argument
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

class S {
  int s1;
  int s2 = 0;
  S([this.s1 = 1, this.s2 = 2]);
}

class C extends S {
  int i1;
  int i2;
  C(this.i1, super.s2, int i) : this.i2 = i, super.n(i);
//                                                   ^
// [analyzer] unspecified
// [cfe] unspecified
}
main() {
  C(1, 2, 3);
}
