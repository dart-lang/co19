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
 * a method inherited from a superinterface with an explicit setter.
 * @author kaigorodov
 * @reviewer iefremov
 * @compile-error
 * @static-warning
 * @needsreview issue 972
 */

interface S {
  void s(int i);
}

interface I extends S  {
  void set s(int i);
}

class A implements I {}

main() {
  try {
    new A();
  } catch(e) {}
}
