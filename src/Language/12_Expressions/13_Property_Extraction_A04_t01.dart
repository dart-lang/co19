/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise super.m is treated as a getter invocation
 * @description Checks that super.m is treated as a getter invocation if
 * superclass has an implicit or explicit instance getter named m.
 * @author ilya
 */
import "../../Utils/expect.dart";


class C {
  var implicit;
  get explicit => implicit;
  C(this.implicit);
}

class D extends C {
  D(x) : super(x) {
    Expect.equals(implicit, super.implicit);
    Expect.equals(explicit, super.explicit);
  }
}

main() {
  new D(1);
}

