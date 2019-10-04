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
 * @description Checks some dynamic cases of the type inference
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  dynamic set1 = <int>{};
  dynamic set2 = <int>{};
  dynamic map1 = <int, int>{};
  dynamic map2 = <int, int>{};

  Set res;
  Expect.throws(() =>  res = {...?map1, ...set1});
  Expect.throws(() =>  res = {...map1, ...?set1});
  Expect.throws(() =>  res = {...?map1, ...?set1});

  Expect.throws(() =>  res = {...?set1, ...map1});
  Expect.throws(() =>  res = {...set1, ...?map1});
  Expect.throws(() =>  res = {...?set1, ...?map1});

  Expect.throws(() =>  res = {...?map1, ...map2});
  Expect.throws(() =>  res = {...map1, ...?map2});
  Expect.throws(() =>  res = {...?map1, ...?map2});

  Set res1 = {...?set1, ...set2};
  Set res2 = {...set1, ...?set2};
  Set res3 = {...?set1, ...?set2};
}
