/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let K be a class declaration with the same constructors,
 * superclass and interfaces as C, and the instance members declared by M
 * (respectively M1,...,Mk).
 * ...
 * It is a compile-time error if the declaration of K would cause a
 * compile-time error.
 * @description Checks that it is a compile-time error if S and M declare
 * getter and method with the same names
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @issue 23878
 */

class S {
  bool get m => false;
}

class M {
  int m() => 1;
}

class C = S with M;

main() {
  new C().m;
}
