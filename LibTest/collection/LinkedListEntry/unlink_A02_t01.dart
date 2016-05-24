/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void unlink()
 * ...
 * The entry must currently be in a linked list when this method is called.
 * @description Checks that the entry must currently be in a linked list when
 * this method is called.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "LinkedListEntry.lib.dart";

main() {
  MyLinkedListEntry<int> entry = new MyLinkedListEntry<int>(1);
  Expect.throws(() {entry.unlink();});
}
