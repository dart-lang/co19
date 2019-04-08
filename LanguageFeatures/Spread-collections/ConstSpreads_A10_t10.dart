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
  const res1 = {...?l1};
  const res2 = {1, ...?l1, 2};
  const res3 = {...?l2};               //# 01: compile-time error

  const res4 = {...?s1};
  const res5 = {1, ...?s1, 2};
  const res6 = {...?s2};               //# 02: compile-time error

  const res7 = {...?l1, 123: 2};       //# 03: compile-time error
  const res8 = {14: 3, ...?s1};        //# 04: compile-time error

  const res9  = {...?m1};
  const res10 = {2: 1, ...?m1, 3: 14};
  const res11 = {...?m1, 13};          //# 05: compile-time error
  const res12 = {...?m2};              //# 06: compile-time error

  const res13 = {...?i1};              //# 07: compile-time error
  const res14 = {...?i2};              //# 08: compile-time error
  const res15 = {...?n};               //# 09: compile-time error
  const res16 = {...?null};            //# 10: compile-time error
}
