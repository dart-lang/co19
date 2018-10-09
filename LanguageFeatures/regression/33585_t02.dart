/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 33585, 33308 (CFE doesn't check
 * type arguments against the bounds of the corresponding type variables)
 * @compile-error
 * @Issue 33308
 * @author iarkh@unipro.ru
 */
class O extends Object {}
class O1 {}

abstract class A<X> extends O {}
class B<X> implements A<X>{}

main() {
  B<O1> a = new B();
}
