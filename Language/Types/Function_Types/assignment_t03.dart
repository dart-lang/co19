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
 * @compile-error
 * @author ngl@unipro.ru
 */
class A {}
class B extends A {}
class C extends B {}

class X {}

typedef B t1(B b);

main() {
  t1 x1c = (C x) {};
}
