/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an equality expression ee of the form super == e
 * proceeds as follows:
 * • The expression e is evaluated to an object o.
 * • If either this or o is null, then ee evaluates to evaluates to true if both
 *   this and o are null and to false otherwise. Otherwise
 * • ee is equivalent to the method invocation super.==(o).
 * @description Checks that if o is null, the operator super.==(o) is not called
 * and the result is the same as that of identical(this, o) (false, to be sure).
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class S {
  operator ==(other) {
    Expect.fail('operator== invoked with $other argument');
  }
}

class C extends S {
  test() {
    Expect.equals(super == null, identical(this, null));
    Expect.isFalse(super == null);
  }
}

main() {
  new C().test();
}
