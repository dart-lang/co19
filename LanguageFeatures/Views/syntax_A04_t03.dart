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
/// The name of the representation in a view declaration that includes a
/// <viewPrimaryConstructor> is the identifier id specified in there, and the
/// type of the representation is the declared type of id.
///
/// @description Checks that static type of id is its declared type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=extension-types

view class View1(num id0) {
}

main() {
  View1 v1 = View1(1);
  v1.id0.isOdd;
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
