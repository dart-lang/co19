/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a member invocation on an extension application
 * is the return type of the extension member with the corresponding member name
 * of the invocation, with the explicit or inferred type arguments of the
 * extension application replacing the type parameters bound by the extension,
 * and the explicit or inferred type arguments of the invoked member replacing
 * the type parameters bound by the member
 *
 * @description Check static type of the extension member
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
}

extension Ext on C {
  int bar() => 42;
}

void foo(String s) {}

main() {
  C c = C();
  foo(Ext(c).bar());
//    ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
