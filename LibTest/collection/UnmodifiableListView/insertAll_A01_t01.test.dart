/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void insertAll(int at, Iterable<E> iterable)
 * This operation is not supported by an unmodifiable list.
 * @description Checks that [insertAll] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView l =
      new UnmodifiableListView([1, 2, 3, 4, 5, "1", "2", "3"]);

  Expect.throws(() { l.insertAll(1, [1, 2, 3]); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.insertAll(null, [22]); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.insertAll(23, []); }, (e) => e is UnsupportedError);
}
