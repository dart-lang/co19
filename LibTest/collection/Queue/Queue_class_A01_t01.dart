/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Queue<E> abstract class 
 * Implements Iterable<E>
 * @description Checks that all members of [Iterable] are implemented.
 * @author kaigorodov
 */
import "dart:collection";
import "all_tests.lib.dart";

Queue create([Iterable content]) {
  if (content == null) {
    return new Queue();
  } else {
    return new Queue.from(content);
  }
}  

main() {
  test(create);  
}
