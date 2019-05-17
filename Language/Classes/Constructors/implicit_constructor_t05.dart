/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iff no constructor is specified for a class C, it implicitly has
 * a default constructor C() : super() {}, unless C is class Object.
 * @description Checks that implicit construct calls a super constructor. Test
 * type alias
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

class A {
  A() : i = 13;
  int i;
}
typedef AAlias = A;

class C extends AAlias {}

main() {
  Expect.equals(13, (new C()).i);
}
