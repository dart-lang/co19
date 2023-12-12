// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the dynamic semantics, assume that k is a redirecting factory
/// constructor and k′ is the redirectee of k
///
/// It is a dynamic type error if an actual argument passed in an invocation of
/// k is not a subtype of the actual type of the corresponding formal parameter
/// in the declaration of k.
///
/// @description Checks that it is a dynamic type error if an actual argument
/// type of a redirecting factory constructor call is not a subtype of the
/// actual type of its corresponding formal parameter. Test the case when the
/// constructor which is actually invoked would be satisfied by that argument if
/// called directly.
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

class F {
  factory F(int x) = C;
  factory F.foo(int x, [int y]) = C.foo;
  factory F.bar(int x, {int z}) = C.bar;
}

class C implements F {
  num x, y = 1, z = 2;

  C(this.x);
  C.foo(this.x, [this.y = 1]);
  C.bar(this.x, {this.z = 2});
}

enum E {
  e1, e2;
  const E();

  factory E.g1(num x) => E.e1;
  factory E.g2(num x, [num y = 1]) => E.e1;
  factory E.g3(num x, {num z = 2}) => E.e1;
  factory E.f1(int x) = E.g1;
  factory E.f2(int x, [int y]) = E.g2;
  factory E.f3(int x, {int z}) = E.g3;
}

main() {
  Expect.throws(() {F(3.14 as dynamic);});
  Expect.throws(() {F.foo(1.1 as dynamic, 3.14 as dynamic);});
  Expect.throws(() {F.bar(3.14 as dynamic, z: 1.1 as dynamic);});
  Expect.throws(() {E.f1(3.14 as dynamic);});
  Expect.throws(() {E.f2(4.2 as dynamic, 1.1 as dynamic);});
  Expect.throws(() {E.f3(3.14 as dynamic, z: 1.1 as dynamic);});
}
