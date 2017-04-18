/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class LinkedList<E extends LinkedListEntry>
 * This is not a [List] implementation. Despite its name, this class does not
 * implement the [List] interface.
 * @description Checks that linked list is not a [List] implementation.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "LinkedList.lib.dart";

main() {
  LinkedList<MyLinkedListEntry> list = new LinkedList<MyLinkedListEntry>();
  Expect.isFalse(list is List);
}
