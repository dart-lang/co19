// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Constructor tear-off of inline classes happens in the same way as
/// for regular classes
/// @note Inline classes specification doesn't contain this statement but
/// assumes it
///
/// @description Checks static type of an inline class constructor tear-off
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class IC1 {
  final int id;
  IC1(this.id);
  IC1.n1(this.id, [String s = ""]);
  IC1.n2(this.id, {String s = ""});
  IC1.n3(this.id, {required String s});
}

inline class IC2<T extends num> {
  final T id;
  IC2(this.id);
  IC2.n1(this.id, [String s = ""]);
  IC2.n2(this.id, {String s = ""});
  IC2.n3(this.id, {required String s});
}

main() {
  IC1.new.expectStaticType<Exactly<IC1 Function(int)>>();
  IC1.n1.expectStaticType<Exactly<IC1 Function(int, [String])>>();
  IC1.n2.expectStaticType<Exactly<IC1 Function(int, {String s})>>();
  IC1.n3.expectStaticType<Exactly<IC1 Function(int, {required String s})>>();

  IC2<num>.new.expectStaticType<Exactly<IC2 Function(num)>>();
  IC2<int>.n1.expectStaticType<Exactly<IC2<int> Function(int, [String])>>();
  IC2<int>.n2.expectStaticType<Exactly<IC2<int> Function(int, {String s})>>();
  IC2<int>
      .n3
      .expectStaticType<Exactly<IC2<int> Function(int, {required String s})>>();

  IC2.new.expectStaticType<Exactly<IC2<T> Function<T extends num>(T)>>();
  IC2.n1
      .expectStaticType<Exactly<IC2<T> Function<T extends num>(T, [String])>>();
  IC2.n2.expectStaticType<
      Exactly<IC2<T> Function<T extends num>(T, {String s})>>();
  IC2.n3.expectStaticType<
      Exactly<IC2<T> Function<T extends num>(T, {required String s})>>();
}
