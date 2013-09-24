/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the test always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic. 
 * @description Checks that test succeeds if G  has more then n type parameters.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 * @issue co19 534
 */
import "../../Utils/expect.dart";

class G<T, U, V> {}

main() {
  Expect.isTrue(1 is G<int, bool>); /// static type warning
}
