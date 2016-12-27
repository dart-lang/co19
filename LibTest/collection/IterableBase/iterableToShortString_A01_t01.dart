/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String iterableToShortString(Iterable iterable,
 * [String leftDelimiter = '(', String rightDelimiter = ')'])
 * Convert an [Iterable] to a string like [IterableBase.toString].
 * @description Checks that [IterableBase.iterableToShortString()] converts an
 * [iterable] to correct string and uses "(" and ")" as default delimiters.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.equals("(1, 2, 3, -1)",
      IterableBase.iterableToShortString([1, 2, 3, -1]));
}
