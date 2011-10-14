/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a list which is a subcopy of [other], starting at
 * [startIndex] (inclusive) and ending at [endIndex] (exclusive).
 * If [startIndex] is negative, it has the same effect as if it were
 * zero. If [endIndex] is greather than the length, it has the same
 * effect as if it were [other.length]. If [startIndex > endIndex],
 * the created list is of [length] 0.
 * @description Tries to pass null as [other] list argument.
 * @needsreview
 * @author vasya
 * @reviewer msyabro
 */

main() {
  try {
    List b = new List.fromList(null,0,1);
    Expect.fail("NullPointerException expected when calling List.fromArray()");
  } catch(NullPointerException ok) {}
}
