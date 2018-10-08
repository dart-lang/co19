/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of the expression super.v = e is the static type
 * of e.
 * @description Checks that the static type of super.v = e is the static type
 * of e
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/dynamic_check.dart';

class A {
  int v;
}

class C extends A {
  test() {
    dynamic e = 3.14;
    checkTypeError(() {int x = super.v = e;});
  }
}

main() {
  C c = new C();
  c.test();
}
