/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the test always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic. 
 * @description Checks that if T is parameterized type and G is not generic
 * type, then T is not malformed (see Types/Parameterized Types) and the test
 * does not always succeed.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class G {}

main() {
  // G<bool> is G, not malformed

  Expect.isFalse(1 is G<bool>);      /// static type warning
  Expect.isTrue(new G() is G<bool>); /// static type warning
}
