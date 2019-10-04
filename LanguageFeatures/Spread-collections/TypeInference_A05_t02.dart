/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Spec:
 * We require that at least one component unambiguously determine the literal
 * form, otherwise it is a compile-time error. So, given:
 *    dynamic x = <int, int>{};
 *    Iterable l = [];
 *    Map m = {};
 *    Then:
 *    {...x}       // Static error, because it is ambiguous.
 *    {...x, ...l} // Statically a set, runtime error when spreading x.
 *    {...x, ...m} // Statically a map, no runtime error.
 *    {...l, ...m} // Static error, because it must be both a set and a map.
 * @description Checks that for dynamic x {...?x} is a static error
 * @author iarkh@unipro.ru
 */

main() {
  dynamic x1 = <int, int>{};
  dynamic x2 = <int>{};
  dynamic x3 = [1, 2, 3];
  dynamic x4 = 14;

  var y1 = {...?x1};   //# 01: compile-time error
  var y2 = {...?x2};   //# 02: compile-time error
  var y3 = {...?x3};   //# 03: compile-time error
  var y4 = {...?x4};   //# 04: compile-time error
}
