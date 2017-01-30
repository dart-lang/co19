/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet({bool equals(E e1, E e2), int hashCode(E e),
 * bool isValidKey(potentialKey)})
 * If [equals] or [hashCode] are omitted, the set uses the elements' intrinsic
 * [Object.operator==] and [Object.hashCode].
 * @description Checks that if [equals] and [hashCode] are omitted then
 * [Object.operator==] and [Object.hashCode] are used
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class C {
  int get hashCode => 1;
  bool operator ==(Object c) {
    return true;
  }
}

main() {
  LinkedHashSet set1 = new LinkedHashSet(equals: identical,
      hashCode: identityHashCode);
  LinkedHashSet set2 = new LinkedHashSet();

  C key1 = new C();
  C key2 = new C();
  C key3 = new C();

  set1.add(key1);
  set1.add(key2);
  set1.add(key3);

  set2.add(key1);
  set2.add(key2);
  set2.add(key3);

  Expect.equals(3, set1.length);
  Expect.equals(1, set2.length);
}
