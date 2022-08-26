// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion abstract Map<int, E> asMap()
/// Returns an unmodifiable Map view of this.
/// The map uses the indices of this list as keys and the corresponding objects
/// as values.
/// @description Checks that the returned [Map] is unmodifiable, has the indices
/// of this list as keys and corresponding objects as values.
/// @author iarkh@unipro.ru

import "dart:collection";
import "../../../Utils/expect.dart";

void check(List a0) {
  UnmodifiableListView a = new UnmodifiableListView(a0);
  Map map = a.asMap();

  Expect.equals(a.length, map.length);
  Expect.throws(() { map["key"] = "value"; },(e) => true);

  int count = 0;
  map.forEach((key, value){
    Expect.equals(a[key], map[key]);
    count++;
  });
  Expect.equals(a.length, count);

  for (int key = 0; key < a.length; key++) {
    Expect.isTrue(map.containsKey(key));
    Expect.equals(a[key], map[key]);
  }
}

main() {
  List a = [];
  check(a);

  a.add(2);
  check(a);

  a.add(1);
  check(a);

  a.add(1);
  check(a);

  a.add("1");
  check(a);

  a.clear();
  check(a);
}
