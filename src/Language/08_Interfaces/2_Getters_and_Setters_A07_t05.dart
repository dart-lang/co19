/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface may contain getter and/or setter signatures.
 * These are subject to the same compile-time and static checking rules 
 * as getters and setters in classes.
 * 7.3: It is a compile-time error if a class has both a setter and a method with the
 * same name. This restriction holds regardless of whether the setter is defined
 * explicitly or implicitly, or whether the setter or the method are inherited or not.
 * @description Checks that it is a compile-time error if an interface attempts to override
 * an explicit setter inherited from a superinterface with a method.
 * @author kaigorodov
 * @reviewer iefremov
 * @static-warning
 * @compile-error
 * @needsreview issue 972
 */

interface S {
  void set s(int i);
}

interface I extends S  {
  void s(int i);
}

class A implements I {}

main() {
  try {
    new A();
  } catch(e) {}
}
