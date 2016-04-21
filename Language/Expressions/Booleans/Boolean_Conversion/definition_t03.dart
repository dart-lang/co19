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
 * @description Checks that boolean conversion is defined by the cited
 * function.
 * @author kaigorodov
 */
import '../../../../Utils/expect.dart';
import '../../../../Utils/dynamic_check.dart';

class A {}

bool convert1(bool v){
  assert (v != null);
  return identical(v, true);
}

void check(var v, bool expected) {
  bool converted = v ? true : false;
  bool converted1 = convert1(v);
  Expect.equals(expected, converted);
  Expect.equals(expected, converted1);
}

main() {
  if (!isCheckedMode()) {
    check(true, true);
    check(new Object(), false);
    check(0, false);
    check(1, false);
    check("", false);
    check([1, 2, 3], false);
    check({"k1": 1}, false);
    check(new A(), false);
    check((() => 1), false);
  }
}
