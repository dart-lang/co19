/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no return type is specified, the return type of the setter is Dynamic.
 * @description Dart does not currently allow to invoke a setter like a regular method,
 * so that its return value can be obtained.
 * @author iefremov
 * @reviewer rodionov
 */

class C {
  set foo(var x) {}
}

main() {
  (new C()).foo = null;
}
