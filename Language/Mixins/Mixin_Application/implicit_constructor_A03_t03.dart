// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each generative constructor of the form
/// Sq(T1 a1, ..., Tk ak, {Tk+1 ak+1 = d1, ..., Tk+n ak+n = dn}) of S that is
/// accessible to LC, C has an implicitly declared constructor of the form
/// Cq(T1 a1, ... , Tk ak, {Tk+1 ak+1 = d′1, ... , Tk+n ak+n = d′n})
///     : superq(a1, ... , ak, ak+1: ak+1, ..., ap: ap);
/// where Cq is obtained from Sq by replacing occurrences of SN which denote the
/// superclass by N, superq is obtained from Sq by replacing occurrences of SN
/// which denote the superclass by super, and d′i, i ∈ 1..n, is a constant
/// expression evaluating to the same value as di.
///
/// @description Checks that for each generative constructor of the form
/// Sq(T1 a1, ..., Tk ak, {Tk+1 ak+1 = d1, ..., Tk+n ak+n = dn}) a mixin
/// application implicitly declares constructor of the form
/// Cq(T1 a1, ... , Tk ak, {Tk+1 ak+1 = d′1, ... , Tk+n ak+n = d′n})
///     : superq(a1, ... , ak, ak+1: ak+1, ..., ap: ap);
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

class A {
  bool v1;
  num v2;
  A(bool this.v1, {required num this.v2});
}

mixin class M1 {}

class C = A with M1;

main() {
  C c1 = C(true, v2: 2);
  Expect.isTrue(c1.v1);
  Expect.equals(2, c1.v2);
}
