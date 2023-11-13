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
/// actual type of its corresponding formal parameter.
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

class F {
  factory F(num x) = C;
  factory F.foo(num x, [num y]) = C.foo;
  factory F.bar(num x, {num z}) = C.bar;
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
  factory E.f1(num x) = E.g1;
  factory E.f2(num x, [num y]) = E.g2;
  factory E.f3(num x, {num z}) = E.g3;
}

main() {
  Expect.throws(() {F(Object() as dynamic);});
  Expect.throws(() {F.foo(42, Object() as dynamic);});
  Expect.throws(() {F.bar(3.14, z: Object() as dynamic);});
  Expect.throws(() {E.f1(Object() as dynamic);});
  Expect.throws(() {E.f2(42, Object() as dynamic);});
  Expect.throws(() {E.f3(3.14, z: Object() as dynamic);});
}
