/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void action(E entry))
 * Call [action] with each entry in the list.
 * @description Checks that the function [action] is called for each element of
 * the list.
 * @author kaigorodov
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

class A {
  bool checked;
  A(bool checked) { this.checked = checked; }
}

main() {
  List<A> a = new List(100);
  for (int i = 0; i < a.length; i++) {
    a[i] = new A(false);
  }

  LinkedList<MyLinkedListEntry<A>> llist = toLinkedList(a);
  void f(MyLinkedListEntry<A> e) { e.value.checked = true; }
  llist.forEach(f);

  for (int i = 0; i < a.length; i++) {
    Expect.isTrue(a[i].checked);
  }
}
