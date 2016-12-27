/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract int indexOf(Pattern pattern, [int start])
 * It is an error if start is negative or greater than length.
 * @description Tries to pass an index that is out of range
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws((){"string".indexOf("s", -1);}, (e) => e is Error);
  Expect.throws((){"a".indexOf("a", 2);}, (e) => e is Error);
}
