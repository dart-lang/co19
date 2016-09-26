/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form super.v = e proceeds as
 * follows:
 * ...
 * Let Sstatic be the superclass of the immediately enclosing class. It is a
 * static type warning if Sstatic does not have an accessible instance setter
 * named v = unless Sstatic or a superinterface of Sstatic is annotated with an
 * annotation denoting a constant identical to the constant @proxy defined in
 * dart:core.
 * It is a static type warning if the static type of e may not be assigned to
 * the static type of the formal parameter of the setter v =.
 * @description Checks that it is a compile error if Sstatic does not have an
 * accessible instance setter named v =
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class A {
}

class C extends A {
  test() {
    super.v = 1;
  }
}

main() {
  C c = new C();
  c.test();
}
