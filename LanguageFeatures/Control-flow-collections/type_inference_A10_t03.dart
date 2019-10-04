/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If element is an ifElement with one element, p1, and no "else"
 * element:
 * ...
 * If the inferred set element type of e1 is S1 and the inferred set element
 * type of e2 is S2 then the inferred set element type of element is the least
 * upper bound of S1 and S2.
 *
 * @description Checks that if the inferred set element type of e1 is S1 and the
 * inferred set element type of e2 is S2 then the inferred set element type of
 * element is the least upper bound of S1 and S2.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var i = 1;
  var x = [1, 2, 3];
  var y = [1.1, 2.2, 3.3];
  var set1 = {
    if (i > 0) ...x else ...y,
  };
  Expect.isTrue(set1 is Set<num>);
  Expect.isFalse(set1 is Set<double>);
  Expect.isFalse(set1 is Set<int>);

  var set2 = {
    "",
    if (i < 0) ...?x else ...?y,
  };
  Expect.isTrue(set2 is Set<Object>);
  Expect.isFalse(set2 is Set<String>);
  Expect.isFalse(set2 is Set<num>);
}
