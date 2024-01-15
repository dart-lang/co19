// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The extension type erasure of an extension type V is obtained by
/// recursively replacing every subterm of V which is an extension type by the
/// corresponding representation type.
///
/// Let X1 extends B1, .. Xs extends Bs be a declaration of the type parameters
/// of a generic entity (it could be a generic class, extension type, mixin,
/// typedef, or function). Let BBj be the extension type erasure of
/// Bj, for j in 1 .. s. It is a compile-time error if
/// X1 extends BB1, .. Xs extends BBs has any compile-time errors.
///
/// @description Check that the erasure of an extension type `V` is obtained by
/// recursively replacing every subterm of `V` which is an extension type by the
/// corresponding representation type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

class Check {
  const Check(Object? v, {required Object? eq})
      : assert(v == eq, "Not equal ${(v, eq: eq)}");
}

extension type const Ext1(Object? value) {}
extension type const Ext2(Object value) implements Object {}

void main() {
  const Check([Ext1(1)], eq: <Object?>[1,]);
  const Check([Ext2(1)], eq: <Object>[1,]);
  const Check({Ext1(1)}, eq: <Object?>{1,});
  const Check({Ext2(1)}, eq: <Object>{1,});
  const Check({Ext1(1): Ext1(2)}, eq: <Object?, Object?>{1: 2});
  const Check({Ext2(1): Ext1(2)}, eq: <Object, Object?>{1: 2});
  const Check({Ext1(1): Ext2(2)}, eq: <Object?, Object>{1: 2});
  const Check({Ext2(1): Ext2(2)}, eq: <Object, Object>{1: 2});
  const Check((1,), eq: (1,));
  const Check((Ext1(1),), eq: (Ext1(1),));
  const Check((Ext1(1),), eq: (Ext2(1),));
  const Check((Ext2(1),), eq: (Ext1(1),));
  const Check((Ext2(1),), eq: (Ext2(1),));
  const Check((Ext1(1),), eq: (1,));
  const Check((Ext2(1),), eq: (1,));
  const Check(((1 as Ext1),), eq: (1,));
  const Check(((1 as Ext2),), eq: (1,));
  const Check((Ext1(1) as int,), eq: (1,));
  const Check((Ext2(1) as int,), eq: (1,));
  const Check(Ext1((1,)), eq: (1,));
  const Check(Ext2((1,)), eq: (1,));
  const Check(Ext1((Ext1(1),)), eq: (1,));
  const Check(Ext1((Ext2(1),)), eq: (1,));
  const Check(Ext2((Ext1(1),)), eq: (1,));
  const Check(Ext2((Ext2(1),)), eq: (1,));
}
