/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet.from(Iterable elements, [int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * ...
 * The set works as if created by new SplayTreeSet<E>(compare, isValidKey).
 * @description Checks that if the compare function is omitted, and the elements
 * are not comparable then exception is thrown
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class C {}

main() {
  Expect.throws(() {new SplayTreeSet.from([new C(), new C()]);});
}
