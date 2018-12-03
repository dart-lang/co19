/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion That could make it ambiguous whether { … ? … : … } is a
 * one-element set or a one-entry map. Luckily, the current grammar does not
 * allow for an ambiguous parsing. The token following a question mark dictates
 * whether it's part of a null-aware operation or the beginning of a new
 * expression.
 *
 * @description Checks usage of a conditional expression when a set literal is
 * declared.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  bool b = true;
  const bool b1 = true;

  var v1 = {!b ? 1 : 11};
  Expect.isTrue(v1 is Set);

  var v2 = {b ? 1 : 11, b ? 2 : 12, b ? 3 : 13};
  Expect.isTrue(v2 is Set);

  const v3 = const <num>{b1 ? 1 : 1.0, !b1 ? 2 : 12, 13};
  Expect.isTrue(v3 is Set);
  Expect.isTrue(identical(v3, const <num>{1, 12, 13}));
}
