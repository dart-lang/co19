/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a setter's formal parameter list
 * does not consist of exactly one required formal parameter p.
 * @description Checks that a compile-time error is produced if a static
 * setter's formal parameter list consists of a single optional parameter.
 * @compile-error
 * @author vasya
 */

class C {
  static void set setter([value]) { }
}

main() {
  try {
    C.setter = null;
  } catch (e) {}
}
