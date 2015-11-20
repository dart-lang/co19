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
 * converted to false. To check logical boolean expression e1 && e2 is used.
 * 16.22: It is a static type warning if the static types of e1 may not be
 * assigned to bool or if the static types of e2 may not be assigned to bool.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';
import '../../../../Utils/dynamic_check.dart';

class A {}

main() {
  if (!isCheckedMode()) {
    Expect.isTrue(true && true);
    Expect.isFalse(new Object() && true);
    Expect.isFalse(0 && true);          /// static type warning
    Expect.isFalse(1 && true);          /// static type warning
    Expect.isFalse("" && true);         /// static type warning
    Expect.isFalse([1, 2, 3] && true);  /// static type warning
    Expect.isFalse({"k1": 1} && true);  /// static type warning
    Expect.isFalse(new A() && true);    /// static type warning
    Expect.isFalse((() => 1) && true);  /// static type warning
  }
}
