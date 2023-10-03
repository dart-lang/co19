// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion One special case to be aware of is where a forwarder is torn off
/// and then invoked with an actual argument list which does not match the
/// formal parameter list. In that situation we will get an invocation of
/// Object.noSuchMethod rather than the noSuchMethod in the original receiver,
/// because this is an invocation of a function object (and they do not override
/// noSuchMethod)
///
/// @description Checks that `Object.noSuchMethod` invocked in case when
/// torn-off forwarder is called with an actual argument list which does not
/// match the formal parameter list
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

mixin class A {
  noSuchMethod(Invocation i) => "A";
  String foo();
}

class C extends A {}

mixin M on A {}

class MA = A with M;

enum E with A {
  e1, e2;
}

void main() {
  C c = C();
  Function f1 = c.foo;
  Expect.equals("A", f1());
  Expect.throws(() {
    f1(42); // Invokes ‘Object.noSuchMethod‘, which throws.
  });

  MA ma = MA();
  Function f2 = ma.foo;
  Expect.equals("A", f2());
  Expect.throws(() {
    f2(42);
  });

  Function f3 = E.e1.foo;
  Expect.equals("A", f3());
  Expect.throws(() {
    f3(42);
  });
}
