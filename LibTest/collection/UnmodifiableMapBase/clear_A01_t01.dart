/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void clear()
 * This operation is not supported.
 * @description Checks that [clear] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "unmodifiablemapbase.lib.dart";

main() {
  UnmodifiableMapBase base = new UnmodifiableMapBaseImpl({});
  Expect.throws(() { base.clear(); }, (e) => e is UnsupportedError);

  base = new UnmodifiableMapBaseImpl({1 : 2, 13: 29});
  Expect.throws(() { base.clear(); }, (e) => e is UnsupportedError);
}
