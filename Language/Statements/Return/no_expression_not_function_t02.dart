/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A return statement with no expression, return; is executed as
 * follows:
 * . . .
 * Otherwise the return statement is executed by executing the statement
 * return null; if it occurs inside a method, getter, setter or factory;
 * otherwise, the return statement necessarily occurs inside a generative
 * constructor, in which case it is executed by executing return this;
 *
 * @description Checks that a return statement of the form "return;" in a
 * generative constructor is executed by executing "return this;".
 *
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

class Foo {
  Foo() { return; }
}

class Bar {
  Bar() : super() { return; }
}

main() {
  Expect.isTrue(new Foo() is Foo);
  Expect.isNotNull(new Foo());
  Expect.isTrue(new Bar() is Bar);
  Expect.isNotNull(new Bar());
}

