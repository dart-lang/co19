/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsExponential(int fractionDigits)
 * @description Checks that if [fractionDigits] is [:null:]
 * a string representation has as much digital places as a number literal.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('0e+0', .0.toStringAsExponential(null));
  Expect.equals('1.255e+0', 1.255.toStringAsExponential(null));
  Expect.equals('1.424e-2', 1.424e-2.toStringAsExponential(null));
  Expect.equals('-5.12e-100', (-5.12e-100).toStringAsExponential(null));
  Expect.equals('7.1e+200', 7.1e200.toStringAsExponential(null));
}
