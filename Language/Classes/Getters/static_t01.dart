/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A getter definition that is prefixed with the static modifier 
 * defines a static getter
 * @description Checks that non-static getter cannot be called as static one.
 * Compile error occurs
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C1 {
  int get g1 => 0;
  get g2 => null;
}

class C2 extends C1 {
  int get g3 => 0;
}

main() {
  C1.g1; //# 01: compile-time error
  C1.g2; //# 02: compile-time error
  C2.g1; //# 03: compile-time error
  C2.g2; //# 04: compile-time error
  C2.g3; //# 05: compile-time error
}
