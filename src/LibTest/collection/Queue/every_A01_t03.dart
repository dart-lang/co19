/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisfy the
 * predicate [f]. Returns false otherwise.
 * @description Checks that something is thrown when the argument is null or
 * has a type that is incompatible with the required function type.
 * @static-warning
 * @author msyabro
 * @reviewer varlax
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "../../../Utils/dynamic_check.dart";

main() {
  Queue q = new Queue();
  
  q.every(null);
  checkTypeError(() => q.every(0)); /// static type warning

  q.addLast(1);
  Expect.throws(() => q.every(null));
  Expect.throws(() => q.every(1)); /// static type warning
}
