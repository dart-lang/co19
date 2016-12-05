/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * The parameter fractionDigits must be an integer satisfying:
 * 0 <= fractionDigits <= 20.
 * @description Checks that an exception is thrown when 'fractionDigits' is 100.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {0.1.toStringAsFixed(100);});
}
