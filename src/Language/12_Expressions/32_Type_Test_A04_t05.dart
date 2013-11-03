/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the test always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic. 
 * @description Checks that if T is parameterized type with malformed type argument
 * and G is generic type, then T is not malformed and the test does not always succeed.
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class G<T> {}

main() {
  // Unknown is dynamic, G<Unknown> is G<dynamic>, not malformed

  Expect.isFalse(1 is G<Unknown>);      /// static type warning
  Expect.isTrue(new G() is G<Unknown>); /// static type warning
}
