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
 * @description: Checks some disambiguilty cases for sets and maps.
 * @author iarkh@unipro.ru
 */

const l = [];
const s = {11};
const m = {1: 1};

main() {
  const res1 = {...?l};
  const res2 = {1, ...?l, 2};
  const res3 = {...?s};
  const res4 = {1, ...?s, 2};
  const res5 = {...?m};
  const res6 = {2: 1, ...?m, 3: 14};

}
