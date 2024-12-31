// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each generative constructor of the form
/// `Sq(T1 a1, . . ., Tk ak)` of `S` that is accessible to `LC`, `C` has an
/// implicitly declared constructor of the form
/// `Cq(T1 a1, ..., Tk ak): superq(a1, . . ., ak);` where `Cq` is obtained from
/// `Sq` by replacing occurrences of `SN`, which denote the superclass, by `N`,
/// and `superq` is obtained from `Sq` by replacing occurrences of `SN` which
/// denote the superclass by super. If `Sq` is a generative const constructor,
/// and `C` does not declare any instance variables, `Cq` is also a const
/// constructor.
///
/// @description Checks that if `Sq` is a generative const constructor, and `C`
/// declares an instance variable then `Cq` is not a const constructor.
/// @author sgrekhov22@gmail.com

class A {
  final int a;
  const A(this.a);
}

mixin M on A {
  final int x = 0;
}

class MA = A with M;

main() {
  MA ma = const MA(0);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
