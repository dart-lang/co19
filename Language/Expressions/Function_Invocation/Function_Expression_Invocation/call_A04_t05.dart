// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function expression invocation i has the form
/// ef <A1, . . . , Ar>(a1, . . . , an, xn+1: an+1, . . . , xn+k: an+k),
/// where ef is an expression.
/// ...
/// Let F be the static type of ef . If F is an interface type that has a method
/// named call, i is treated as the ordinary invocation
/// ef .call<A1, . . . , Ar>(a1, . . . , an, xn+1: an+1, . . . , xn+k: an+k)
///
/// @description Checks that it is a compile-time error to invoke a `call()`
/// method on an implicit tear-off of extension method.
/// @author sgrekhov22@gmail.com
/// @author lrhn

// See https://github.com/dart-lang/sdk/issues/55803#issuecomment-2124182059

void main() {
  // These should not compile, call is a getter.
  // Tear-offs that should not work:
  // Callable extension methods. (No implicit tear-off of extension methods!)
  tearoff = expr<EC>(EC());
//          ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  tearoff = expr<EM>(EMC());
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  tearoff = expr<EE>(EE.instance);
//          ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  tearoff = expr<EET>(EET(null), "EET");
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void set tearoff(int Function(int) to) {
  to(42);
}

T expr<T>([Object? value, String? typeName]) {
  return value as T;
}

class EC {}

extension on EC {
  int call(int x) => 43;
}

enum EE {
  instance;
}

extension on EE {
  int call(int x) => 43;
}

mixin EM {}
class EMC = Object with EM;

extension on EM {
  int call(int x) => 43;
}

extension type EET(Object? _) {}

extension on EET {
  int call(int x) => 43;
}
