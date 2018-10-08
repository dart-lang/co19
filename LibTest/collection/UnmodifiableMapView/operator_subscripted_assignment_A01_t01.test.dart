/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(int index, E value)
 * This operation is not supported by an unmodifiable map base.
 * @description Checks that operation is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({1 : 1, 2 : 23, 37 : 49});

  Expect.throws(() { view[1] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { view[2] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { view[37] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { view[0] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { view[-1] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { view[null] = 0; }, (e) => e is UnsupportedError);
}
