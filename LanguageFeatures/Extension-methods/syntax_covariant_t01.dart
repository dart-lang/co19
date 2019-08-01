/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion an extension declaration is a top-level declaration with a grammar
 * similar to:
 * <extension> ::=
 *   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
 *     memberDeclaration*
 *   `}'
 * Instance member declaration parameters must not be marked covariant
 *
 * @description Check that instance member declaration parameters must not be
 * marked covariant
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class A {}

class C extends A {
}

extension on C {
  addChild(covariant A child) {}              //# 01: compile-time error
  addChild2(A c, [covariant A child]) {}      //# 02: compile-time error
  addChild3(A c, {covariant A child}) {}      //# 03: compile-time error
  void set setter (covariant A value) {}      //# 04: compile-time error
  C operator+(covariant A other) => this;     //# 05: compile-time error
}

main() {
  new C();
}
