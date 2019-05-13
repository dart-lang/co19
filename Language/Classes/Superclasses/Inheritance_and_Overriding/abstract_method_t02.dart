/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a non-abstract class inherits an
 * abstract method.
 * @description Checks that it is a compile error if a non-abstract class
 * inherits an abstract method. Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

abstract class A {
  foo();
}
typedef AAlias = A;

class B extends AAlias {
}

main() {
}
