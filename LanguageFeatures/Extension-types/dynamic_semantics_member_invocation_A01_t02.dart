// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with
/// actual type arguments T1, ..., Ts. If the invocation includes an actual
/// argument part (possibly including some actual type arguments) then call it
/// args. If the invocation omits args, but includes a list of actual type
/// arguments then call them typeArgs. Assume that V declares the type variables
/// X1, ..., Xs
/// ...
/// Let Dm be the unique declaration named m that V has.
///
/// Evaluation of this invocation proceeds by evaluating e to an object o.
///
/// Then, if args is omitted and Dm is a getter, execute the body of said getter
/// in an environment where this is bound to o and the representation name
/// denotes a getter that returns o, and the type variables of V are bound to
/// the actual values of T1, .. Ts. If the body completes returning an object o2
/// then the invocation evaluates to o2. If the body throws an object and a
/// stack trace then the invocation completes throwing the same object and stack
/// trace.
///
/// @description Check invocation of an extension type getter in the case when
/// type arguments are omitted. Test that if the body throws an object and a
/// stack trace then the invocation completes throwing the same object and stack
/// trace
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

StackTrace st = StackTrace.fromString("42");

extension type ET1<T extends num>(T id) {
  T get testMe {
    if (2 > 1) {
      Error.throwWithStackTrace("T is $T", st);
    }
    return id;
  }
}

extension type ET2<T extends num>(T id) implements ET1<T> {}

main() {
  ET1<num> et1_1 = ET1(42);
  try {
    et1_1.testMe;
  } catch (e, _st) {
    Expect.equals("T is ${num}", e);
    Expect.equals("$st", "$_st");
  }

  ET1<int> et1_2 = ET1(42);
  try {
    et1_2.testMe;
  } catch (e, _st) {
    Expect.equals("T is ${int}", e);
    Expect.equals("$st", "$_st");
  }

  ET2<int> et2 = ET2(42);
  try {
    et2.testMe;
  } catch (e, _st) {
    Expect.equals("T is ${int}", e);
    Expect.equals("$st", "$_st");
  }
}
