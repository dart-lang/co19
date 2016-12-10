/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory List.from(Iterable other, {bool growable: true})
 * Creates an list with the elements of other.
 * The order in the list will be the order provided by the iterator of other.
 * The returned list is growable if growable is true, otherwise it's a fixed
 * length list.
 * @description Checks that the list created with growable==true can change it's
 * size.
 * @author varlax
 */
import "../../../Utils/expect.dart";
import "dart:collection";

void check(List l) {
  int len = l.length;
  l.add(null);
  Expect.equals(len + 1, l.length);

  l.clear();
  Expect.equals(0, l.length);
}

main() {
  check(new List.from([]));

  Set<int> s = new Set<int>();
  for (var i = 0; i < 10; i++){
    s.add(i);
  }
  check(new List.from(s));

  Queue<int> q = new Queue<int>();
  for (var i = 0; i < 10; i++){
    q.add(i);
  }
  check(new List.from(q));

  List l = new List();
  l.addAll(["1", "2", "3", "4", "5"]);
  List a = new List.from(l, growable:true);
  check(a);

  List src = [null, [null], [], [1, 2, 3], [[null]]];
  a = new List.from(src);
  check(a);

  src = new List(34567);
  src[34566] = -111111111;
  a = new List.from(src, growable:true);
  check(a);
}
