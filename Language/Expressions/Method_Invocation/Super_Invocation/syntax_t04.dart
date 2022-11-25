// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A super method invocation i has the form
/// super.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k).
/// @description Checks that arguments must be separated with comma.
/// @author msyabro


class S {
  f(p1, p2) {}
}

class A extends S {
  test() {
    super.f(new Object() new Object());
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new A().test();
}
