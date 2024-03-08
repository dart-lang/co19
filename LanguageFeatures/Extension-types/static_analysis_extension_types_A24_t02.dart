// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance creation expression of the form Name<T1, .. Ts>(...)
/// or Name<T1, .. Ts>.name(...) is used to invoke these constructors, and the
/// type of such an expression is Name<T1, .. Ts>.
///
/// @description Checks static types of constructors declared by extension type
/// @author sgrekhov22@gmail.com

import "../../Utils/static_type_helper.dart";

extension type ET1(int id) {
  ET1.c1() : this(0);
  ET1.c2(this.id);
  ET1.c3(int a, int b) : id = a + b;
  ET1.c4(int a, [int b = 1]) : id = a + b;
  ET1.c5(int a, {int b = 2}) : id = a + b;
  ET1.c6(int a, {required int b}) : id = a + b;
  factory ET1.f1() = ET1.c1;
  factory ET1.f2(int v) => ET1.c2(v);
}

extension type const ET2<T>(int id) {
  const ET2.c1() : this(0);
  const ET2.c2(this.id);
  const ET2.c3(int a, int b) : id = a + b;
  const ET2.c4(int a, [int b = 1]) : id = a + b;
  const ET2.c5(int a, {int b = 2}) : id = a + b;
  const ET2.c6(int a, {required int b}) : id = a + b;
  factory ET2.f1() = ET2.c1;
  factory ET2.f2(int v) => ET2.c2(v);
}

extension type const ET3<T extends num>(int id) {
  const ET3.c1() : this(0);
  const ET3.c2(this.id);
  const ET3.c3(int a, int b) : id = a + b;
  const ET3.c4(int a, [int b = 1]) : id = a + b;
  const ET3.c5(int a, {int b = 2}) : id = a + b;
  const ET3.c6(int a, {required int b}) : id = a + b;
  factory ET3.f1() = ET3.c1;
  factory ET3.f2(int v) => ET3.c2(v);
}

main() {
  ET1.c1.expectStaticType<Exactly<ET1 Function()>>();
  ET1.c2.expectStaticType<Exactly<ET1 Function(int)>>();
  ET1.c3.expectStaticType<Exactly<ET1 Function(int, int)>>();
  ET1.c4.expectStaticType<Exactly<ET1 Function(int, [int])>>();
  ET1.c5.expectStaticType<Exactly<ET1 Function(int, {int b})>>();
  ET1.c6.expectStaticType<Exactly<ET1 Function(int, {required int b})>>();
  ET1.f1.expectStaticType<Exactly<ET1 Function()>>();
  ET1.f2.expectStaticType<Exactly<ET1 Function(int)>>();

  ET2<String>.c1.expectStaticType<Exactly<ET2<String> Function()>>();
  ET2<String>.c2.expectStaticType<Exactly<ET2<String> Function(int)>>();
  ET2<String>.c3.expectStaticType<Exactly<ET2<String> Function(int, int)>>();
  ET2<String>.c4.expectStaticType<Exactly<ET2<String> Function(int, [int])>>();
  ET2<String>.c5.expectStaticType<Exactly<ET2<String> Function(int,
      {int b})>>();
  ET2<String>.c6.expectStaticType<Exactly<ET2<String> Function(int,
      {required int b})>>();
  ET2<String>.f1.expectStaticType<Exactly<ET2<String> Function()>>();
  ET2<String>.f2.expectStaticType<Exactly<ET2<String> Function(int)>>();

  ET2.c1.expectStaticType<Exactly<ET2<T> Function<T>()>>();
  ET2.c2.expectStaticType<Exactly<ET2<T> Function<T>(int)>>();
  ET2.c3.expectStaticType<Exactly<ET2<T> Function<T>(int, int)>>();
  ET2.c4.expectStaticType<Exactly<ET2<T> Function<T>(int, [int])>>();
  ET2.c5.expectStaticType<Exactly<ET2<T> Function<T>(int, {int b})>>();
  ET2.c6.expectStaticType<Exactly<ET2<T> Function<T>(int,
      {required int b})>>();
  ET2.f1.expectStaticType<Exactly<ET2<T> Function<T>()>>();
  ET2.f2.expectStaticType<Exactly<ET2<T> Function<T>(int)>>();

  ET3.c1.expectStaticType<Exactly<ET3<T> Function<T extends num>()>>();
  ET3.c2.expectStaticType<Exactly<ET3<T> Function<T extends num>(int)>>();
  ET3.c3.expectStaticType<Exactly<ET3<T> Function<T extends num>(int, int)>>();
  ET3.c4.expectStaticType<Exactly<ET3<T> Function<T extends num>(int, [int])>>();
  ET3.c5.expectStaticType<Exactly<ET3<T> Function<T extends num>(int, {int b})>>();
  ET3.c6.expectStaticType<Exactly<ET3<T> Function<T extends num>(int, {required int b})>>();
  ET3.f1.expectStaticType<Exactly<ET3<T> Function<T extends num>()>>();
  ET3.f2.expectStaticType<Exactly<ET3<T> Function<T extends num>(int)>>();
}
