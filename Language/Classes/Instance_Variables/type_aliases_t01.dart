/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Instance variables are variables whose declarations are
 * immediately contained within a class declaration and that are not declared
 * static. The instance variables of a class C are those instance variables
 * declared by C and the instance variables inherited by C from its superclass.
 * @description Checks that class may contain type alias as a member
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

class C {
  CAlias c = new C();
}
typedef CAlias = C;

main() {
  C c = new C();
  Expect.isNotNull(c.c);
}
