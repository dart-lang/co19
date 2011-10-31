/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [IllegalArgumentException] if [index] is [:null:] if the list is not extendable.
 * @description Checks that the exception is thrown as expected, for fixed lists.
 * @author msyabro
 * @needsreview Undocumented.
 */

void main() {
  var a = const<String>[null];
  try {
    a[null];
    Expect.fail("expected IllegalArgumentException");
  } catch(IllegalArgumentException ok) {}

  a = new List(0);
  try {
    a[null];
    Expect.fail("expected IllegalArgumentException");
  } catch(IllegalArgumentException ok) {}
}
