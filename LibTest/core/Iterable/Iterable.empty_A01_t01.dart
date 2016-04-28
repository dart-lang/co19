/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Iterable.empty()
 * Creates an empty iterable.
 * The empty iterable has no elements, and iterating it always stops
 * immediately.
 * @description Checks that Iterator created by the Iterable.empty() has no
 * elements
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Iterable i = new Iterable.empty();
  Expect.equals(0, i.length);
  Expect.isTrue(i.isEmpty);
}
