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
/// @description Checks that it if a view declaration named `View` includes a
/// <viewPrimaryConstructor> then it can contain other (than named `View`)
/// factory constructors
///
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=extension-types

import "../../Utils/expect.dart";

view class View(int id) {
  factory View.f1(int x, {int y = 0}) => View(x + y);
  factory View.f2(int x, [int y = 0]) => View(x + y);
  factory View.f3([int x = 0]) => View(x);
  factory View.f4({int x = 1}) => View(x);
  factory View.f5(int id) = View;
}

main() {
  Expect.equals(1, View.f1(1).id);
  Expect.equals(3, View.f1(1, y: 2).id);
  Expect.equals(4, View.f2(4).id);
  Expect.equals(9, View.f2(4, 5).id);
  Expect.equals(6, View.f3(6).id);
  Expect.equals(0, View.f3().id);
  Expect.equals(7, View.f4(x: 7).id);
  Expect.equals(1, View.f4().id);
  Expect.equals(42, View.f5(42).id);
}
