/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void addAll(Iterable<E> iterable)
 * Appends all elements of the iterable to the end of this list.
 * Extends the length of the list by the number of elements in iterable.
 * @description Checks that all elements of the [collection] are added to the
 * end of list.
 * @author vasya
 */
library addAll_A01_t01;

import "../../../Utils/expect.dart";
import "dart:collection";

test(List create([int length])) {
  List a = create();
  List b = create(1000);
  for (var i = 0; i < b.length; i++){
    b[i] = i;
  }
  a.addAll(b);
  Expect.equals(b.length, a.length);
  for (var i = 0; i < b.length; i++){
    Expect.equals(b[i], a[i]);
  }
  
  a = new List();
  Set set = new Set.from([1, 2, 3, 4, 5]);
  a.addAll(set);
  Expect.listEquals([1, 2, 3, 4, 5], a);
  
  a = new List();
  Queue list = new Queue();
  list.addLast(1);
  list.addLast(2);
  a.addAll(list);
  Expect.listEquals([1, 2],a);
  
  a = new List();
  a.addAll([]);
  Expect.listEquals([], a);
  
  a = new List();
  a.addAll(new Queue());
  Expect.listEquals([], a);
  
  a = new List();
  a.addAll(new Set());
  Expect.listEquals([], a);

  a = [];
  set = new Set.from([1, 2, 3, 4, 5]);
  a.addAll(set);
  Expect.listEquals([1, 2, 3, 4, 5], a);

  a = [];
  list = new Queue();
  list.addLast(1);
  list.addLast(2);
  a.addAll(list);
  Expect.listEquals([1, 2],a);

  a = [];
  a.addAll([]);
  Expect.listEquals([], a);

  a = [];
  a.addAll(new Queue());
  Expect.listEquals([], a);

  a = [];
  a.addAll(new Set());
  Expect.listEquals([], a);

}
