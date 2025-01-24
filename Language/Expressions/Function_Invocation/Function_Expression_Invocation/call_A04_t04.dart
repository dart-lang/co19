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
/// method on a type which has an extension getter named `call`.
/// @author sgrekhov22@gmail.com
/// @author lrhn
/// @issue 59962

// See https://github.com/dart-lang/sdk/issues/55803#issuecomment-2124182059

void main() {
  // These should not compile, call is a getter.
  // Extension getter.
  expr<BEC>(BEC())(42);
//^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<BEM>(BEMC())(42);
//^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<BEE>(BEE.instance)(42);
//^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<BEET>(BEET(null), "EET")(42);
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

T expr<T>([Object? value, String? typeName]) {
  return value as T;
}

// "Bad" types, no `call` method, only a call getter.
// Empty types with `call` extension getters.
class BEC {}

extension on BEC {
  int Function(int) get call => foo;
}

enum BEE {
  instance;
}

extension on BEE {
  int Function(int) get call => foo;
}

mixin BEM {}
class BEMC = Object with BEM;

extension on BEM {
  int Function(int) get call => foo;
}

extension type const BEET(Null _) {}

extension on BEET {
  int Function(int) get call => foo;
}

int foo(int x) => x;
