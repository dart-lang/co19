/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a required named parameter has a default value.
 *
 * @description Check that it is an error if a required named parameter has a
 * default value. Test both covariant and required modifiers
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class A {
  const A();
}

const a = const A();

class C {
  void test4({covariant required A x = a}) {}                               //# 01: compile-time error
  void test5(int x = 0, {required covariant A s = a}) {}                    //# 02: compile-time error
  void test6(int x = 0, {covariant required A y = a, int z = 42}) {}        //# 03: compile-time error
}

main() {
}
