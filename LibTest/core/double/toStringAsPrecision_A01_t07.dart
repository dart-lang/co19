/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsPrecision(int precision)
 * @description Checks that an exception is thrown when [fractionDigit] is too
  * big.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {0.1.toStringAsPrecision(22);});
}
