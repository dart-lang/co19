// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An initializer list begins with a colon, and consists of a
/// comma-separated list of individual initializers.
///
/// ⟨initializers⟩ ::= ‘:’ ⟨initializerListEntry⟩ (‘,’ ⟨initializerListEntry⟩)*
/// ⟨initializerListEntry⟩ ::= super ⟨arguments⟩
/// | super ‘.’ ⟨identifier⟩ ⟨arguments⟩
/// | ⟨fieldInitializer⟩
/// | ⟨assertion⟩
/// ⟨fieldInitializer⟩ ::=
/// (this ‘.’)? ⟨identifier⟩ ‘=’ ⟨initializerExpression⟩
/// ⟨initializerExpression⟩ ::=
/// ⟨assignableExpression⟩ ⟨assignmentOperator⟩ ⟨expression⟩
/// | ⟨conditionalExpression⟩
/// | ⟨cascade⟩
/// | ⟨throwExpression⟩
///
/// As a special disambiguation rule, an ⟨initializerExpression⟩ can not derive
/// a ⟨functionExpression⟩
///
/// @description Checks that cascaded invocations are allowed in field
/// initializers.
/// @author rodionov,
/// @author sgrekhov@unipro.ru

import "../../../../Utils/expect.dart";

class C {
  var foo;
  static var _x = new List<int>.empty(growable: true);

  C() : this.foo = _x
    ..add(1)
    ..add(2);
}

main() {
  Expect.listEquals([1, 2], new C().foo);
}
