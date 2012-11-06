/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interpolated string 's1${e}s2' is equivalent to the
 * concatenation of the strings 's1', e.toString() and 's2'.
 * It is a runtime error if e.toString() does not return an object of type String.
 * @description Checks that if evaluation of expression e results in exception,
 * string interpolation 's1${e}s2' raises the same exception.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  var id;
  test() {
    try {
      '${x}';
      Expect.fail("NoSuchMethodError is expected");
    } on NoSuchMethodError catch(e) {}

    try {
      '${[][10]}';
      Expect.fail("RangeError is expected");
    } on RangeError catch(e) {}

    try {
      '${(const []).addLast(1)}';
      Expect.fail("UnsupportedError is expected");
    } on UnsupportedError catch(e) {}

    try {
      '${null.someMethod()}';
      Expect.fail("NullPointerException is expected");
    } on NullPointerException catch(e) {}

    try {
      '${id()}';
      Expect.fail("NPE expected");
    } on NullPointerException catch(e) {}
  }
}

main() {
  new C().test();
}
