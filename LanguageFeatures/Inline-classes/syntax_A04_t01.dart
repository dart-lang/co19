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
/// The name of the representation in an inline class declaration is the name id
/// of the unique final instance variable that it declares, and the type of the
/// representation is the declared type of id.
///
/// @description Checks that static type of id is its declared type and there is
/// a getter named id
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class IC1 {
  final num id0;
  IC1(this.id0);
}

inline class IC2 {
  final int _x;
  IC2.n(int x) : this._x = x;
}

inline class IC3 {
  final int _id = 0;
}

main() {
  IC1 ic1 = IC1(3.14);
  ic1.id0.expectStaticType<Exactly<num>>();
  IC2 ic2 = IC2.n(42);
  ic2._x.expectStaticType<Exactly<int>>();
  IC3 ic3 = IC3();
  ic3._id.expectStaticType<Exactly<int>>();
}
