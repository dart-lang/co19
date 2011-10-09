/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Interface Date extends Comparable.
 * @description Checks that Date is Comparable and has .compareTo() method.
 * @author akuznecov
 * @needsreview How Comparable and operator == are related? TO DO: Add tests on operator ==.
 * @reviewer pagolubev
 */


main() {
  Date date = new Date(1991, 8, 18);
  Expect.isTrue(date is Comparable);
  Expect.isTrue(date.compareTo(new Date(1991, 8, 18)) == 0);
}
