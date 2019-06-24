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
 * Such a declaration introduces its name (the identifier) into the surrounding
 * scope
 *
 * @description Check that it is compile-error if extension declaration is not
 * top-level
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
  extension MyFancyList<T> on List<T> {       //# 01: compile-time error
    int get doubleLength => this.length * 2;  //# 01: compile-time error
  }                                           //# 01: compile-time error
}

main() {
  extension MyFancyList<T> on List<T> {       //# 02: compile-time error
    int get doubleLength => this.length * 2;  //# 02: compile-time error
  }                                           //# 02: compile-time error
}
