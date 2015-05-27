/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that correct mixin applications are accepted.
 * @author kaigorodov
 */
 
class A {
  var x;
}

class M1 {
  var x1;
}

class M2 {
  var x2;
}

class B1 = A with M1;
class B2 = A with M1, M2;
class B3 = B1 with M2;

main() {
  B1 b1 = new B1();
  B2 b2 = new B2();
  B3 b3 = new B3();
  String s=b1.toString()+b2.toString()+b3.toString(); 
}
