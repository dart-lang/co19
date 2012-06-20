/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * These are subject to the same compile-time and static checking rules 
 * as getters and setters in classes.
 * 7.2: It is a compile-time error if a class has both a getter and a method with the
 * same name. This restriction holds regardless of whether the getter is defined
 * explicitly or implicitly, or whether the getter or the method are inherited or not.
 * @description Checks that it is a compile-time error if an interface attempts to override
 * a method inherited from a superinterface with an explicit getter.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

interface S {
  int m();
}

interface I extends S  {
  String get m();
}

main() {
  I j = null;
  try {j.m1();} catch (NullPointerException e) {}
}
