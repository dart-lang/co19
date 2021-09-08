// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For an expression of the form e<typeArgs>, which is not followed
/// by an argument list (that would turn it into a generic function invocation),
/// the meaning of e<typeArgs> depends on the expression e:
/// ...
/// - If e has a static type which is a generic callable object type (a
/// non-function type with a generic method named call), then e<typeArgs> is
/// equivalent to the instantiated method-tear off e.call<typeArgs>.
/// - Otherwise, if e has a static type which is a generic function type, then
/// e<typeArgs> is equivalent to the instantiated method-tear off
/// e.call<typeArgs>
///
/// @description Checks that it is not an error to tear-off a call method of a
/// generic function type by ?.
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs
import "../../Utils/expect.dart";

T foo1<T>(T value) => value;

main() {
  Function? funcValue1;
  if (2 > 1) {
    funcValue1 = foo1;
  }
  var f1 = funcValue1?.call;
  Expect.equals(42, f1!<int>(42));

  T foo2<T>(T value) => value;
  dynamic funcValue2 = foo2;
  T Function<T>(T) f2 = funcValue2?.call;
  Expect.equals("Lily was here", f2<String>("Lily was here"));
}
