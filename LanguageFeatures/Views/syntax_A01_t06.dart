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
/// The token `view` is made a built-in identifier.
///
/// @description Checks that it is a compile-time error import a library with
/// import prefix `view`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=extension-types

import "views_lib.dart" as view;
//                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  view.x;
}
