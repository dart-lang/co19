/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every element of the list satisfy the predicate [f]. Returns false otherwise.
 * @description Tries to pass a function with incompatible argument type.
 * @author vasya
 * @dynamic-type-error
 * @reviewer msyabro
 */

main() {
  List a = ["1","2","3"];
  a.every(bool f(int e) { return true; } );
}
