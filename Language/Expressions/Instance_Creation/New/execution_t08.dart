// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Next, q is executed with this bound to i, the type parameters
/// (if any) of R bound to the actual type arguments V1, ..., Vm and the formal
/// parameter bindings that resulted from the evaluation of the argument list.
/// The result of the evaluation of e is i.
/// @description Checks that the result of a new expression is i (the freshly
/// allocated instance).
/// @author msyabro

import '../../../../Utils/expect.dart';

class A {}

class B {
  B(p1, p2) {}
}

class C {
  C(p1, [p2]) {}
}

class D {
  D.name() {}
}

main() {
  checkType(checkIs<A>, true, new A());
  checkType(checkIs<B>, true, new B(1, 2));
  checkType(checkIs<C>, true, new C(null, null));
  checkType(checkIs<D>, true, new D.name());
}
