/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin declaration defines an interface. The interface for this
 * mixin declaration is equivalent to the interface of the class declared as:
 *  abstract class A<X extends S, Y extends T> extends A$super<X, Y>
 *    implements D, E { body' }
 * where body' contains abstract declarations corresponding to the instance
 * members of body of the mixin A.
 * It is a compile time error for the mixin declaration if this class
 * declarations would not be valid.
 *
 * @description Checks that it is a compile-time error for the mixin declaration
 * if its super classes contain getters with the same name and different return
 * types. Test several interfaces in 'on' and 'implements' clauses
 * @compile-error
 * @author ngl@unipro.ru
 */

class I {
  int get i1 => 1;
}
class J {}

class B {
  double get i1 => 2.0;
}
class C {}

mixin M on B, C implements I, J {}

main() {
}
