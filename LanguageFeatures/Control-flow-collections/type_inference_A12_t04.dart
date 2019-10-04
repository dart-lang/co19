/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If element is a forElement with element e1 then:
 *
 * Inference for the iterated expression and the controlling variable is done as
 * for the corresponding for or await for statement.
 *
 * If the inferred set element type of e1 is S then the inferred set element
 * type of element is S.
 *
 * @description Checks that if element is a forElement with element e1 then if
 * the inferred set element type of e1 is S then the inferred set element type
 * of element is S.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var collection = [1, 2, 3, 4, 5];
  var c1 = [1, 2, 3];
  var c2 = [1.1, 2.2, 3.3];
  var set1 = {
    for (var i in collection)
      if (i.isEven) ...c1 else ...c2
  };
  Expect.isTrue(set1 is Set<num>);
  Expect.isFalse(set1 is Set<int>);
  Expect.isFalse(set1 is Set<double>);

  var set2 = {
    "",
    for (var i in collection)
      if (i.isEven) ...?c1 else ...?c2
  };
  Expect.isTrue(set2 is Set<Object>);
  Expect.isFalse(set2 is Set<int>);
  Expect.isFalse(set2 is Set<double>);

  c1 = null;
  c2 = null;
  var set3 = {
    for (var i in collection)
      if (i.isEven) ...?c1 else ...?c2
  };
  Expect.isTrue(set1 is Set<num>);
  Expect.isFalse(set1 is Set<int>);
  Expect.isFalse(set1 is Set<double>);
}
