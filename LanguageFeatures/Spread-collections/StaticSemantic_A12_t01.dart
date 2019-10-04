/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion n/a
 * @description: Checks that list with spread element cannot reference itself
 * @author iarkh@unipro.ru
 */

main() {
  List l1  = [...l1];         //# 01: compile-time error
  List l2  = [...[l2]];       //# 02: compile-time error
  List l3  = [...{l3}];       //# 03: compile-time error
  List l4  = [...[...l4]];    //# 04: compile-time error
  List l5  = [...{...l5}];    //# 05: compile-time error

  List l6  = [...?l6];        //# 06: compile-time error
  List l7  = [...?[l7]];      //# 07: compile-time error
  List l8  = [...?{l8}];      //# 08: compile-time error
  List l9  = [...?[...?l9]];  //# 09: compile-time error
  List l10 = [...?{...?l10}]; //# 10: compile-time error
}
