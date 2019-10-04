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

class A {}
class B extends A {}
class C extends B {}

main() {
  var set1 = {
    for (var i = 1; i < 5; i++)
      if (i.isEven) 3 else 3.14
  };
  Expect.isTrue(set1 is Set<num>);
  Expect.isFalse(set1 is Set<int>);
  Expect.isFalse(set1 is Set<double>);

  var set2 = {
    "",
    for (var i = 1; i < 5; i++)
      if ( i.isEven) 3 else 3.14
  };
  Expect.isTrue(set2 is Set<Object>);
  Expect.isFalse(set2 is Set<int>);
  Expect.isFalse(set2 is Set<double>);

  var set3 = {
    new C(),
    for (var i = 1; i < 5; i++) new B()
  };
  Expect.isTrue(set3 is Set<B>);
  Expect.isFalse(set3 is Set<C>);
}
