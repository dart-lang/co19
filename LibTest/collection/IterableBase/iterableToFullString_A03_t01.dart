/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String iterableToFullString(Iterable iterable,
 * [String leftDelimiter = '(', String rightDelimiter = ')'])
 * ...
 * Converts each elements to a string, and separates the results by ", ". Then
 * wraps the result in [leftDelimiter] and [rightDelimiter].
 * @description Checks that IterableBase.iterableToFullString() wraps the result
 * in leftDelimiter and rightDelimiter
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.equals("[1, 2, 3, -1}",
      IterableBase.iterableToFullString([1, 2, 3, -1], "[", "}"));
}
