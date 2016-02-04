/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a postfix expression of the form e1[e2]--, is
 * equivalent to executing (a, i){var r = a[i]; a[i] = r - 1; return r}(e1, e2).
 * The static type of such an expression is the static type of e1[e2].
 * @description Checks that static type of e1[e2]-- is static type of e1[e2]++
 * static-clean
 * @author sgrekhov@unipro.ru
 */

main() {
  List<int> e1 = [1, 2, 3, 4];
  int a = e1[0];
}
