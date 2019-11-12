/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 *           Member invocation on target X	     Corresponding member name
 * X[expr1]++, X[expr1]--, ++X[expr1], --X[expr1]	            []
 * @description Check explicit extension member invocation in form of --X[expr1]
 * @issue 39198
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods
import "../../Utils/expect.dart";

class C {
  int value;
  C() : value = 0 {}
  init() {
    value = 0;
  }
  C operator [](int index) {
    this.value += index;
    return this;
  }
  void operator []=(int index, C other) {
    this.value += other.value + index;
  }
  C operator -(int val) {
    this.value += val;
    return this;
  }
}

extension Extension1 on C {
  C operator [](int index) {
    this.value += index + 1;
    return this;
  }
  void operator []=(int index, C other) {
    this.value += other.value + index + 1;
  }
  C operator -(int val) {
    Expect.fail("Extension1 - operator mustn't be called");
    return this;
  }
}

extension Extension2 on C {
  C operator [](int index) {
    this.value += index + 2;
    return this;
  }
  void operator []=(int index, C other) {
    this.value += other.value + index + 2;
  }
  C operator -(int val) {
    Expect.fail("Extension2 - operator mustn't be called");
    return this;
  }
}

main() {
  C c = C();
  --Extension1(c)[42];
  Expect.equals(131, c.value);

  c.init();
  --Extension2(c)[42];
  Expect.equals(134, c.value);

  c.init();
  --c[42];
  Expect.equals(128, c.value);
}
