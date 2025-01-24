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
/// @description Checks that an implicit invocation of a `.call()` invokes an
/// appropriate function.
/// @author sgrekhov22@gmail.com
/// @author lrhn
/// @issue 59952

// See https://github.com/dart-lang/sdk/issues/55803#issuecomment-2124182059

import '../../../../Utils/expect.dart';

void main() {
  // Real functions, invoked typed or dynamic.
  check = expr<int Function(int)>(good, "function")(42);
  check = expr<Function>(good, "function as Function")(42);
  check = expr<dynamic>(good, "function as dynamic")(42);

  // These implicit `.call` invocations should work:

  // Callable types.
  check = expr<C>(C())(42);
  check = expr<M>(MC())(42);
  check = expr<E>(E.instance)(42);
  check = expr<ET>(ET(null), "ET")(42);
  check = expr<NSMC>(NSMC())(42); // NSM-forwarder as call method.
  // Extension types inheriting those call methods.
  check = expr<ETC>(C())(42);
  check = expr<ETM>(MC())(42);
  check = expr<ETE>(E.instance)(42);
  check = expr<ETET>(ET(null), "ET")(42);
  check = expr<ETNSMC>(NSMC())(42); // NSM-forwarder as call method.
  // Callable extension methods.
  check = expr<EC>(EC())(42);
  check = expr<EM>(EMC())(42);
  check = expr<EE>(EE.instance)(42);
  check = expr<EET>(EET(null), "EET")(42);

  // These implicit tear-offs of callable types should work.
  tearoff = expr<C>(C());
  tearoff = expr<M>(MC());
  tearoff = expr<E>(E.instance);
  tearoff = expr<ET>(ET(null), "ET");
  tearoff = expr<NSMC>(NSMC()); // NSM-forwarder as call method.

  // Dynamic invocations of callable (non-extension/extension-type types).
  check = expr<dynamic>(C(), "C as dynamic")(42);
  check = expr<dynamic>(MC(), "M as dynamic")(42);
  check = expr<dynamic>(E.instance, "E as dynamic")(42);
  check = expr<dynamic>(NSMC(), "NSMC as dynamic")(42);
  // Dynamic invocation going to NSM with no forwarder, as method.
  check = expr<dynamic>(NSMD(), "NSMD as dynamic")(42);
  // Dynamic invocation going to NSM even if call getter, as method.
  check = expr<dynamic>(BNSMC(), "BNSMC as dynamic")(42); // sdk#59952
}

String name = "";

int good(int x) => x;
int bad(int x) => 100 + x;

T expr<T>([Object? value, String? typeName]) {
  name = typeName ?? "$T";
  return value as T;
}

void set check(int result) {
  Expect.isTrue(result < 100, "$name.call(): WRONG: $result");
}

void set tearoff(int Function(int) to) {
  var result = to(42);
  Expect.isTrue(result < 100, "$name.call(): WRONG: $result");
}

class C {
  int call(int x) => x;
}

mixin M {
  int call(int x) => x;
}
class MC = Object with M;

enum E {
  instance;

  int call(int x) => x;
}

extension type const ET(Object? _) {
  int call(int x) => x;
}

class NSMC {
  int call(int x);
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

// Inherited `call` methods on extension types.
extension type ETC(C _) implements C {}
extension type ETM(M _) implements M {}
extension type ETE(E _) implements E {}
extension type ETET(ET _) implements ET {}
extension type ETNSMC(NSMC _) implements NSMC {}

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

// "Bad" type, no `call` method, only a call getter.
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
