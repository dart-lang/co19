/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a type I includes an instance method named call, and the type
 * of call is the function type F, then I is considered to be more specific than
 * F. It is a static warning if a concrete class implements Function and does
 * not have a concrete method named call unless that class has an implementation
 * of noSuchMethod() distinct from the one declared in class Object.
 * @description Checks that it is not a static warning if concrete class
 * implements Function, does not have a concrete method named call and has an
 * implementation of noSuchMethod.
 * @author ngl@unipro.ru
 */

class C implements Function {
  noSuchMethod(Invocation i) {}
}

main() {
  new C();
}
