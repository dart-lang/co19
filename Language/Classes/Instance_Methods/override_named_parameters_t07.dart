/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an instance method m1 overrides an 
 * instance member m2 and m1 does not declare all the named parameters declared 
 * by m2.
 * @description Checks that it is a compile error if an instance method m1
 * overrides an instance member m2 and m1 does not declare all the named 
 * parameters declared by m2. Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  foo(var a, {x, y}) {}
}
typedef AAlias = A;

class C extends AAlias {
  foo(var a, {x}) {}
}

main() {
  new A().foo(2);
  new C().foo(1);
}
