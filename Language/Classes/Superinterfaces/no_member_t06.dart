/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a concrete class that does not declare its own
 * noSuchMethod() distinct from the one declared in class Object.
 * It is a compile error if the implicit interface of C includes an instance
 * member m of type F and C does not declare or inherit a corresponding
 * non-abstract instance member m of type F' such that F' <: F.
 * @description Checks that it is a compile error if a class does not declare
 * nor inherit an instance method declared in class' interface. Test type alias
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

abstract class I {
  foo();
}

typedef IAlias = I;

class C implements IAlias {
}

main () {
  new C();
}
