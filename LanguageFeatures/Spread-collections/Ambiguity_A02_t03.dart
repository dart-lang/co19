/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In cases where the context type is not specific enough to
 * disambiguate, we could make it an error instead of defaulting to map.
 * However, that would be inconsistent with how empty collections are handled.
 * Those have to default to map for backwards compatibility.
 * @description Checks that empty collection is map.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

main() {
  List list1 = [1, 2, 3];
  List list2 = null;
  Map map1 = {1: 1};
  Map map2 = null;

  Set res1 = {...list1, ...?map2};
  Map res2 = {...?map2, ...list1};

  Set res3 = {...?list2, ...map1};
  Map res4 = {...map1, ...list2};

  Map res5 = {...?map2, ...?list2};
  Map res6 = {...?list2, ...?map2};
}
