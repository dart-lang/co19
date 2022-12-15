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
/// @description Checks that it is no compile-time error if a view declaration
/// has no <viewPrimaryConstructor> and declares a final instance variable and
/// no constructor or a constructor, as long as the variable is initialised
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

view class View1 {
  final int id = 0;
}

view class View2 {
  final int _x;
  View2() : _x = 0;
}

main() {
  Expect.equals(0, View1().id);
  Expect.equals(0, View2()._x);
}
