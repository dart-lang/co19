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
/// In a view declaration named View that does not include a
/// <viewPrimaryConstructor>, the name of the representation is the name id of
/// the unique final instance variable that it declares, and the type of the
/// representation is the declared type of id.
///
/// @description Checks runtime type and values of a view
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=extension-types

import "../../Utils/expect.dart";

view class View1 {
  final num id0;
  View1(int x) : id0 = x;
}

view class View2 {
  final num _x;
  View2(double y) : _x = y;
}

main() {
  View1 v1 = View1(42);
  View2 v2 = View2(3.14);
  Expect.equals(42, v1.id0);
  Expect.equals(3.14, v2._x);
  Expect.isTrue(v1 is num);
  Expect.isTrue(v1 is int);
  Expect.isTrue(v2 is num);
  Expect.isTrue(v2 is double);
}