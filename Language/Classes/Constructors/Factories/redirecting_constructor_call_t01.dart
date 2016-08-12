/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Calling a redirecting factory constructor k causes the
 * constructor k' denoted by type (respectively, type.identifier) to be called
 * with the actual arguments passed to k, and returns the result of k' as the
 * result of k. The resulting constructor call is governed by the same rules
 * as an instance creation expression using new.
 * @description Checks that a call to redirecting factory constructor indeed
 * results in a call to referenced constructor with the same actual arguments.
 * @author ilya
 */
import "../../../../Utils/expect.dart";

class F {
  factory F(x) = C;
  factory F.foo(x, [y]) = C.foo;
  factory F.bar(x, {z}) = C.bar;
}

class C implements F {
  var x, y, z;

  C(this.x);
  C.foo(this.x, [this.y]);
  C.bar(this.x, {this.z});
}

main() {
  C f = new F(1);
  Expect.isTrue(f is C);
  Expect.equals(1, f.x);

  f = new F.foo(1, 2);
  Expect.isTrue(f is C);
  Expect.equals(1, f.x);
  Expect.equals(2, f.y);

  f = new F.bar(1, z:3);
  Expect.equals(1, f.x);
  Expect.equals(3, f.z);
}
