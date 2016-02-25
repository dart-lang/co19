/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion As for all function declarations, the function is also made
 * available under its name in the function’s formal parameters scope.
 * @description Checks that the name a local function declaration is available
 * in the scope of its own formal parameters.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  f(x) => x > 0 ? x * f(x-1) : 1;
  Expect.equals(720, f(6));
}
