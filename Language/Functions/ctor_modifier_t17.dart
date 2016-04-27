/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an async, async* or sync* modifier
 * is attached to the body of a setter or constructor.
 *
 * @description Checks that class constant constructor with sync* modifier
 * cause compiler error.
 *
 * @compile-error
 * @author a.semenov@unipro.ru
 */
class A {
  const A() sync* {}
}
main() {
  new A();
}
