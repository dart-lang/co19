/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion n/a
 * @description: Checks that map with spread element cannot reference itself
 * @author iarkh@unipro.ru
 */

main() {
  Map m1 = {...m1};       //# 01: compile-time error
  Map m2 = {...{...m2}};  //# 02: compile-time error
  Map m3 = {...{m3}};     //# 03: compile-time error

  Map m4 = {...?m4};      //# 04: compile-time error
  Map m5 = {...{...?m5}}; //# 05: compile-time error
  Map m6 = {...{?m6}};    //# 06: compile-time error
}
