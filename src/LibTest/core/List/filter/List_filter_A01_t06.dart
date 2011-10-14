/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new list with the elements of this list that satisfy the predicate [f].
 * @description Predicate method [f] is not applicable for some elements of the list.
 * @author vasya
 * @dynamic-type-error
 * @reviewer msyabro
 */

main() {
  bool f(String e) { return e.isEmpty(); } 
  List<String> a = ["1","2","3",4];
  a.filter(f);
}
