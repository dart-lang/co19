/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Initializing formals are executed during the execution of
 * generative constructors detailed below. Executing an initializing formal
 * this.id causes the field id of the immediately surrounding class to be
 * assigned the value of the corresponding actual parameter, unless id is a
 * final variable that has already been initialized, in which case a runtime
 * error occurs.
 * @description Checks that runtime error occurs, not compile-error, if id
 * is final instance variable that has already been initialized.
 * are assigned correctly.
 * @static-warning
 * @author ilya
 * @issue 13335
 */
import "../../../../Utils/expect.dart";

class A {
  A(this.a, this.b);
  var a;
  final b = 2;
}

main() {
  Expect.throws(() => new A(1,2));
}
