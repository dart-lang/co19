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
/// method on a type which has an instance getter named `call`.
/// @author sgrekhov22@gmail.com
/// @author lrhn
/// @issue 59963
/// @issue 59964

// See https://github.com/dart-lang/sdk/issues/55803#issuecomment-2124182059

void main() {
  // These should not compile, call is a getter.
  // Instance getter.
  expr<BC>(BC())(42);
//^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<BM>(BMC())(42);
//^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<BE>(BE.instance)(42);
//^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<BET>(BET(null), "BET")(42); // sdk#59963
//^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<BERT>(BERT(bad), "BERT")(42); // sdk#59963
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<BNSMC>(BNSMC())(42);
//^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<NSMD>(NSMD())(42);
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  expr<({int Function(int) call})>(rec, "record")(42); // sdk#59964
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

T expr<T>([Object? value, String? typeName]) {
  return value as T;
}

int foo(int x) => x;

({int Function(int) call}) rec = (call: foo);

// "Bad" types, no `call` method, only a call getter.
class BC {
  int Function(int) get call => foo;
}

mixin BM {
  int Function(int) get call => foo;
}
class BMC = Object with BM;

enum BE {
  instance;

  int Function(int) get call => foo;
}

extension type BET(Null _) {
  int Function(int) get call => foo;
}

// Representation type getter is a getter.
extension type BERT(int Function(int) call) {}

class BNSMC {
  // Should be NSM-forwarder.
  int Function(int) get call;
  Object? noSuchMethod(Invocation i) => null;
}

class NSMD {
  const NSMD();
  // No `call` member declared at all, can only be invoked dynamically.
  Object? noSuchMethod(i) => null;
}
