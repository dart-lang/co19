// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a function declaration does not declare a return type
/// explicitly, its return type is dynamic, unless it is a constructor, in which
/// case it is not considered to have a return type, or it is a setter or
/// operator []=, in which case its return type is void
///
/// @description Checks that return type of a constructor is the immediately
/// enclosing class.
/// @author ngl@unipro.ru

import "../../../Utils/expect.dart";

class A {
  A() {}
  A.b() {}
}

class C {
  const C();
  const C.c();
}

main() {
  Expect.isTrue(new A() is A);
  Expect.isTrue(new A.b() is A);
  Expect.isTrue(const C() is C);
  Expect.isTrue(const C.c() is C);
  Expect.runtimeIsType<A>(new A());
  Expect.runtimeIsType<A>(new A.b());
  Expect.runtimeIsType<C>(new C());
  Expect.runtimeIsType<C>(new C.c());
}
