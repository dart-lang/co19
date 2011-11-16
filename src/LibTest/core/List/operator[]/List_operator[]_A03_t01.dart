/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws [IllegalArgumentException] if [index] is [:null:] if the list is extendable.
 * @description Checks that the exception is thrown as expected, for extendable lists.
 * @author varlax
 * @reviewer msyabro
 * @needsreview Undocumented.
 */

void main() {
  var a = [null];
  try {
    a[null];
    Expect.fail("expected IllegalArgumentException");
  } catch(IllegalArgumentException ok) {}

  a = new List.from([a, 1, true]);
  try {
    a[null];
    Expect.fail("expected IllegalArgumentException");
  } catch(IllegalArgumentException ok) {}

  a = new List.from(<int>[null, 1, 0]);
  try {
    a[null];
    Expect.fail("expected IllegalArgumentException");
  } catch(IllegalArgumentException ok) {}
}
