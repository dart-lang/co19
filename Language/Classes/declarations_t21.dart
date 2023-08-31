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
/// .  .  .
/// declaration:
///   constantConstructorSignature (redirection | initializers)? |
///   constructorSignature (redirection | initializers)? |
///   external constantConstructorSignature |
///   external constructorSignature |
///   (external static?)? getterSignature |
///   (external static?)? setterSignature |
///   external? operatorSignature |
///   (external static?)? functionSignature |
///   static (final | const) type? staticFinalDeclarationList |
///   final type? initializedIdentifierList |
///   static? (var | type) initializedIdentifierList
/// ;
/// staticFinalDeclarationList:
///   staticFinalDeclaration (', ' staticFinalDeclaration)*
/// ;
/// staticFinalDeclaration:
///   identifier '=' expression
/// ;
/// @description Checks that it is a compile-time error if an abstract setter
/// declaration does not end with a semicolon.
/// @author msyabro


class A {
  set val(var v)
  var _val;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new A();
}
