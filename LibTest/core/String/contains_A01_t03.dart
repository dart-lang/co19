/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract bool contains(Pattern other, [int startIndex = 0])
 * Returns whether this string contains a match of other.
 * If startIndex is provided, only matches at or after that index are considered.
 * It is an error if startIndex is negative or greater than length.
 * @description Checks that empty regexp matches everything.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue("s".contains(new RegExp("")));
  Expect.isTrue("".contains(new RegExp("")));
  Expect.isTrue("Abyrvalg".contains(new RegExp("")));
}

