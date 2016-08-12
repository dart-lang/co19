/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The return type of a factory whose signature is of the
 * form factory M or the form factory M.id is M if M is not a generic type;
 * otherwise the return type is M <T1, …, Tn>, where T1, …, Tn are the type
 * parameters of the enclosing class.
 * @description Checks that a compile error is produced when assigning the
 * result of invoking factory constructor M to the variable whose type is not
 * assignable to M.
 * @compile-error
 * @author iefremov
 */

class A {
  factory A() {}
}

main() {
  int a = new A();
}
