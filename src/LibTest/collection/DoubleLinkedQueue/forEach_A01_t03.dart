/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(E element))
 * Applies the function f to each element of this collection.
 * @description Checks that something is thrown when the argument is null or
 * has a type that is incompatible with the required function type.
 * @static-warning
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
import "dart:collection";
import "../../../Utils/dynamic_check.dart";

main() {
  DoubleLinkedQueue queue = new DoubleLinkedQueue();
  
  //empty queue just ignores invalid arg 
  queue.forEach(null);
  checkTypeError(() => queue.forEach(0)); /// static type warning

  queue.addLast(1);
  Expect.throws(() => queue.forEach(null));
  Expect.throws(() => queue.forEach(1)); /// static type warning
  Expect.throws(() => queue.forEach(1.1)); /// static type warning
  Expect.throws(() => queue.forEach("1")); /// static type warning
}
