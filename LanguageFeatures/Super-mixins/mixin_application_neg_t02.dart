/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Mixin application semantics is mostly unchanged, except that it's
 * a compile-time error to apply a mixin to a class that doesn't implement all
 * the 'on' type requirements of the mixin declaration, or apply a mixin
 * containing super-invocations to a class that doesn't have a concrete
 * implementation of the super-invoked members compatible with the
 * super-constraint interface.
 *
 * @description Checks that it is a compile error to apply a mixin that contains
 * a super-invocation of a member f to a class which doesn't have a concrete
 * implementation of f.
 * @compile-error
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

class I {}

class J {}

class B {
  num f() => 34;
}

class C {}

mixin M on B, C implements I, J {
  test() {
    Expect.isTrue(super.f() is num);
  }
}

class MA with M {}

main() {
}
