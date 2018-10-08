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
 * @description Checks that objects that are not bool and not null are
 * not converted to boolean. It's a compile time error
 * @compile-error
 * @author msyabro
 * @issue 27277
 */
import '../../../../Utils/expect.dart';

class A {}

main() {
  Expect.isFalse(new Object() && true);
  Expect.isFalse(0 && true);
  Expect.isFalse(1 && true);
  Expect.isFalse("" && true);
  Expect.isFalse([1, 2, 3] && true);
  Expect.isFalse({"k1": 1} && true);
  Expect.isFalse(new A() && true);
  Expect.isFalse((() => 1) && true);
}
