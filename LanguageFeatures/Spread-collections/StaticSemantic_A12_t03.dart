/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion n/a
 * @description: Checks that set with spread element cannot reference itself
 * @author iarkh@unipro.ru
 */

main() {
  Set s1  = {...s1};         //# 01: compile-time error
  Set s2  = {...[s2]};       //# 02: compile-time error
  Set s3  = {...{s3}};       //# 03: compile-time error
  Set s4  = {...{...s4}};    //# 04: compile-time error
  Set s5  = {...[...s5]};    //# 05: compile-time error

  Set s6  = {...?s6};        //# 06: compile-time error
  Set s7  = {...?[s7]};      //# 07: compile-time error
  Set s8  = {...?{s8}};      //# 08: compile-time error
  Set s9  = {...?{...?s9}};  //# 09: compile-time error
  Set s10 = {...?[...?s10]}; //# 10: compile-time error
}
