/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E first
 * Returns the first element.
 * Throws a StateError if this is empty. Otherwise returs the first element
 * in the iteration order, equivalent to (iterator..moveNext())..current.
 * @description Checks that first is equivalent to
 * (iterator..moveNext())..current
 * @author sgrekhov@unipro.ru
 */
library first_A03_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable a = create([1, 2, 3, 4, 5]);
  Iterator i = a.iterator;
  i.moveNext();
  var v = i.current;
  Expect.equals(v, a.first);
}
