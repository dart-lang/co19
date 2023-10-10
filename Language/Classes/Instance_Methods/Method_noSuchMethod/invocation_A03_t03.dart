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
/// @description Checks that `Object.noSuchMethod` invoked when a torn-off
/// forwarder is called with an actual argument list which does not match the
/// formal parameter list
/// @author sgrekhov22@gmail.com
/// @issue 53676

import "../../../../Utils/expect.dart";

mixin class A {
  noSuchMethod(Invocation i) => "A";
}

class C1 extends A {
  String foo();
}

class C2 with A {
  String foo();
}

mixin M on A {
  String foo();
}

class MA = A with M;

enum E with A {
  e1, e2;
  String foo();
}

void main() {
  C1 c1 = C1();
  Function f1 = c1.foo;
  Expect.equals("A", f1());
  Expect.throws(() {
    f1(42); // Invokes ‘Object.noSuchMethod‘, which throws.
  });

  C2 c2 = C2();
  Function f2 = c2.foo;
  Expect.equals("A", f2());
  Expect.throws(() {
    f2(42);
  });

  MA ma = MA();
  Function f3 = ma.foo;
  Expect.equals("A", f3());
  Expect.throws(() {
    f3(42);
  });

  Function f4 = E.e1.foo;
  Expect.equals("A", f4());
  Expect.throws(() {
    f4(42);
  });
}
