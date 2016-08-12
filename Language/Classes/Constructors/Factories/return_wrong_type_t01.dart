/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, it is a dynamic type error if a factory returns
 * a non-null object whose type is not a subtype of its actual return type.
 * @description Checks that returning an object whose type is not subtype of M
 * from factory constructor M produces a compile error.
 * @compile-error
 * @author pagolubev
 */

class C {}

class A {
  factory A() { return new C(); }
}

main() {
  new A();
}
