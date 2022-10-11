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
/// If a view declaration named View includes a <viewPrimaryConstructor> then it
/// is a compile-time error if the declaration includes a constructor
/// declaration named View. (But it can still contain other constructors.)
///
/// @description Checks that it is a compile-time error if a view declaration
/// named `View` includes a <viewPrimaryConstructor> with zero or more than one
/// parameters
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=extension-types

view class View1() {
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View2(int id, String name) {
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View3(int id, {String name}) {
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View4(int id, [String name]) {
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(View1);
  print(View2);
  print(View3);
  print(View4);
}
