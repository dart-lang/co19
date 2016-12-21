/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String iterableToFullString(Iterable iterable,
 * [String leftDelimiter = '(', String rightDelimiter = ')'])
 * Converts an [Iterable] to a string.
 * Converts each elements to a string, and separates the results by ", ". Then
 * wraps the result in [leftDelimiter] and [rightDelimiter].
 * @description Checks that IterableBase.iterableToFullString() converts each
 * elements to a string, separates the results by ", ", and than wraps into "("
 * and ")" if delimiters are not clearly specified.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  String expected = "(1, 2, 3, 4, 5)";
  List l = [1, 2, 3, 4, 5];
  Expect.equals(expected, IterableBase.iterableToFullString(l));
}
