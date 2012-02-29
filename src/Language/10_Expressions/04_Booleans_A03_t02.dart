/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error for a class or interface to attempt to extend or implement bool.
 * @description Checks that it is a compile-time error when a user-defined class attempts to implement bool.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class C implements bool {}

main() {
  try {
    new C();
  } catch(var e) {}
}
