/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression that denotes a constant variable, a class
 * or a type parameter is a constant expression.
 * @description Checks that an identifier expression that denotes a type parameter 
 * can be assigned to a constant variable.
 * @author rodionov
 */

class C<T> {
  const List lst = [T];
}

main() {
  print(new C().lst);
}
