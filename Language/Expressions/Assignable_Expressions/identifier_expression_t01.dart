/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assignable expression of the form id
 * is evaluated as an identifier expression.
 * @description Checks that expression of the form id is evaluated
 * as an identifier expression.
 * @author msyabro
 */
import '../../../Utils/expect.dart';

main() {
  var x = 1;
  Expect.equals(1, x);
}
