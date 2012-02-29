/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String literals should be canonicalized (?)
 * @description Checks that equal strings constructed at compile-time are canonicalized.
 * @author iefremov
 * @reviewer msyabro
 * @needsreview undocumented
 * @needsreview issue 1918
 */


main() {
  var s1 = "Alea iacta est";
  var s2 = "Alea iacta est";
  Expect.isTrue(s1 === s2);

  s1 = "Si finis bonus est," + " totum bonum erit";
  s2 = "Si finis " + "bonus est, totum " + "bonum erit";
  Expect.isTrue(s1 === s2);
}
