/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the superclass of a class C is
 * specified as a superinterface of C.
 * @description Test checks that it is a compile-time error when a class has
 * the same class as superclass and interface. Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

abstract class A {}

typedef AAlias = A;

class C extends AAlias implements A {}

main () {
  new C();
}
