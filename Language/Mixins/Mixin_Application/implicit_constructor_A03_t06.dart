// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each generative constructor of the form
/// `Sq(T1 a1, ..., Tk ak, {Tk+1 ak+1 = d1, ..., Tk+n ak+n = dn})` of `S` that
/// is accessible to `LC`, `C` has an implicitly declared constructor of the
/// form `Cq(T1 a1, ... , Tk ak, {Tk+1 ak+1 = d′1, ... , Tk+n ak+n = d′n})
///     : superq(a1, ... , ak, ak+1: ak+1, ..., ap: ap);`
/// where `Cq` is obtained from `Sq` by replacing occurrences of `SN` which
/// denote the superclass by `N`, `superq` is obtained from `Sq` by replacing
/// occurrences of `SN` which denote the superclass by super, and
/// `d′i, i ∈ 1..n`, is a constant expression evaluating to the same value as
/// `di`. If `Sq` is a generative const constructor, and `M` does not declare
/// any fields, `Cq` is also a const constructor.
///
/// @description Checks that if `Sq` is a generative const constructor, and `M`
/// does not declare any instance variables, `Cq` is also a const constructor.
/// @author sgrekhov22@gmail.com
/// @issue 59796

import "../../../Utils/expect.dart";

class A {
  final bool v1;
  final num v2;
  const A(bool this.v1, {num this.v2 = 3.14});
}

mixin M {
  static int x = 0;
}

class MA = A with M;

main() {
  MA ma = const MA(true, v2: 2);
  Expect.isTrue(ma.v1);
  Expect.equals(2, ma.v2);

  ma = const MA(false);
  Expect.isFalse(ma.v1);
  Expect.equals(3.14, ma.v2);
}
