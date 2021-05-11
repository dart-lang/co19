// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion classDefinition:
///   metadata abstract? class identifier typeParameters? (superclass mixins?)? 
/// interfaces? ‘{’ (metadata classMemberDefinition)* ‘}’ |
///   metadata abstract? class mixinApplicationClass
/// ;
/// .  .  .
/// classMemberDefinition:
///   declaration ';' |
///   methodSignature functionBody
/// ;
/// methodSignature:
///   constructorSignature initializers? |
///   factoryConstructorSignature |
///   static? functionSignature |
///   static? getterSignature |
///   static? setterSignature |
///   operatorSignature
/// ;
/// @description Checks that there is a compile-time error if a concrete class
/// has an abstract operator definition without an implementation
///
/// @issue 27508
/// @issue 42199
/// @author msyabro


class A {
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  operator ==(dynamic other);
}

main() {
  new A();
}
