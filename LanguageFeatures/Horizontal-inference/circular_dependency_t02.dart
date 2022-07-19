// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks that in case of a circular dependency an actual argument
/// which is not a function literal will break the cycle and there will be the
/// inference
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

void f<X, Y>(X Function(Y) a, Y Function(X) b) {
  Expect.equals(num, X);
  Expect.equals(String, Y);
  Expect.equals(typeOf<int Function(String)>(), a.runtimeType);
  Expect.equals(typeOf<String Function(num)>(), b.runtimeType);
}

String g(num n) => 'Hello, $n!';

main() {
  f((v) => v.substring(0).length, g);
}
