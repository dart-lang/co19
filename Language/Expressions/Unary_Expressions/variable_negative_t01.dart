/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The expression !e is equivalent to the expression
 * e ? false : true.
 * @description Checks that expression !e is equivalent to the expression
 * e ? false : true when e is a value of type bool.
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  var v = true;
  Expect.isFalse(!v);
  v = false;
  Expect.isTrue(!v);
}
