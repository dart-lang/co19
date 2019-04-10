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
 * @description: Checks that constant set spread element cannot be non-constant,
 * cannot be [null] and cannot be of the type which is not [List] or [Set]
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

List l = [];
Set s = {11};

const m1 = {1: 1};
Map m2 = {2: 2};

const int i1 = 25;
int i2 = 25;

const n = null;

main() {
  const Set res1  = const {...l};  //# 01: compile-time error
  const Set res2  = const {...s};  //# 02: compile-time error
  const Set res3  = const {...m1}; //# 03: compile-time error
  const Set res4  = const {...m2}; //# 04: compile-time error
  const Set res5  = const {...i1}; //# 05: compile-time error
  const Set res6  = const {...i2}; //# 06: compile-time error
  const Set res7  = const {...n};  //# 07: compile-time error

  const Set res8  = const {...?l};  //# 08: compile-time error
  const Set res9  = const {...?s};  //# 09: compile-time error
  const Set res10 = const {...?m1}; //# 10: compile-time error
  const Set res11 = const {...?m2}; //# 11: compile-time error
  const Set res12 = const {...?i1}; //# 12: compile-time error
  const Set res13 = const {...?i2}; //# 13: compile-time error

}
