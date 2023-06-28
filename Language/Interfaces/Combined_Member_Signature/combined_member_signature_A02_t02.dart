// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Now we define combined member signatures. Let id be an
/// identifier, L a id, L, Ij , k library, I1, . . . , Ik a list of interfaces,
/// and M0 the set of all member signatures M0 from I1, . . . , Ik named id and
/// accessible to L. The combined member signature named id from I1, . . . , Ik
/// with respect to L is the member signature which is obtained as follows:
/// ...
/// M0 contains more than one member signature m1, . . . , mq.
/// ...
/// Case ⟨Getters⟩. Determine whether there exists a non-empty set N ⊆ 1..q such
/// that for each i ∈ N, the return type of mi is a subtype of the return type
/// of mj for each j ∈ 1..q. If no such set exists, the computation of the
/// combined member signature failed.
///
/// Otherwise, when a set N as specified above exists, let Nall be the greatest
/// set satisfying the requirement on N, and let Mall = {mi | i ∈ Nall}.
///
/// Let m_all be the result of applying NNBD_TOP_MERGE to the elements in Mall,
/// ordered according to the interface I1 .. Ik that each signature came from.
///
/// The combined member signature is then m_all
///
/// @description Checks that for the getters the combined member signature is
/// the result of applying `NNBD_TOP_MERGE` to the elements in Mall
/// @author sgrekhov22@gmail.com

import "../../../Utils/static_type_helper.dart";

class I1 {
  Object? get m1 => 1;
  dynamic get m2 => 1;
  num get m3 => 1;
  Object? get m4 => 1;
  Object get m5 => 1;
}

class I2 {
  void get m1 => 2;
  void get m2 => 2;
  int get m3 => 2;
  Object get m4 => 1;
  String get m5 => "1";
}

abstract class C implements I1, I2 {}

mixin M implements I1, I2 {}

void test(C c, M m) {
  c.m1.expectStaticType<Exactly<Object?>>();
  c.m2.expectStaticType<Exactly<Object?>>();
  c.m3.expectStaticType<Exactly<int>>();
  c.m4.expectStaticType<Exactly<Object>>();
  c.m5.expectStaticType<Exactly<String>>();

  m.m1.expectStaticType<Exactly<Object?>>();
  m.m2.expectStaticType<Exactly<Object?>>();
  m.m3.expectStaticType<Exactly<int>>();
  m.m4.expectStaticType<Exactly<Object>>();
  m.m5.expectStaticType<Exactly<String>>();
}

main() {
  print(C);
  print(M);
  print(test);
}
