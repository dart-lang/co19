// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks various valid variations of an initializer list. Test
/// type aliases
/// @author sgrekhov@unipro.ru

typedef void FType();

void foo() {}

class S {
  S() {}
  S.named(var x, var y, {var z, var $, var o});
}
typedef SAlias = S;

class C extends SAlias {
  C() : Cc = null, $ = const[], x = "", super();

  C.noSuper() : Cc = null, $ = const[], x = "", func = foo;
  C.onlySuper() : super();
  C.usingThis():  this.Cc = null, this.$ = const[], this.x = "", super();
  C.complexSuper() : super.named(1, const[], z:new C(), $ : new S(), o : null);
  C.cond(bool b) : this.x = b ? 1 : 2;
  C.fromF(FType f) : func = f {}

  var $;
  var x;
  var Cc;
  FType? func;
}

main() {
  new C();
  new C.noSuper();
  new C.onlySuper();
  new C.usingThis();
  new C.complexSuper();
  new C.cond(false);
  new C.fromF(foo);
}
