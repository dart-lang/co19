/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void replaceRange(int start, int end, Iterable<E> iterable)
 * This operation is not supported by an unmodifiable list.
 * @description Checks that [replaceRange] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView l = new UnmodifiableListView([1, 2, 3, 4, 5]);
  Expect.throws(() { l.replaceRange(1, 3, []); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.replaceRange(-1, 4, ["a", "b", "c"]); },
      (e) => e is UnsupportedError);
  Expect.throws(() { l.replaceRange(8, 1, ["a", "b", "c"]); },
      (e) => e is UnsupportedError);
}
