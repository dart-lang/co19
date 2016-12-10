/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> abstract class 
 * Implements Iterable<E>
 * @description Checks that the class List fully implements Iterable.
 * @author kaigorodov
 */
import "../../core/Iterable/allTests.lib.dart";

Iterable create([Iterable content]) {
  if (content == null) {
    return new List();
  } else {
    return new List.from(content);
  }
}  

main() {
  test(create);  
}
