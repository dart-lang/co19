/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * Description    Operator                          Associativity Precedence
 * Relational        >                                 None           8
 * @description Test that '>' relational operator has no associativity. It is
 * compile error to expect any associativity from it
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C {

  C operator >(C val) {
    return val;
  }

  C();
}

main() {
  C c1 = new C();
  C c2 = new C();
  C c3 = new C();

  C c = c1 > c2 > c3;
}
