/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool contains(Object element)
 * Some types of iterable may have a different equality used for its elements.
 * For example, a [Set] may have a custom equality (see [Set.identical]) that
 * its [contains] uses. Likewise the [Iterable] returned by a [Map.keys] call
 * should use the same equality that the [Map] uses for keys.
 * @description Checks that [true] is returned if operator == always returns
 * [true] and [false] is returned otherwise for set.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class MyIterable extends Object with IterableMixin {
  Set _content;
  MyIterable(Set set): _content = set;

  Iterator get iterator {
    return _content.iterator;
  }
}

class C1 {
  int get hashCode => 1;
  bool operator == (dynamic c) { return true; }
}

class C2 {
  int get hashCode => 1;
  bool operator == (dynamic c) { return false; }
}

main() {
  HashSet set = new HashSet<C1>();
  set.add(new C1());
  MyIterable iterable = new MyIterable(set);
  Expect.isTrue(iterable.contains(new C1()));
  Expect.isTrue(iterable.contains(new C2()));
  Expect.isTrue(iterable.contains(12345));

  set = new HashSet<C2>();
  set.add(new C2());
  iterable = new MyIterable(set);
  Expect.isFalse(iterable.contains(new C2()));
  Expect.isFalse(iterable.contains(new C1()));
  Expect.isFalse(iterable.contains(12345));
  Expect.isFalse(iterable.contains(null));
}
