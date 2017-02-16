/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void retainWhere(bool test(E element))
 * This operation is not supported by an unmodifiable list.
 * @description Checks that [retainWhere] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableListView l = new UnmodifiableListView([1, 2, 3, 4, 5]);
  Expect.throws(() { l.retainWhere((var element) => true); },
      (e) => e is UnsupportedError);
  Expect.throws(() { l.retainWhere((var element) => element > 7); },
      (e) => e is UnsupportedError);
  Expect.throws(() { l.retainWhere((var element) => element = null); },
      (e) => e is UnsupportedError);
}
