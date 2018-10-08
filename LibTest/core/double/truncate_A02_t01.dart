/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int truncate()
 * If this is not finite (NaN or infinity), throws an UnsupportedError.
 * @description Checks truncation of NaN.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {double.nan.truncate();}, (e) => e is UnsupportedError);
  Expect.throws(() {(-double.nan).truncate();}, (e) => e is UnsupportedError);
}
