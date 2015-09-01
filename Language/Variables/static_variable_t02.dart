/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable is a variable that is not associated with
 * a particular instance, but rather with an entire library or class. Static
 * variables include library variables and class variables. Class variables
 * are variables whose declaration is immediately nested inside a class
 * declaration and includes the modifer static.
 * A library variable is implicitly static. It is a compile-time error to
 * preface a top-level variable declaration with the built-in identier static.
 * @description Checks that it is a compile-time error to preface a top-level
 * variable declaration with the built-in identifier static.
 * @compile-error
 * @author kaigorodov
 */

static var foo = 1;

main() {
  Expect.equals(1, foo);
}
