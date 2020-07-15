/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion V remove(Object key)
 * This operation is not supported.
 * @description Checks that [remove] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({1 : 1, 2 : 2});
  Expect.throws(() { view.remove(1); }, (e) => e is UnsupportedError);
  Expect.throws(() { view.remove(5); }, (e) => e is UnsupportedError);
}
