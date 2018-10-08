/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int round()
 * If this is not finite (NaN or infinity), throws an UnsupportedError.
 * @description Checks that [:round():] on NaN throws an UnsupportedError.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {double.nan.round();},(e) => e is UnsupportedError);
}
