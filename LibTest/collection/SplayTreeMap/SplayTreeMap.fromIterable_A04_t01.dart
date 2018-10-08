/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.fromIterable(Iterable iterable,
 * {K key(element), V value(element), int compare(K key1, K key2),
 * bool isValidKey(potentialKey)})
 * If no functions are specified for [key] and [value] the default is to use the
 * [iterable] value itself.
 * @description Checks that if no functions for keys and values specified then
 * [iterable] values are used
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

check(Iterable source, Map m2) {
  Expect.equals(source.length, m2.length);
  source.forEach((var element) {
    Expect.isTrue(m2.containsKey(element));
    Expect.equals(element, m2[element]);
  });
}

main() {
  Iterable source = [];
  SplayTreeMap map = new SplayTreeMap.fromIterable(source);
  check(source, map);

  source = [1, 2, 3, 4];
  map = new SplayTreeMap.fromIterable(source);
  check(source, map);

  source = ["1", "2", "3", "4", "5", "6"];
  map = new SplayTreeMap.fromIterable(source);
  check(source, map);


  source = [new DateTime.now(), new DateTime(1970), new DateTime(2016)];
  map = new SplayTreeMap.fromIterable(source);
  check(source, map);

  source = [new Duration(), new Duration(hours: 1), new Duration(days: 1)];
  map = new SplayTreeMap.fromIterable(source);
  check(source, map);
}
