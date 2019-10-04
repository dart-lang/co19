/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion (Unified collections) Let [e] be a [setOrMapLiteral].
 *
 * If [e] has a context [C], and the base type of [C] is [Cbase] (that is,
 * [Cbase] is [C] with all wrapping [FutureOrs] removed), and [Cbase] is not
 * [?], then let [S] be the greatest closure.
 *
 * If [e] has [typeArguments] then:
 * ...
 * Otherwise (three or more type arguments), report a compile-time error.
 *
 * @description Checks that [setOrMapLiteral] has one type argument, it's a set.
 * @author iarkh@unipro.ru
 */

main() {
  Set aSet   = {1, 2, 3};
  List aList = [1, 2, 3];
  Map aMap   = {1: 1, 2: 2, 3: 3};

  var res1  = <int, int, int>{...aList};            //# 01: compile-time error
  var res2  = <int, int, int, int>{...aList};       //# 02: compile-time error
  var res3  = <int, int, int, int, int>{...aList};  //# 03: compile-time error

  var res4  = <int, int, int>{...?aList};           //# 04: compile-time error
  var res5  = <int, int, int, int>{...?aList};      //# 05: compile-time error
  var res6  = <int, int, int, int, int>{...?aList}; //# 06: compile-time error

  var res7  = <int, int, int>{...aSet};             //# 07: compile-time error
  var res8  = <int, int, int, int>{...aSet};        //# 08: compile-time error
  var res9  = <int, int, int, int, int>{...aSet};   //# 09: compile-time error

  var res10 = <int, int, int>{...?aSet};            //# 10: compile-time error
  var res11 = <int, int, int, int>{...?aSet};       //# 11: compile-time error
  var res12 = <int, int, int, int, int>{...?aSet};  //# 12: compile-time error

  var res13 = <int, int, int>{...aMap};             //# 13: compile-time error
  var res14 = <int, int, int, int>{...aMap};        //# 14: compile-time error
  var res15 = <int, int, int, int, int>{...aMap};   //# 15: compile-time error

  var res16 = <int, int, int>{...?aMap};            //# 16: compile-time error
  var res17 = <int, int, int, int>{...?aMap};       //# 17: compile-time error
  var res18 = <int, int, int, int, int>{...?aMap};  //# 18: compile-time error
}
