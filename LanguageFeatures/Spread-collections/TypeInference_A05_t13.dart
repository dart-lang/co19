/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections Spec:
 * We require that at least one component unambiguously determine the literal
 * form, otherwise it is a compile-time error. So, given:
 *    dynamic x = <int, int>{};
 *    Iterable l = [];
 *    Map m = {};
 *    Then:
 *    {...x}       // Static error, because it is ambiguous.
 *    {...x, ...l} // Statically a set, runtime error when spreading x.
 *    {...x, ...m} // Statically a map, no runtime error.
 *    {...l, ...m} // Static error, because it must be both a set and a map.
 * @description Checks that spread element must be [Iterable] or [Map]
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  dynamic x1 = 14;
  dynamic x2 = "String";

  Set res;
  Expect.throws(() =>  res = {...x1});
  Expect.throws(() =>  res = {...x2});
  Expect.throws(() =>  res = {...?x1});
  Expect.throws(() =>  res = {...?x2});

  Map res1;
  Expect.throws(() =>  res1 = {...x1});
  Expect.throws(() =>  res1 = {...x2});
  Expect.throws(() =>  res1 = {...?x1});
  Expect.throws(() =>  res1 = {...?x2});
}
