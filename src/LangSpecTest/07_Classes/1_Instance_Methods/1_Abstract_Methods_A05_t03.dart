/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a static warning if an instance method m1 overrides an instance 
 * member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a static warning is produced when the type of an abstract m1 
 * is not a subtype of the non-abstract m2's type because their respective named parameter 
 * types are not mutually assignable.
 * @static-type-error
 * @author rodionov
 */

class A {
  foo([int x]) {}
}

class C extends A {
  abstract foo([String x]);
}

main() {
  try {
    new A().foo(2);
    new C().foo(1);
  } catch(NoSuchMethodException ok) {}
}

