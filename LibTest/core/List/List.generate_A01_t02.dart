/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionfactory List.generate(int length, E generator(int index),
 * {bool growable: true})
 * Generate a List of values.
 * Creates a list with length positions and fills them by values created by
 * calling generator for each index in the range 0 .. [length]-1 in increasing
 * order.
 * The created length's length is fixed unless growable is true.
 * @description Checks that the list created with growable==true can change it's
 * size.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

typedef Generator(int index);

Generator gengen(List source) {
  return (int index) {
     return source[index];
   };
}

void check(List l) {
  int len = l.length;
  l.add(null);
  Expect.equals(len + 1, l.length);

  l.clear();
  Expect.equals(0, l.length);
}

main() {
  check(new List.generate(0, gengen([])));

  List<int> s = new List<int>();
  for (var i = 0; i < 10; i++){
    s.add(i);
  }
  check(new List.generate(s.length, gengen(s)));

  Queue<int> q = new Queue<int>();
  for (var i = 0; i < 10; i++){
    q.add(i);
  }
  check(new List.generate(q.length, gengen(q.toList())));

  List l = new List();
  l.addAll(["1", "2", "3", "4", "5"]);
  List a = new List.generate(l.length, gengen(l), growable:true);
  check(a);

  List src = [null, [null], [], [1, 2, 3], [[null]]];
  a = new List.generate(src.length, gengen(src));
  check(a);

  src = new List(34567);
  src[34566] = -111111111;
  a = new List.generate(src.length, gengen(src), growable:true);
  check(a);
}
