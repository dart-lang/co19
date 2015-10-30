/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class may be defned as a mixin application.
 *
 * classDefinition:
 * metadata abstract? class mixinApplicationClass
 * ;
 * mixinClassApplication:
 * identifer typeParameters? `=' mixinApplication `;'
 *
 * mixinApplication:
 * type mixins interfaces?
 * ;
 *
 * A mixin application of the form S with M ; defines a class C with superclass
 * S.
 * A mixin application of the form S with M 1 , . . . , M k ; defines a class C
 * whose superclass is the application of the mixin composition Mk−1 ∗ ...∗ M1
 * to S.
 * In both cases above, C declares the same instance members as M (respec-
 * tively, M k ).
 * @description Checks that mixin application of the form S with M ; defines a
 * class C with superclass S. So if M and S have methods with the same names
 * then mixin method overrides the one from S. Test class C = S with M syntax
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class S {
  String get m => "S";
}

class M {
  String get m => "M";
}

class C = S with M;

main() {
  C c = new C();
  Expect.equals("M", c.m);
}
