/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the test always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic. 
 * @description Checks that if T is generic type and G is generic type with
 * less then n type parameters, then T is not malformed (see Types/Parameterized Types)
 * and the test does not always succeed.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

class G<T> {}

main() {
  // G<int,bool> is G<dynamic>, not malformed

  Expect.isFalse(1 is G<int, bool>);      /// static type warning
  Expect.isTrue(new G() is G<int, bool>); /// static type warning
}
