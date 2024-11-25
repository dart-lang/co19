// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function body is either:
/// ...
/// - of the form `=> e` or the form `async => e`, which both return the value
///   of the expression `e` as if by a `return e`. ...  Let `T` be the declared
///   return type of the function that has this body. It is a compile-time error
///   if one of the following conditions hold:
///   – The function is synchronous, `T` is not `void`, and it would have been a
///     compile-time error to declare the function with the body `{ return e; }`
///     rather than `=> e`.
///
/// @description Checks that it is not an error to declare a synchronous
/// function with a short syntax and the return type `FutureOr<void>`.
/// @author sgrekhov22@qmail.com

import 'dart:async';

FutureOr<void> f1() => 1;
FutureOr<void> f2() => null;
FutureOr<void> f3<T>(T t) => t;

FutureOr<void> f4() {
  return 1;
}

main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
}
