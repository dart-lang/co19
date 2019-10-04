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
 * @description: Checks that constant map spread [...?] element can only be a
 * constant map or null.
 * @author iarkh@unipro.ru
 */

main() {
  const Map res1 = const {...?{1, 3}};  //# 01: compile-time error
  const Map res2 = const {...?[]};      //# 02: compile-time error
  const Map res3 = const {...?44};      //# 03: compile-time error
  const Map res4 = const {...?<int>{}}; //# 04: compile-time error
}
