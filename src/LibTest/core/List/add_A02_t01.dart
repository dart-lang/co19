/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws UnsupportedError if the list is not extendable.
 * @description Checks that UnsupportedError exception is thrown
 * if the list is not extendable.
 * @author vasya
 * @reviewer iefremov
 * @reviewer varlax
 */

main() {
  try {
    new List.fixedLength(1).add(null);
    Expect.fail("UnsupportedError expected when calling a.add()");
  } on UnsupportedError catch(ok) {}

  try {
    new List.fixedLength(100).add(null);
    Expect.fail("UnsupportedError expected when calling a.add()");
  } on UnsupportedError catch(ok) {}

  try {
    const [].add(null);
    Expect.fail("UnsupportedError expected when calling a.add()");
  } on UnsupportedError catch(ok) {}
}
