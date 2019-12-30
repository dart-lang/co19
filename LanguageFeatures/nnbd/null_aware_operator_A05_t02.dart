/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e translates to F then e(args) translates to:
 *  PASSTHRU[F, fn[x] => x(ARGS(args))]
 *
 * @description If e translates to F then e(args) translates to:
 *  PASSTHRU[F, fn[x] => x(ARGS(args))]. Test extension
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,extension-methods
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

extension Tricky on int {
  String call(String s) => s;
}

main() {
  Expect.equals("Lily was here", 2("Lily was here"));
}
