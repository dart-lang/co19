/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * A set literal <E>{elem_1 ... elem_n} is evaluated as follows:
 *   1. Create a fresh instance of set of a class that implements
 *      [LinkedHashSet<E>].
 *   ...
 *   3. The result of the literal expression is [set].
 *   @description Checks that instance of [LinkedHashSet<E>] is created for a
 *   [set] literal.
 * @author iarkh@unipro.ru
 */

import "dart:collection";
import "../../Utils/expect.dart";

main() {
  List list1 = [1, 2, 3, 4, 5];
  List list2 = [];
  List list3 = null;
  List list4 = [1 ,2, 3, "checkme"];

  Expect.isTrue(<int>{...list1} is LinkedHashSet<int>);
  Expect.isTrue(<int>{1, 2, ...list1} is LinkedHashSet<int>);
  Expect.isTrue(<int>{1, ...?list1, 14, 9} is LinkedHashSet<int>);
  Expect.isTrue(<String>{...list2, "123"} is LinkedHashSet<String>);
  Expect.isTrue(<String>{...?list3} is LinkedHashSet<String>);
  Expect.isTrue(<int>{...?list3} is LinkedHashSet<int>);
  Expect.isTrue({...list4} is LinkedHashSet<Object>);
}
