/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Documentation comments are comments that begin with the tokens ///
 * or '/''*''*'.
 * @description Checks that contents of a documentation comment have no effect
 * on the actual code's execution.
 * @author hlodvig
 * @reviewer iefremov
 * @needsreview issue 2459
 */
import "../../../../Utils/expect.dart";

main() {
  var x = 1;
  /// Documentation comments [:throw 1; :]
  Expect.equals(1, x);
}
