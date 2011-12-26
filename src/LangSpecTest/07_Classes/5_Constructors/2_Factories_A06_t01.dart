/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, it is a dynamic type error if a factory returns
 * an object whose type is not a subtype of its actual (13.8.1) return type.
 * @description Checks that returning an object of type other than M
 * from factory constructor M produces a dynamic type error.
 * @dynamic-type-error
 * @author pagolubev
 * @reviewer iefremov
 * @reviewer rodionov
 */

#import("../../../Utils/dynamic_check.dart");

class C {}

class A {
  factory A() { return new C(); }
}

main() {
  checkTypeError( () {
  new A();
  });
}
