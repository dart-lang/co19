/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the implements clause of a class
 * includes type dynamic.
 * @description Checks that it is a compile-time error if dynamic is included in the
 * type list of a class's implements clause.
 * @author pagolubev
 * @compile-error
 * @reviewer msyabro
 * @reviewer rodionov
 */

class A implements dynamic {}

main() {
  try {
    new A();
  } catch (e){}
}
