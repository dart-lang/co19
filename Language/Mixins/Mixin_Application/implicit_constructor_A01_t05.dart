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
/// does not declare any instance variables then `Cq` is also a const
/// constructor.
/// @author sgrekhov22@gmail.com
/// @issue 59796

import "../../../Utils/expect.dart";

class A {
  final bool v1;
  final num v2;
  const A(this.v1, this.v2);
}

mixin M on A {
  static int x = 0;
}

class MA = A with M;

main() {
  MA ma = const MA(true, 2);
  Expect.equals(true, ma.v1);
  Expect.equals(2, ma.v2);
}
