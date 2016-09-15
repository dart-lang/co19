/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function type T may be assigned to a function type S, written
 * T ⇐⇒ S, iff T <: S.
 * @description Checks that a function type T may be assigned to a function type
 * S, iff T <: S.
 * @static-warning
 * @author ngl@unipro.ru
 */
import "../../../Utils/dynamic_check.dart";
import "../../../Utils/expect.dart";

class A {}
class B extends A {}
class C extends B {}

class X {}

typedef B t1(B b);

main() {
  t1 x1a = (A x) {};
  t1 x1b = (B x) {};
  t1 x1c = (C x) {};

  checkTypeError( () {
    t1 x1x = (X x) {};    /// static type warning
  });

  Expect.isTrue((A x) {} is t1);
  Expect.isTrue((B x) {} is t1);
  Expect.isTrue((C x) {} is t1);
  Expect.isFalse((X x) {} is t1);
}
