/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an extension application occurs in a
 * place where it is not the target expression of a simple or composite member
 * invocation. That is, the only valid use of an extension application is to
 * invoke members on it. This is similar to how prefix names can also only be
 * used as member invocation targets. The main difference is that extensions can
 * also declare operators. This also includes null-aware member access like
 * E(o)?.id or E(o)?.[v] because those need to evaluate the target to a value
 * and extension applications cannot evaluate to a value.
 *
 * @description Check that it is a compile-time error if null-aware member
 * access like E(o)?.id is used for explicit extension invocation
 * @issue 39325
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
}

extension Ext on C {
  int get id => 42;
}

main() {
  C c = C();
  Ext(c)?.id;
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified}
}
