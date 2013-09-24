/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the test always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic. 
 * @description Checks that null is Undeclared gives true.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(null is Undeclared); /// static type warning
}
