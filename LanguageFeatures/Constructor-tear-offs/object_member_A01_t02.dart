// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When f is an expression whose static type is a generic function
/// type, and f<int> is an explicit generic function instantiation that is not a
/// compile-time error, expressions like f<int>.m() and f<int>.m can be used to
/// invoke or tear off members of the given function object (that is, members of
/// Object, plus the given call method, plus any applicable extension methods).
///
/// @description Checks that if f<int> is an explicit generic function
/// instantiation that is not a compile-time error, expressions like f<int>.m
/// @author sgrekhov@unipro.ru
import "../../Utils/expect.dart";

T f<T>(T t) => t;

main() {
  var v = f<int>;
  Expect.equals(v.toString, f<int>.toString);
  Expect.equals(v.hashCode, f<int>.hashCode);
  Expect.equals(v.runtimeType, f<int>.runtimeType);
  Expect.equals(v.call, f<int>.call);
}
