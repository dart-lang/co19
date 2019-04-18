/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface has a set of direct superinterfaces.
 * An interface J is a superinterface of an interface I iff either J is a
 * direct superinterface of I or J is a superinterface of a direct
 * superinterface of I.
 * @description Checks that it is a compile-time error if the implements clause
 * of an interface is empty.
 * @compile-error
 * @author rodionov
 */

abstract class I implements {
}

class C implements I {
}

main() {
 try {
   I i1 = new C();
   assert (i1 != null);
 } catch (x) {
 }
}

