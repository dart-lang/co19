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
/// @description Check invocation of an extension type getter. Test that if the
/// body completes returning an object `o2` then the invocation evaluates to
/// `o2`.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

extension type ET1<T>(T id) {}

extension type ET2<T extends num>(T id) {
  List<T> get emptyList => <T>[];
}

extension type ET3(int id) implements ET2<int> {}

main() {
  ET1<Object?> et1_1 = ET1(42);
  Expect.equals(42, et1_1.id);

  ET1<String> et1_2 = ET1("42");
  Expect.equals("42", et1_2.id);

  ET2<int> et2_1 = ET2(42);
  et2_1.emptyList.expectStaticType<Exactly<List<int>>>();
  Expect.throws(() {et2_1.emptyList.add(3.14 as dynamic);});

  ET2<num> et2_2 = ET2(3.14);
  et2_2.emptyList.expectStaticType<Exactly<List<num>>>();
  et2_2.emptyList.add(42);
  et2_2.emptyList.add(3.14);

  ET3 et3 = ET3(3);
  et3.emptyList.expectStaticType<Exactly<List<int>>>();
}
