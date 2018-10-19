/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Mixin application semantics is mostly unchanged, except that it's
 * a compile-time error to apply a mixin to a class that doesn't implement all
 * the 'on' type requirements of the mixin declaration, or apply a mixin
 * containing super-invocations to a class that doesn't have a concrete
 * implementation of the super-invoked members compatible with the
 * super-constraint interface.
 *
 * @description Checks that it is a compile error if a mixin is applied to a
 * class that does not implement all the 'on' type requirements of the mixin
 * declaration. Test omitted 'on'
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class I {}
class J {}
class B {}
class C {}

mixin M on B, C implements I, J {}

class MA with M {}

main() {
  MA ma = new MA();
}
