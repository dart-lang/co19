/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A simple member invocation on a target expression X is an
 * expression of one of the forms:
 * Member invocation on target X	   Corresponding member name
 *    X.id	                                  id
 * @description Check explicit extension member invocation in form of X.id
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
  String id2 = "No woman no cry";
}

extension Extension1 on C {
  String get id => "Show must go on";
}

extension Extension2 on C {
  String get id2 => "Let it be";
}

main() {
  C c = new C();
  Extension1(c).id2;
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
