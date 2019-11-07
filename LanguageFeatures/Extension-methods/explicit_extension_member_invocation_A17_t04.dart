/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A composite member invocation on a target expression X is an
 * expression of one of the forms:
 * Composite member invocation on target X	     Corresponding member base name
 *    X.id++, X.id--, ++X.id, --X.id	                        id
 * @description Check explicit extension member invocation in form of ++X.id
 * @issue 39254
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
  int value;
  C() : value = 0 {}
  init() {
    value = 0;
  }
  int get id => value;
  void set id(int v) {
    this.value = v;
  }
}

extension Ext on C {
  int get id => this.value + 1;
}

main() {
  C c = C();
  ++Ext(c).id;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}
