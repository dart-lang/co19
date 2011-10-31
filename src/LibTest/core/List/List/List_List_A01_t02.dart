/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a fixed size list of the given length.
 * @description Checks that created list does not allow operations affecting list size.
 * @author varlax
 * @reviewer msyabro
 */

check(List l) {
  try {
    l.clear();
    Expect.fail("UnsupportedOperationException expected");
  } catch (UnsupportedOperationException ok) {}

  try {
    l.length = 123;
    Expect.fail("UnsupportedOperationException expected");
  } catch (UnsupportedOperationException ok) {}

  try {
    l.add(null);
    Expect.fail("UnsupportedOperationException expected");
  } catch (UnsupportedOperationException ok) {}

  try {
    l.removeLast();
    Expect.fail("UnsupportedOperationException expected");
  } catch (UnsupportedOperationException ok) {}

}

main() {
  check(new List<String>(0));
  check(new List(10));
}
