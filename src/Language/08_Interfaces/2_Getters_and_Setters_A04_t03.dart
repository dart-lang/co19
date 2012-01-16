/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * These are subject to the same compile-time and static checking rules 
 * as getters and setters in classes.
 * 7.2: It is a static warning if a getter m1 overrides a getter or method m2
 * and the type of m1 is not a subtype of the type of m2.
 * @description Checks that it is a static warning if a getter m1 overrides
 * another getter m2 and the type of m1 is not a subtype of m2's.
 * @author rodionov
 * @reviewer kaigorodov
 * @static-warning
 */

interface S {
  int get m();
}

interface I extends S  {
  void get m();
}

main() {
  I i = null;
  try {i.m1();} catch (NullPointerException e) {}
}
