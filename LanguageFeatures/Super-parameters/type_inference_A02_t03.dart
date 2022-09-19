// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We infer the type of a parameter declaration, p, of a
/// non-redirecting generative constructor, C, as:
/// ...
/// Otherwise, if the parameter is an initializing formal (this.name) the
/// inferred type of the parameter is the declared/inferred type of the instance
/// variable named name of the surrounding class (which must exist, otherwise
/// it’s a compile-time error.)
///
/// @description Check that if the parameter is an initializing formal
/// (this.name) then it must exists in the surrounding class
/// @author sgrekhov@unipro.ru

test<T>(T t) {}

class S {
  int s1;
  S(this.s1);
}

class C extends S {
  int i1;
  C(this.i1, this.s1);
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C.n(this.i1, this.s1) : super(42);
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}

main() {
  C(1, 2);
  C.n(1, 2);
}
