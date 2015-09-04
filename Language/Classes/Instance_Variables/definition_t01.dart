/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Instance variables are variables whose declarations are
 * immediately contained within a class declaration and that are not declared
 * static. The instance variables of a class C are those instance variables
 * declared by C and the instance variables inherited by C from its superclass.
 * @description Checks that class instance contains declared instance variable
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  int v1 = 1;
}

main() {
  C c = new C();
  Expect.equals(1, c.v1);
}
