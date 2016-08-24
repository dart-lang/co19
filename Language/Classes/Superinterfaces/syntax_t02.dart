/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class has a set of direct superinterfaces. This set includes
 * the interface of its superclass and the interfaces specified in the the
 * implements clause of the class.
 * interfaces:
 *   implements typeList
 * ;
 * @description Checks that it is a compile-time error if the implements
 * clause of a class does not list any types.
 * @compile-error
 * @author rodionov
 */

class A implements {}

main() {
  try {
    new A();
  } catch (e) {}
}
