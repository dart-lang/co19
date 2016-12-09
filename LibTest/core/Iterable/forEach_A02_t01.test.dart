/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void forEach(void f(E element))
 * Throws an exception or error if the argument 
 * is null or is not a function and doesn't have a call() method with an
 * appropriate signature.
 * @needsreview undocumented
 * @description Checks that something is thrown if the list isn't empty and the
 * argument is null or the argument is not-null, but incompatible with the
 * required function type.
 * @author pagolubev
 */
library forEach_A02_t01;
import "../../../Utils/expect.dart";

check(list, arg) {
  Expect.throws(() => list.forEach(arg));
}

test(Iterable create([Iterable content])) {
  check(create([1]), 1);
  check(create([1]), null);
  check(create([1]), "");
  check(create([1]), 3.14);
}
