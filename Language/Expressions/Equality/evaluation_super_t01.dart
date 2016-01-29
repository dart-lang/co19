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
 * @description Checks that if this is identical to e2, the result of an
 * equality expression is true.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';


class S {
}

class C extends S {
  test() {
    Expect.isTrue(super == this);
  }
}

main() {
  new C().test();
}
