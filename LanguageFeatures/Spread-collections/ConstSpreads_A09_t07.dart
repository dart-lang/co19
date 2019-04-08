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
 * @description: Checks that constant map spread element can be constant map
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

const l1 = [];
List l2 = [];

const s1 = {11};
Set s2 = {};

const m1 = {1: 1};
Map m2 = {2: 2};

const int i1 = 25;
int i2 = 25;

const n = null;

main() {
  const Map res1 = const {...l1}; //# 01: compile-time error
  const Map res2 = const {...l2}; //# 02: compile-time error

  const Map res3 = const {...s1}; //# 03: compile-time error
  const Map res4 = const {...s2}; //# 04: compile-time error

  const Map res5 = const {...m1};
  const Map res6 = const {...m2}; //# 05: compile-time error

  const Map res7 = const {...i1}; //# 06: compile-time error
  const Map res8 = const {...i2}; //# 07: compile-time error

  const Map res9 = const {...n};  //# 08: compile-time error
}
