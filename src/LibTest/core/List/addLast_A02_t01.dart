/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [UnsupportedError] if the list is not extendable.
 * @description Checks that a [UnsupportedError] exception is thrown
 * if the list is not extendable.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  List a = new List.fixedLength(0);
  try {
    a.addLast(null);
    Expect.fail("UnsupportedError expected when calling a.push()");
  } on UnsupportedError catch(ok) {}

  try {
    new List.fixedLength(100).addLast(null);
    Expect.fail("UnsupportedError expected when calling a.add()");
  } on UnsupportedError catch(ok) {}

  try {
    const [].addLast(null);
    Expect.fail("UnsupportedError expected when calling a.add()");
  } on UnsupportedError catch(ok) {}
}
