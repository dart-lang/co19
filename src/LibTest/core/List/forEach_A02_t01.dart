/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an exception or error if the argument 
 * is null or is not a function and doesn't have a call() method with an appropriate 
 * signature.
 * @description Checks that something is thrown if the list isn't empty and the argument
 * is null or the argument is not-null, but incompatible with the required function type. 
 * @author pagolubev
 * @reviewer varlax
 * @needsreview issue 3223
 */
import "../../../Utils/expect.dart";

check(list, arg) {
  Expect.throws(() => list.forEach(arg));
}

main() {
  check([1], 1);
  check([1], null);
  check([1], "");
  check([1], 3.14);

  check(const [1], 1);
  check(const [1], null);
  check(const [1], "");
  check(const [1], 3.14);

  check(new List.from([1]), 1);
  check(new List.from([1]), null);
  check(new List.from([1]), "");
  check(new List.from([1]), 3.14);
}
