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
/// @description Check that it is not an error to declare a variable named
/// `base`, `sealed`, `interface`, `abstract` or `mixin`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

main() {
  var base = 1;
  var sealed = 2;
  var interface = 3;
  var abstract = 4;
  var mixin = 5;

  print(base);
  print(sealed);
  print(interface);
  print(abstract);
  print(mixin);
}
