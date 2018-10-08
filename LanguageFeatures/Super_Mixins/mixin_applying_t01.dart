/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixin introduced by A can then only be applied to classes that
 * implement both B and C.
 *
 * @description Checks that mixin declaration can only be applied to classes
 * that implement both B and C.
 * @author ngl@unipro.ru
 */

abstract class B {
  int get gb1;
}
abstract class C {
  int get gc1;
}

mixin M on B, C {}

class MA with M {
  int get gb1 => 1;
  int get gc1 => 2;
}

main() {
  new MA();
}
