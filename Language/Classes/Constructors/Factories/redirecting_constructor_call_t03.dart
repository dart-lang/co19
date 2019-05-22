/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
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
 * Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
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
