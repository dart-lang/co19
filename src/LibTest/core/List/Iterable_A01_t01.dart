/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E last
 * Returns the last element.
 * @description Checks that the last element of the list is returned.
 * @author kaigorodov
 */
import "../../core/Iterable/allTests.lib.dart";

Iterable create([Iterable content]) {
  List res = new List();
  if (content!=null) {
    res.addAll(content);
  }
  return res;
}  

main() {
  test(create);  
}
