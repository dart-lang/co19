// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a constructor (or any function) has
/// two parameter declarations with the same name.
///
/// @description Check that it is a compile-time error if a constructor has
/// two parameter declarations with the same name.
/// @author sgrekhov@unipro.ru

class S {
  int s1;
  S(this.s1);
}

class C extends S {
  int i1;
  C(this.i1, super.s1, [super.s1 = 0]);
//                      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
main() {
  C(1, 2);
}
