/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if C does not declare a static method or getter m.
 * @description Checks that it is a static warning if C declares an instance method with the name m
 * instead of a static one.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

class C {
  m() {}
}

main() {
  try {
    C.m();
  } catch(e) {}
}
