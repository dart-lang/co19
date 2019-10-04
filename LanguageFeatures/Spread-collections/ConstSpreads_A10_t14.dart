/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collection Spec:
 * A [spreadElement] starting with [...?] is a constant element if its
 * expression is constant and it evaluates to [null] or a constant [List], [Set]
 * or [Map] instance originally created by a list, set or map literal. It is a
 * potentially constant element if the expression is potentially constant
 * expression.
 * @description: Checks that constant map spread [...?] element can be constant
 * map
 * @author iarkh@unipro.ru
 */

const m1 = {1: 1};
const m2 = {};
const n = null;

main() {
  const Map res1 = const {...?m1};
  const Map res2 = const {...?m2};
  const Map res3 = const {...?n};
}
