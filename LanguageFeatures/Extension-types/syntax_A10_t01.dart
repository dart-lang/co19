// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <extensionTypeDeclaration> is added to the grammar,
/// along with some rules for elements used in extension type declarations:
///
/// <extensionTypeDeclaration> ::=
///   'extension' 'type' 'const'? <typeIdentifier> <typeParameters>?
///   <representationDeclaration> <interfaces>?
///   '{'
///     (<metadata> <extensionTypeMemberDeclaration>)*
///   '}'
///
/// <representationDeclaration> ::=
///   ('.' <identifierOrNew>)? '(' <metadata> <type> <identifier> ')'
///
/// <identifierOrNew> ::= <identifier> | 'new'
///
/// <extensionTypeMemberDeclaration> ::= <classMemberDefinition>
/// ...
/// There are no special rules for static members in extension types. They can
/// be declared and called or torn off as usual, e.g.,
/// AnExtensionType.myStaticMethod(42)
///
/// @description Checks that extension types may have static members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type ET1(int id) {
  static int get staticGetter => 42;
}

extension type ET2(int id) {
  static int _v = 0;
  static void set staticSetter(int val) {
    _v = val;
  }
}

extension type ET3(int id) {
  static int staticMethod(int val) => val;
}

extension type ET4(int id) {
  static int staticVar = 0;
}

main() {
  Expect.equals(42, ET1.staticGetter);
  ET2.staticSetter = -42;
  Expect.equals(-42, ET2._v);
  Expect.equals(2, ET3.staticMethod(2));
  Expect.equals(0, ET4.staticVar);
  ET4.staticVar = 1;
  Expect.equals(1, ET4.staticVar);
}
