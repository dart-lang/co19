/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form e.m proceeds
 * as follows: ...
 * Let T be the static type of e. It is a static type warning if T does not
 * have a method or getter named m
 * @description Check that it is a compile error if object instance
 * does not have a method or getter named m
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C {
}

main() {
  C c = new C();
  c.m;
}
