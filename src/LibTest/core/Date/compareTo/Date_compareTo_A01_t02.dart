/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Interface Date extends Comparable.
 * @description Checks Date.compareTo() implementaion.
 * @author akuznecov
 * @reviewer pagolubev
 * @needsreview Result of the compareTo() when dates were constructed with invalid
 * [year], [month], [day] values (i.e. out of their calendar range or null) is not specified.
 */


int compare(date1, date2) {
  return date1.compareTo(date2);
}

main() {
  Expect.isTrue(compare(new Date(1991, 8, 18), new Date(1991, 8, 18)) == 0);

  Expect.isTrue(compare(new Date(1991, 8, 19), new Date(1991, 8, 18)) == 1);
  Expect.isTrue(compare(new Date(1991, 8, 18), new Date(1991, 8, 19)) == -1);

  Expect.isTrue(compare(new Date(1991, 9, 18), new Date(1991, 8, 18)) == 1);
  Expect.isTrue(compare(new Date(1991, 8, 18), new Date(1991, 9, 18)) == -1);

  Expect.isTrue(compare(new Date(1992, 8, 18), new Date(1991, 8, 18)) == 1);
  Expect.isTrue(compare(new Date(1991, 8, 18), new Date(1992, 8, 18)) == -1);

  Expect.isTrue(compare(new Date(1991, 9, 18), new Date(1991, 8, 19)) == 1);
  Expect.isTrue(compare(new Date(1991, 8, 19), new Date(1991, 9, 18)) == -1);

  Expect.isTrue(compare(new Date(1992, 8, 18), new Date(1991, 8, 19)) == 1);
  Expect.isTrue(compare(new Date(1991, 8, 19), new Date(1992, 8, 18)) == -1);

  Expect.isTrue(compare(new Date(1992, 8, 18), new Date(1991, 9, 18)) == 1);
  Expect.isTrue(compare(new Date(1991, 9, 18), new Date(1992, 8, 18)) == -1);
}
