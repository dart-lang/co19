/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the interface induced by a class C is a
 * superinterface of itself.
 * @description Ch. 7: When a class name appears as a type or interface, that name 
 * denotes the interface of the class.
 * Test checks that it is a compile-time error when a class's own name is included in
 * its implements clause. 
 * @compile-error
 * @author rodionov
 * @needsreview Not sure if it's possible at all for a programmer to reference a class's
 * induced interface in any expression.
 */

interface I {}

class C implements I, C {}

main () {
  try {
    C c = new C();
  } catch(var e) {}
}
