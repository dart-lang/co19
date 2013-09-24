/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interpolated string 's1${e}s2' is equivalent to the
 * concatenation of the strings 's1', e.toString() and 's2'.
 * @description Checks that it is a runtime error if e.toString() does not
 * return an object of type string.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class A {
  toString() => 1;
}

main() {
  Expect.throws( () => '${new A()}');
}
