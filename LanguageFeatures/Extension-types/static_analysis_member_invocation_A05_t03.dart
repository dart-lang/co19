// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Constructor tear-off of extension types happens in the same way
/// as for regular classes
/// @note Extension types specification doesn't contain this statement but
/// assumes it
///
/// @description Checks static type of an extension types constructor tear-off
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

extension type ET1(int id) {
  ET1.n1(this.id, [String s = ""]);
  ET1.n2(this.id, {String s = ""});
  ET1.n3(this.id, {required String s});
}

extension type ET2<T extends num>.n0(T id) {
  ET2.n1(this.id, [String s = ""]);
  ET2.n2(this.id, {String s = ""});
  ET2.n3(this.id, {required String s});
  ET2.new(T id, String s) : this.id = id {
    print(s);
  }
}

main() {
  ET1.new.expectStaticType<Exactly<ET1 Function(int)>>();
  ET1.n1.expectStaticType<Exactly<ET1 Function(int, [String])>>();
  ET1.n2.expectStaticType<Exactly<ET1 Function(int, {String s})>>();
  ET1.n3.expectStaticType<Exactly<ET1 Function(int, {required String s})>>();

  ET2<num>.n0.expectStaticType<Exactly<ET2 Function(num)>>();
  ET2<int>.n1.expectStaticType<Exactly<ET2<int> Function(int, [String])>>();
  ET2<int>.n2.expectStaticType<Exactly<ET2<int> Function(int, {String s})>>();
  ET2<int>
      .n3
      .expectStaticType<Exactly<ET2<int> Function(int, {required String s})>>();
  ET2<int>.new.expectStaticType<Exactly<ET2<int> Function(int, String s)>>();

  ET2.n0.expectStaticType<Exactly<ET2<T> Function<T extends num>(T)>>();
  ET2.n1
      .expectStaticType<Exactly<ET2<T> Function<T extends num>(T, [String])>>();
  ET2.n2.expectStaticType<
      Exactly<ET2<T> Function<T extends num>(T, {String s})>>();
  ET2.n3.expectStaticType<
      Exactly<ET2<T> Function<T extends num>(T, {required String s})>>();
  ET2.new
      .expectStaticType<Exactly<ET2<T> Function<T extends num>(T, String s)>>();
}
