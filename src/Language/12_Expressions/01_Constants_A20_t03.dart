/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression that denotes a constant variable, class
 * or a type alias is a constant expression.
 * @description Checks that an identifier expression that denotes a type parameter 
 * can not be used as const initializer.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class C<T> {
  static const List lst = const [T];
}

main() {
  print(C.lst);
}
