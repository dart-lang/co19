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

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({});
  Expect.throws(() { view.clear(); }, (e) => e is UnsupportedError);

  view = new UnmodifiableMapView({1 : 2, 13: 29});
  Expect.throws(() { view.clear(); }, (e) => e is UnsupportedError);
}
