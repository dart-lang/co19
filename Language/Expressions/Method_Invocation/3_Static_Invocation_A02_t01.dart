/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if C does not denote a class in the current scope. 
 * @note assert is no longer in spec since 0.61. Static invocation applies to
 * C.m(...) where C denotes a class in the current scope.
 * @description Checks that it is a static warning if C does not denote a class in the current scope.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

main() {
  try {
    C.func(); /// static type warning
  } catch(e) {}
}
