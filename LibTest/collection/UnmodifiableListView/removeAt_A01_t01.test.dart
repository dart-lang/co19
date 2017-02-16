/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E removeAt(int index)
 * This operation is not supported by an unmodifiable list.
 * @description Checks that [removeAt] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView l = new UnmodifiableListView([1, 2, 3, 4, 5]);

  Expect.throws(() { l.removeAt(-1); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.removeAt(0); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.removeAt(1); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.removeAt(4); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.removeAt(40); }, (e) => e is UnsupportedError);
  Expect.throws(() { l.removeAt(null); }, (e) => e is UnsupportedError);
}
