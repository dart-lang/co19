/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use a null aware operator (?., ?.., ??, ??=,
 * or ...?) on an expression of type T if T is strictly non-nullable.
 *
 * @description Check it is a warning to use a null aware operator (?., ?.., ??,
 * ??=, or ...?) on a strictly non-nullable receiver. Test if (t != null) {…}
 * @author sgrekhov@unipro.ru
 * @issue 39598
 * @issue 39714
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {
}
class C extends A {}

main() {
  A? a = A();
  C c = C();
  if (a != null) {
    a?.toString();              //# 01: static type warning
    a?..toString();             //# 02: static type warning
    a ?? c;                     //# 03: static type warning
    a ??= c;                    //# 04: static type warning
  }
}
