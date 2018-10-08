/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a type I includes an instance method named call, and the type
 * of call is the function type F, then I is considered to be more specific than
 * F. It is a static warning if a concrete class implements Function and does
 * not have a concrete method named call unless that class has an implementation
 * of noSuchMethod() distinct from the one declared in class Object.
 * @description Checks that it is no compile error if concrete class implements
 * Function and has no method named call.
 * @author ilya
 */

class C implements Function {}

main() {
  new C();
}
