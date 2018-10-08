/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(int index, E value)
 * This operation is not supported by an unmodifiable list.
 * @description Checks that operation is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView l = new UnmodifiableListView([1, 2, 3, 4, 5]);
  Expect.throws(() { l[0] = 1; }, (e) => e is UnsupportedError);
  Expect.throws(() { l[1] = 1; }, (e) => e is UnsupportedError);
  Expect.throws(() { l[2] = 1; }, (e) => e is UnsupportedError);
  Expect.throws(() { l[3] = 1; }, (e) => e is UnsupportedError);
  Expect.throws(() { l[4] = 1; }, (e) => e is UnsupportedError);
  Expect.throws(() { l[-1] = 1; }, (e) => e is UnsupportedError);
  Expect.throws(() { l[7] = 1; }, (e) => e is UnsupportedError);
  Expect.throws(() { l[null] = 1; }, (e) => e is UnsupportedError);
}
