/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
* @assertion It is a static warning if a class has a static method with the
 * same name as a static member of one of its superclasses.
 * @description Checks that it is a static warning if a class has a static
 * method with the same name as a static method of one of its superclasses.
 * @static-warning
 * @author pagolubev
 * @reviewer rodionov
 * @needsreview issue 986
 */

class A {
  static foo() {}
}

class B extends A {
  static foo() {}
}

main() {}
