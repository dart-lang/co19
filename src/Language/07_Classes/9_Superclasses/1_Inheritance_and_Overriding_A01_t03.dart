/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class C inherits any accessible instance members of its superclass that
 * are not overridden by members declared in C. A class may override instance members
 * that would otherwise have been inherited from its superclass.
 * ...
 * It is a warning if you have an static member named m in your class or any
 * superclass (even though it is not inherited) and an instance member of the same name. 
 * @description Checks that it is a warning and not a compile error if you have a static
 * member named m in superclass and an abstract instance method of the same name. 
 * @author msyabro
 * @reviewer iefremov
 */

class S {
  static var v;
  static int i;
  static method() {}
  static int iMethod() {}
}

abstract class C extends S {
  v(); /// static type warning 
  i(); /// static type warning 
  method(); /// static type warning 
  iMethod(); /// static type warning 
}

main() {
  try {
    var c = new C(); /// static type warning instantiating abstract class
    Expect.fail("AbstractClassInstantiationError expected");
  } on AbstractClassInstantiationError catch(e) {
  }
}
