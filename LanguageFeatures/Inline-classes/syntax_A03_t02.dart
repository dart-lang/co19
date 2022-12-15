// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <viewDeclaration> is added to the grammar, along with
/// some rules for elements used in view declarations:
///
/// <viewDeclaration> ::=
///   'view' 'class' <typeIdentifier> <typeParameters>?
///       <viewPrimaryConstructor>?
///       <interfaces>?
///   '{'
///     (<metadata> <viewMemberDeclaration>)*
///   '}'
///
/// <viewPrimaryConstructor> ::=
///   '(' <type> <identifier> ')'
///
/// <viewMemberDeclaration> ::=
///   <classMemberDefinition>
/// ...
/// If a view declaration named View does not include a <viewPrimaryConstructor>
/// then an error occurs unless the view declares exactly one instance variable
/// v. An error occurs unless the declaration of v is final. An error occurs if
/// the declaration of v is late.
///
/// @description Checks that it is a compile-time error if a view declaration
/// does not include a <viewPrimaryConstructor> and declares an instance
/// variable but this variable is not final
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

view class View1 {
  int id;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  View1(this.id);
}

view class View2 {
  int id;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  View2(int id) {}
}

main() {
  print(View1);
  print(View2);
}
