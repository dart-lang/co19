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
/// A compile-time error occurs if a view declaration declares an abstract
/// member. A compile-time error occurs if a view declaration has a
/// <viewPrimaryConstructor> and declares an instance variable. Finally, a
/// compile-time error occurs if a view does not have a
/// <viewPrimaryConstructor>, and it does not declare an instance variable, or
/// it declares more than one instance variable.
///
/// @description Checks that it is a compile-time error if a view declaration
/// has a <viewPrimaryConstructor> and declares an instance variable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

view class View1(int id) {
  final int id;
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View2(int id) {
  int _x;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View3(int id) {
  late int _y;
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View4(int id) {
  final int _y = 0;
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View5(int id) {
  final int _z;
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  View5.init(this.id, this._z);
}

main() {
  print(View1);
  print(View2);
  print(View3);
  print(View4);
  print(View5);
}
