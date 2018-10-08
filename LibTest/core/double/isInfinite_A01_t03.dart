/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isInfinite
 * @description Checks that some operations with Infinity
 * results to Infinity
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(double d) {
  Expect.isTrue(d.isInfinite);
}

main() {
  double inf = 1 / 0;
  check(inf + inf);
  check(inf - 1111111111111111111);
  check(inf + 1111111111111111111);
  check(inf + .0);
  check(inf - .0);
  
  check((-inf) - 1111111111111111111);
  check((-inf) + 1111111111111111111);
  check((-inf) + .0);
  check((-inf) - .0);
  
  check(inf * (-inf));
  check(inf * 10);
  check(inf / 10000000);
  check(inf / 0);
  
  check((-inf) * 10);
  check((-inf) / 10000000);
  check((-inf) / 0);
}
