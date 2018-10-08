/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet<E>
 * HashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey) })
 * Create a hash set using the provided [equals] as equality.
 * @description Checks that default constructor without parameters creates an
 * empty hash set.
 * @author rodionov
  */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  HashSet s = new HashSet();
  Expect.isTrue(s is HashSet);
  Expect.isTrue(s.isEmpty);
}
