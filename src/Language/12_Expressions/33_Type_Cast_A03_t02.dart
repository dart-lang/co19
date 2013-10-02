/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the cast always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic
 * @description Checks that if T is a parameterized type of the form
 * G < T1, ..., Tn > and G is generic type with different number of parameters, then
 * T is not malformed (see Types/Parameterized Types) and the cast does not
 * always succed.
 * @static-warning
 * @author rodionov 
 * @reviewer iefremov
 * @note see 13674
 */
import "../../Utils/expect.dart";

class G<S, T> {}

main() {
  // G<int> is G<dynamic,dynamic>, not malformed
  Expect.throws(() => [] as G<int>);
}
