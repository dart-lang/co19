// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the inline member m on the receiver e
/// according to the inline type V and with actual type arguments T1, ..., Ts.
/// If the invocation includes an actual argument part (possibly including some
/// actual type arguments) then call it args. Assume that V declares the type
/// variables X1, ..., Xs.
///
/// Let Dm be the declaration named m thath V has.
///
/// Evaluation of this invocation proceeds by evaluating e to an object o.
///
/// Then, if args is omitted and Dm is a getter, execute the body of said
/// getter in an environment where this and the name of the representation are
/// bound to o, and the type variables of V are bound to the actual values of
/// T1, .. Ts. If the body completes returning an object o2 then the invocation
/// evaluates to o2. If the body throws an object and a stack trace then the
/// invocation completes throwing the same object and stack trace.
///
/// @description Check invocation of an inline class getter. Test that if the
/// body completes returning an object `o2` then the invocation evaluates to
/// `o2`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

inline class IC<T> {
  final T id;
  IC(this.id);
}

inline class IC2<T extends num> {
  final T id;
  IC2(this.id);

  List<T> get emptyList => <T>[];
}

inline class IC3 implements IC2<int> {
  final int id;
  IC3(this.id);
}

main() {
  IC<Object?> ic1_1 = IC(42);
  Expect.equals(42, ic1_1.id);

  IC<Object?> ic1_2 = IC("42");
  Expect.equals("42", ic1_2.id);

  IC2<int> ic2_1 = IC2(42);
  ic2_1.emptyList.expectStaticType<Exactly<List<int>>>();
  Expect.throws(() {ic2_1.emptyList.add(3.14 as dynamic);});

  IC2<num> ic2_2 = IC2(3.14);
  ic2_2.emptyList.expectStaticType<Exactly<List<num>>>();
  ic2_2.emptyList.add(42);
  ic2_2.emptyList.add(3.14);

  IC3 ic3 = IC3(3);
  ic3.emptyList.expectStaticType<Exactly<List<int>>>();
}
