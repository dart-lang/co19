/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Boolean conversion is defined by the function
 *   (bool v){
 *      assert(v != null);
 *      return identical(v, true);
 *    }(o)
 * @description Checks that error is thrown if not boolean values are converted
 * to boolean
 * @author kaigorodov
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {}

void check(dynamic v, bool expected) {
  Expect.throws(() {bool converted = v ? true : false;});
}

main() {
  check(new Object(), false);
  check(0, false);
  check(1, false);
  check("", false);
  check([1, 2, 3], false);
  check({"k1": 1}, false);
  check(new A(), false);
  check((() => 1), false);
}
