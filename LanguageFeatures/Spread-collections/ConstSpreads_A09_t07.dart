/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A spreadElement starting with [...] is a constant element if its expression
 * is constant and it evaluates to a constant List, Set or Map instance
 * originally created by a list, set or map literal. It is a potentially
 * constant element if the expression is a potentially constant expression.
 * @description: Checks that constant list spread element cannot be [Map], [int]
 * or [null].
 * @author iarkh@unipro.ru
 */

main() {
  const List res1 = const [...{1: 2, 3: 4}]; //# 01: compile-time error
  const List res2 = const [...44];           //# 02: compile-time error
  const List res3 = const [...null];         //# 03: compile-time error
}
