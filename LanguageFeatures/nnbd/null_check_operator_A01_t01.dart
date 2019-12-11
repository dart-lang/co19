/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e! evaluates e to a value v, throws a
 * runtime error if v is null, and otherwise evaluates to v.
 *
 * @description Check that an expression of the form e! evaluates e to a value
 * v, throws a runtime error if v is null. Test class
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 39724
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {
  foo() {}
  Object? get getNull => null;
  Object? operator [](int index) => null;
}

main() {
  A? a = null;
  Expect.throws(() {a!;});
  Expect.throws(() {a!.foo();});
  Expect.throws(() {a![42];});
  Expect.throws(() {a!?.foo();});
  Expect.throws(() {a!?.[42];});
  a = new A();
  if (a != null) {
    Expect.throws(() {
      a.getNull!;
    });
    Expect.throws(() {
      a[42]!;
    });
  }
}
