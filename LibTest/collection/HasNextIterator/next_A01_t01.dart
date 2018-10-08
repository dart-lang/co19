/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E next()
 * @description Checks that [next] moves iteration to the next element
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  HasNextIterator i = new HasNextIterator([0, 1, 2, -1].iterator);
  Expect.equals(0, i.next());
  Expect.equals(1, i.next());
  Expect.equals(2, i.next());
  Expect.equals(-1, i.next());
}
