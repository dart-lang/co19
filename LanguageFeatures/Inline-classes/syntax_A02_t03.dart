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
/// named `View` includes a <viewPrimaryConstructor> with named or optional
/// positional parameter
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

view class View1({int id}) {
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View2({required int id}) {
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

view class View3([int id]) {
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(View1);
  print(View2);
  print(View3);
}
