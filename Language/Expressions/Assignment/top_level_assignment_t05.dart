/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form v = e proceeds as
 * follows:
 * Let d be the innermost declaration whose name is v or v =, if it exists.
 * ...
 * If d is the declaration of a library variable, top level getter or top level
 * setter, the expression e is evaluated to an object o. Then the setter v = is
 * invoked with its formal parameter bound to o. The value of the assignment
 * expression is o.
 * @description Checks that if d is top level getter, then the setter v= is
 * invoked with and this causes compile error
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

int get v => 0;

main() {
  v = 1;
}
