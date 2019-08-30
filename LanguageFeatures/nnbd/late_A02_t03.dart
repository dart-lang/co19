/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A read of a field or variable which is marked as late which has
 * not yet been written to causes the initializer expression of the variable to
 * be evaluated to a value, assigned to the variable or field, and returned as
 * the value of the read.
 *
 * If there is no initializer expression, the read causes a runtime error.
 *
 * @description Check that it is a runtime error to read late variable without
 * initializer expression
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A1 {
  covariant late String v;
  A1() : this.v = (this.v == "" ? "one": "two");
}

class A2 {
  covariant late String? v;
  A2() : this.v = (this.v == "" ? "one": "two");
}

class B1 {
  late final String v;
  B1() : this.v = (this.v == "" ? "one": "two");
}

class B2 {
  late final String v;
  B2() : this.v = (this.v == "" ? "one": "two");
}

class C1 {
  late String v;
  C1() : this.v = (this.v == "" ? "one": "two");
}

class C2 {
  late String v;
  C2() : this.v = (this.v == "" ? "one": "two");
}

main() {
  Expect.throws(() {new A1();});
  Expect.throws(() {new B1();});
  Expect.throws(() {new C1();});
  Expect.throws(() {new A2();});
  Expect.throws(() {new B2();});
  Expect.throws(() {new C2();});
}
