// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the dynamic semantics, assume that k is a redirecting factory
/// constructor and k′ is the redirectee of k
/// ...
/// When the redirectee k′ is a generative constructor, let o be a
/// fresh instance of the class that contains k′. Execution of k then amounts to
/// execution of k′ to initialize o, governed by the same rules as an instance
/// creation expression. If k′ completed normally then the execution of k
/// completes normally returning o, otherwise k completes by throwing the
/// exception and stack trace thrown by k′.
///
/// @description Checks that a call to redirecting factory constructor indeed
/// results in a call to referenced constructor with the same actual arguments.
/// Test type aliases
/// @author sgrekhov@unipro.ru
/// @issue 45051

import "../../../../Utils/expect.dart";

class F {
  factory F(x) = CAlias;
  factory F.foo(x, [y]) = CAlias.foo;
  factory F.bar(x, {z}) = CAlias.bar;
}
typedef FAlias = F;

class C implements FAlias {
  var x, y, z;

  C(this.x);
  C.foo(this.x, [this.y]);
  C.bar(this.x, {this.z});
}
typedef CAlias = C;

main() {
  F f = new F(1);
  Expect.isTrue(f is C);
  if (f is C) {
    Expect.equals(1, f.x);
  }

  f = new F.foo(1, 2);
  Expect.isTrue(f is C);
  if (f is C) {
    Expect.equals(1, f.x);
    Expect.equals(2, f.y);
  }

  f = new F.bar(1, z:3);
  Expect.isTrue(f is C);
  if (f is C) {
    Expect.equals(1, f.x);
    Expect.equals(3, f.z);
  }
}
