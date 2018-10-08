/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int ceil()
 * If this is not finite (NaN or infinity), throws an UnsupportedError.
 * @description Checks that [:ceil():] called on a positive or negative
 * infinity throws an UnsupportedError.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

check(double arg) {
  Expect.throws(() {arg.ceil();}, (e) => e is UnsupportedError
  );
}

main() {
  check(double.infinity);
  check(double.negativeInfinity);
}
