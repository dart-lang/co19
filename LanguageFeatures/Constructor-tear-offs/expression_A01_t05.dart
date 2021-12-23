// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For an expression of the form e<typeArgs>, which is not followed
/// by an argument list (that would turn it into a generic function invocation),
/// the meaning of e<typeArgs> depends on the expression e:
///
/// - If e denotes a generic class, mixin or type alias declaration (which means
/// that e is an identifier, possibly a qualified identifier, which resolves to
/// the class, mixin or type alias declaration), then e<typeArgs> is a type
/// literal. If followed by .id then that id must denote a constructor, which
/// can then be either torn off or invoked. If followed by == or != or any
/// "stop-token", the expression evaluates to a Type object.
///
/// @description Checks that if in the expression of the form e<typeArgs> e
/// denotes a class, mixin or type alias then e<typeArgs> is a type literal.
/// Test the case when class denoted by e gas a 'call' method
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C<T> {
  void call() {}
}

typedef CAlias<T> = C<T>;

mixin M<T> {
  void call() {}
}

main() {
  var c1 = C<int>;
  Expect.isTrue(c1 is Type);
  Expect.runtimeIsType<Type>(c1);
  Expect.isFalse(c1 is C);
  Expect.runtimeIsNotType<C>(c1);
  Expect.equals("C<int>", c1.toString());

  var c2 = CAlias<int>;
  Expect.isTrue(c2 is Type);
  Expect.runtimeIsType<Type>(c2);
  Expect.isFalse(c2 is C);
  Expect.runtimeIsNotType<C>(c2);
  Expect.equals("C<int>", c2.toString());

  var c3 = M<String>;
  Expect.isTrue(c3 is Type);
  Expect.runtimeIsType<Type>(c3);
  Expect.isFalse(c3 is C);
  Expect.runtimeIsNotType<C>(c3);
  Expect.equals("M<String>", c3.toString());
}
