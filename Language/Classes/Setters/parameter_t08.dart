/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a setter's formal parameter list
 * does not consist of exactly one required formal parameter p.
 * @description Checks that a compile-time error is produced if a static
 * setter's formal parameter list contains a single optional parameter with a
 * default value.
 * @compile-error
 * @author iefremov
 */

class C {
  static void set setter([var x = null]) { }
}

main() {
  try {
    C.setter = null;
  }catch (e) {}
}
