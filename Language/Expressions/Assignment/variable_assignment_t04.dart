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
 * If d is the declaration of a local variable, the expression e is evaluated to
 * an object o. Then, the variable v is bound to o unless v is final or const,
 * in which case a dynamic error occurs. If no error occurs, the value of the
 * assignment expression is o.
 * @description Checks that if v is final then compile error occurs
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

main() {
  final int v = 0;
  v = 1;
}
