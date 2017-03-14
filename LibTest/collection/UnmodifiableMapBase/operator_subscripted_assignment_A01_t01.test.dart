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
import "unmodifiablemapbase.lib.dart";

main() {
  UnmodifiableMapBase base = new UnmodifiableMapBaseImpl(
      {1 : 1, 2 : 23, 37 : 49});

  Expect.throws(() { base[1] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { base[2] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { base[37] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { base[0] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { base[-1] = 0; }, (e) => e is UnsupportedError);
  Expect.throws(() { base[null] = 0; }, (e) => e is UnsupportedError);
}
