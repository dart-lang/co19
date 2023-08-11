// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an extension type declaration named Name, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
///
/// A compile-time error occurs if V1 is a type name or a parameterized type
/// which occurs as a superinterface in an extension type declaration DV, but V1
/// does not denote an extension type, and V1 does not denote a supertype of the
/// extension type erasure of the representation type of DV.
///
/// @description Checks that it is no error if a superinterface of an extension
/// type `DV` is a supertype of the erasure of the representation type of `DV`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/expect.dart';

mixin class V1 {
  int x = 1;
}
class V2 extends V1 {}
class V3<T1, T2 extends num?> implements V1 {
  int x = 3;
}
class V4 = Object with V1;

extension type ET_V2(V2 id) {}
extension type ET_V3<T1, T2 extends num?>(V3<T1, T2> id) {}
extension type ET_V4(V4 id) {}

extension type ET1(V2 id) implements V1 {}

extension type ET2(ET_V2 id) implements V1 {}

extension type ET3<T1, T2 extends num?>(V3<T1, T2> id) implements V1 {}

extension type ET4<T1, T2 extends num?>(ET_V3<T1, T2> id) implements V1 {}

extension type ET5(V4 id) implements V1 {}

extension type ET6(ET_V4 id) implements V1 {}

main() {
  Expect.equals(1, ET1(V2()).id.x);
  Expect.equals(1, ET2(ET_V2(V2())).id.id.x);
  Expect.equals(3, ET3<String, int>(V3<String, int>()).id.x);
  Expect.equals(3, ET4<String, int>(ET_V3<String, int>(V3<String, int>())).id.id.x);
  Expect.equals(1, ET5(V4()).id.x);
  Expect.equals(1, ET6(ET_V4(V4())).id.id.x);
}
