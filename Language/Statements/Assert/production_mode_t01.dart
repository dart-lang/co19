/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The assert statement has no effect in production mode.
 * @description Checks that the assert statement has no effect in production
 * mode.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

import '../../../Utils/dynamic_check.dart';

main() {
  if (!isCheckedMode()) {
    assert (false);
    assert ("not a bool"); /// static type warning
    assert (1 % 0); /// static type warning
    assert (null);
    assert (() => true);
  }
}
