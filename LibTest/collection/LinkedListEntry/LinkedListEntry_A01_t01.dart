/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedListEntry()
 * @description Checks that [LinkedListEntry()] creates a new linked list entry
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "LinkedListEntry.lib.dart";

main() {
  LinkedListEntry entry = new MyLinkedListEntry(1);
}
