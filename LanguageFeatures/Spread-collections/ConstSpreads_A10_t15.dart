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
 * @description: Checks that constant map spread [...?] element can only be
 * constant map or null
 * @author iarkh@unipro.ru
 */

const l1 = [];
List l2 = [];

const s1 = {11};
Set s2 = {};

Map m = {2: 2};

const int i1 = 25;
int i2 = 25;

main() {
  const Map res1= const {...?l1};  //# 01: compile-time error
  const Map res2 = const {...?l2}; //# 02: compile-time error
  const Map res3 = const {...?s1}; //# 03: compile-time error
  const Map res4 = const {...?s2}; //# 04: compile-time error
  const Map res5 = const {...?m};  //# 05: compile-time error
  const Map res6 = const {...?i1}; //# 06: compile-time error
  const Map res7 = const {...?i2}; //# 07: compile-time error
}
