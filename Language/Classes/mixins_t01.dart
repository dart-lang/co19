/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 *   metadata abstract? class identifier typeParameters? (superclass mixins?)? 
 * interfaces? ‘{’ (metadata classMemberDefinition)* ‘}’ |
 *   metadata abstract? class mixinApplicationClass
 * ;
 * mixins:
 *   with typeList
 * ;
 * @description Checks that a correct class declaration with mixins is 
 * accepted.
 * @author kaigorodov
 */

class A {
  int a() {return 1;}
}

class M {
  var m;
}

class AM extends A with M {
}

main() {
  AM am = new AM();
  am.m = am.a(); 
}
