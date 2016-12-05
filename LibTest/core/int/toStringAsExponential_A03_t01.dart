/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsExponential([int fractionDigits]) 
 * Without the parameter the returned string uses the shortest number of digits
 * that accurately represent this.
 * @description Checks that this method returns correct value when
 * fractionDigits is not specified.
 * @author vasya
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("1e+2", 100.toStringAsExponential());
  Expect.equals("-1e+2", (-100).toStringAsExponential());
  Expect.equals("1.23456789e+8", 123456789.toStringAsExponential());
  Expect.equals("-1.23456789e+8", (-123456789).toStringAsExponential());
  Expect.equals("0e+0", 0.toStringAsExponential());
  Expect.equals("1e+0", 1.toStringAsExponential());
}
