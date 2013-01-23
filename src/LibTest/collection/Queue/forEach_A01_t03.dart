/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] to each element of the collection.
 * @description Checks that something is thrown when the argument is null or
 * has a type that is incompatible with the required function type.
 * @author msyabro
 * @reviewer varlax
 */
import "dart:collection";
import "../../../Utils/dynamic_check.dart";

main() {
  Queue q = new Queue(); // no type argument => no type errors in checked mode
  
  //empty queue just ignores invalid arg 
  q.forEach(null);
  checkTypeError(() => q.forEach(0)); /// static type warning

  q.addLast(1);
  Expect.throws(() => q.forEach(null));
  Expect.throws(() => q.forEach(1)); /// static type warning
  Expect.throws(() => q.forEach(1.1)); /// static type warning
  Expect.throws(() => q.forEach("1")); /// static type warning
}
