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
  const res1  = {...?l2};              //# 01: compile-time error
  const res2  = {...?s2};              //# 02: compile-time error
  const res3  = {...?l1, 123: 2};      //# 03: compile-time error
  const res4  = {14: 3, ...?s1};       //# 04: compile-time error
  const res5  = {...?m1, 13};          //# 05: compile-time error
  const res6  = {...?m2};              //# 06: compile-time error
  const res7  = {...?i1};              //# 07: compile-time error
  const res8  = {...?i2};              //# 08: compile-time error
  const res9  = {...?n};               //# 09: compile-time error
  const res10 = {...?null};            //# 10: compile-time error
}
