/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the function immediately enclosing
 * a is not declared asynchronous. However, this error is simply a syntax
 * error, because in the context of a normal function, await has no special
 * meaning.
 *
 * @description Check that in the context of a normal method, await has no
 * special meaning and can be used as a variable
 * @author sgrekhov@unipro.ru
 */

import '../../../Utils/expect.dart';

class C {
  test() {
    int await = 1;
    await++;
    Expect.equals(2, await);
  }
}

main() {
  C c = new C();
  c.test();
}
