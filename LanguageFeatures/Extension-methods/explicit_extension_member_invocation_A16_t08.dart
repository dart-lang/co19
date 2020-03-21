/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A composite member invocation on a target expression X is an
 * expression of one of the forms:
 * Composite member invocation on target X	     Corresponding member base name
 *    X.id binop= expr2	                                       id
 * @description Check explicit extension member invocation in form of
 * X.id >>= expr2
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
  C operator >>(int val) {
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
  C operator >>(int val) {
    this.value += val + 1;
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
  C operator >>(int val) {
    this.value += val + 2;
    return this;
  }
}

main() {
  C c = C();
  Extension1(c)[13] >>= 42;
  Expect.equals(128, c.value);

  c.init();
  Extension2(c)[13] >>= 42;
  Expect.equals(133, c.value);

  c.init();
  c[13] >>= 42;
  Expect.equals(13 + 42 + 55 + 13, c.value);
}
