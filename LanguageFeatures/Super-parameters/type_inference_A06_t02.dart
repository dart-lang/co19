// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We also copy the default value of the associated
/// super-constructor if applicable:
/// ...
/// It’s then a compile-time error if p is optional, its type is potentially
/// non-nullable and it still does not have a default value.
///
/// @description Check that it’s then a compile-time error if p is optional, its
/// type is potentially non-nullable and it still does not have a default value.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

class S {
  var s1;
  S([this.s1]);
}

class C extends S {
  num c1;
  C(this.c1, [int super.s1, num x]);
//            ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(42);
}
