/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool keys
 * @description Checks that [keys] return correct key list.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";
import "unmodifiablemapbase.lib.dart";

main() {
  UnmodifiableMapBase base = new UnmodifiableMapBaseImpl({});
  Iterable a = base.keys;
  Expect.isTrue(a.length == 0);

  base = new UnmodifiableMapBaseImpl({"1" : 1, "2" : 2});
  a = base.keys;
  Expect.isTrue(a.length == 2);
  Expect.isTrue(a.contains("1"));
  Expect.isTrue(a.contains("2"));
}
