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
 * v, throws a runtime error if v is null. Test identifier
 * @static-warning
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 39724
 * @issue 41193
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class A {
  String s = "Show must go on";
  foo() {}
  Object? get getNull => null;
  Object? operator [](int index) => null;
  void operator []=(int index, String val) {
    s = val;
  }
}

main() {
  A? a = null;
  Expect.throws(() {a!;});
  Expect.throws(() {a!.foo();});
  Expect.throws(() {a![42];});
  Expect.throws(() {a!?.foo();});                 /// static type warning
  Expect.throws(() {a!?[42];});                   /// static type warning
  Expect.throws(() {a!.s = "Lily was here";});
  Expect.throws(() {a![0] = "Lily was here";});
  A? a1 = new A();
  if (a1 != null) {
    Expect.throws(() {a1.getNull!;});
    Expect.throws(() {a1[42]!;});
  }
}
