/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator === is hard-coded and cannot be overridden by any class.
 * @description Checks that operator === can not be overriden.
 * @author pagolubev
 * @reviewer iefremov
 * @compile-error
 */

class A {
  bool operator ===(A other) { return true; }
}


main() {}
