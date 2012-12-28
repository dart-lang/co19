/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if one element of the collection satisfies the
 * predicate [f]. Returns false otherwise.
 * @description Checks that something is thrown when the argument is null or
 * has a type that is incompatible with the required function type.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/dynamic_check.dart";

main() {
  Queue list = new Queue();
  
  list.some(null);
  checkTypeError(() => list.some(1)); /// static type warning

  list.addLast(1);
  
  Expect.throws(() => list.some(null));
  Expect.throws(() => list.some(1)); /// static type warning
  Expect.throws(() => list.some(1.1)); /// static type warning
  Expect.throws(() => list.some("")); /// static type warning
}
