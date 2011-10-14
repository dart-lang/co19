/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a list with the elements of [other]. The order in
 * the list will be the order provided by the iterator of [other].
 * @description Tries to pass null argument.
 * @author vasya
 * @reviewer iefremov
 * @needsreview
 */

main() {
  try {
    List a = new List.from(null);
    Expect.fail("NullPointerException expected when calling List.from()");
  } catch(NullPointerException ok) {}
}
