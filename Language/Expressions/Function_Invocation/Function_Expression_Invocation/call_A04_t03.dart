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

int bad(int x) => 100 + x;

({int Function(int) call}) rec = (call: bad);

// "Bad" types, no `call` method, only a call getter.
class BC {
  int Function(int) get call => bad;
}

mixin BM {
  int Function(int) get call => bad;
}
class BMC = Object with BM;

enum BE {
  instance;

  int Function(int) get call => bad;
}

extension type BET(Null _) {
  int Function(int) get call => bad;
}

// Representation type getter is a getter.
extension type BERT(int Function(int) call) {}

class BNSMC {
  // Should be NSM-forwarder.
  int Function(int) get call;
  Object? noSuchMethod(Invocation i) {
    if (i.memberName == #call) {
      if (i.isMethod) {
        return i.positionalArguments.first;
      } else if (i.isGetter) {
        return bad;
      }
    }
    return super.noSuchMethod(i);
  }
}

class NSMD {
  const NSMD();
  // No `call` member declared at all, can only be invoked dynamically.
  noSuchMethod(i) {
    if (i.memberName == #call) {
      if (i.isMethod) {
        return i.positionalArguments.first;
      } else if (i.isGetter) {
        return bad;
      }
    }
    return super.noSuchMethod(i);
  }
}
