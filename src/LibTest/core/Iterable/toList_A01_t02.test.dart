/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract List<E> toList({bool growable: true})
 * Creates a List containing the elements of this Iterable.
 * The elements will be in iteration order. The list is fixed-length if growable is false.
 * @description Checks that the list created with growable==true can change it's size.
 * @author kaigorodov
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
  check([].toList());

  Set<int> s = new Set<int>();
  for (var i = 0; i < 10; i++){
    s.add(i);
  }
  check(s.toList());

  Queue<int> q = new Queue<int>();
  for (var i = 0; i < 10; i++){
    q.add(i);
  }
  check(q.toList());

  List l = new List();
  l.addAll(["1","2","3","4","5"]);
  List a = l.toList(growable:true);
  check(a);

  List src = [null, [null], [], [1,2,3], [[null]]];
  a = src.toList();
  check(a);

  src = new List(34567);
  src[34566] = -111111111;
  a = src.toList(growable:true);
  check(a);
}
