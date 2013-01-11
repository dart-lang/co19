/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [UnsupportedError] if the list is not extendable.
 * @description Checks that the exception is thrown.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  List a = new List.fixedLength(100);
  try {
    a.length = 1;
    Expect.fail("UnsupportedError expected when calling a.length");
  } on UnsupportedError catch(ok) {}

  a = const[1,2,3];
  try {
    a.length = 1;
    Expect.fail("UnsupportedError expected when calling a.length");
  } on UnsupportedError catch(ok) {}
}
