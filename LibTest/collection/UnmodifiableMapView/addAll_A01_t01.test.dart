/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Map<K, V> other)
 * This operation is not supported.
 * @description Checks that [addAll] method is not supported.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({});
  Expect.throws(() { view.addAll({}); }, (e) => e is UnsupportedError);
  Expect.throws(() { view.addAll({1 : 1}); }, (e) => e is UnsupportedError);
}
