// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar is:
///
/// classDeclaration  ::= (classModifiers | mixinClassModifiers) 'class' typeIdentifier
///                       typeParameters? superclass? interfaces?
///                       '{' (metadata classMemberDeclaration)* '}'
///                       | classModifiers 'class' mixinApplicationClass
///
/// classModifiers    ::= 'sealed'
///                     | 'abstract'? ('base' | 'interface' | 'final')?
///
/// mixinClassModifiers ::= 'abstract'? 'base'? 'mixin'
///
/// mixinDeclaration  ::= 'base'? 'mixin' typeIdentifier typeParameters?
///                       ('on' typeNotVoidList)? interfaces?
///                       '{' (metadata classMemberDeclaration)* '}'
///
/// @description Check that it is not an error to create a class named `base` or
/// `sealed`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

class base {}

class sealed {}

main() {
  print(base);
  print(sealed);
}
