/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use the null check operator (!) on an
 * expression of type T if T is strictly non-nullable
 *
 * @description It is a warning to use the null check operator (!) on an
 * expression of type T if T is strictly non-nullable. Test if (t is Object) {…}
 * @author sgrekhov@unipro.ru
 * @issue 39598
 * @issue 39867
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}

test(var a) {
  if (a is Object) {
    a!;     //# 01: static type warning
  }
}

main() {
  A? a = new A();
  test(a);
}