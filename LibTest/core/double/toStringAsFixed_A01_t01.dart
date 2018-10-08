/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * @description Checks that for a NaN the method returns 'NaN' regardless
 * of the 'fractionDigits' value.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


main() {
  for(int i = 0; i < 10; i++) {
    Expect.equals('NaN', double.nan.toStringAsFixed(i));
  }
}
