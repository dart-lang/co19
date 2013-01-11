/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws a [UnsupportedError] if the list is not extendable.
 * @description Checks that exception is thrown if the list is not extendable.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  List a = new List.fixedLength(0);
  try {
    a.clear();
    Expect.fail("UnsupportedError expected when calling a.clear()");
  } on UnsupportedError catch(ok) {}

  a = new List.fixedLength(1);
  a[0] = null;
  try {
    a.clear();
    Expect.fail("UnsupportedError expected when calling a.clear()");
  } on UnsupportedError catch(ok) {}

  a = new List.fixedLength(3);
  a[0] = 1;
  a[1] = 1;
  a[2] = 1;
  try {
    a.clear();
    Expect.fail("UnsupportedError expected when calling a.clear()");
  } on UnsupportedError catch(ok) {}

  a = new List.fixedLength(89356);
  try {
    a.clear();
    Expect.fail("UnsupportedError expected when calling a.clear()");
  } on UnsupportedError catch(ok) {}

  try {
    const [].clear();
    Expect.fail("UnsupportedError expected when calling a.clear()");
  } on UnsupportedError catch(ok) {}
}
