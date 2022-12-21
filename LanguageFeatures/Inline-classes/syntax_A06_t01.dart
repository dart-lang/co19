// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <inlineClassDeclaration> is added to the grammar,
/// along with some rules for elements used in inline class declarations:
///
/// <inlineClassDeclaration> ::=
///   'inline' 'class' <typeIdentifier> <typeParameters>? <interfaces>?
///   '{'
///     (<metadata> <inlineMemberDeclaration>)*
///   '}'
///
/// <inlineMemberDeclaration> ::= <classMemberDefinition>
/// ...
/// A compile-time error occurs if an inline class declaration declares an
/// abstract member.
///
/// @description Checks that it is a compile-time error if an inline class
/// declares an abstract member
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class IC1 {
  final int id;

  IC1(this.id);
  void foo();
//^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

inline class IC2 {
  final int id = 42;
  int get value;
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

inline class IC3 {
  final int id = 42;
  void set value(int val);
//^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(IC1);
  print(IC2);
  print(IC3);
}
