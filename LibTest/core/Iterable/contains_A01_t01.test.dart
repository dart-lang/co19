/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Returns true if the collection contains an element equal to element.
 * This operation will check each element in order for being equal to element,
 * unless it has a more efficient way to find an element equal to element.
 * The equality used to determine whether element is equal to an element of the
 * iterable defaults to the Object.operator== of the element.
 * Some types of iterable may have a different equality used for its elements.
 * For example, a Set may have a custom equality (see Set.identical) that its
 * contains uses. Likewise the Iterable returned by a Map.keys call should use
 * the same equality that the Map uses for keys.
 * @description Checks that true is returned if the collection contains
 * an element equal to element, false otherwise.
 * @author kaigorodov
 */
library contains_A01_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Iterable a = create();
  Expect.isFalse(a.contains(1));
  a = create([2]);
  Expect.isFalse(a.contains(1));
  Expect.isTrue(a.contains(2));
  a = create([1, 2]);
  Expect.isTrue(a.contains(1));
  Expect.isTrue(a.contains(2));
}
