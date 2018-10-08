/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory LinkedHashSet.from(Iterable<E> iterable)
 * @description Checks that [Error] is thrown if the argument is [null].
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.throws(() {new LinkedHashSet.from(null);}, (e) => e is Error);
}
