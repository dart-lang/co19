// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If Dm is a method with function type F, and args exists, the
/// static analysis of the inline member invocation is the same as that of an
/// invocation with argument part args of a function with type [T1/X1 .. Ts/Xs]F
///
/// @description Checks static type of an inline class constructor tear-off
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class IC1 {
  final int id;
  IC1(this.id);
}

inline class IC2<T extends num> {
  final T id;
  IC2.x(this.id);
}

main() {
  IC1.new.expectStaticType<Exactly<IC1 Function(int)>>();
  IC2<num>.x.expectStaticType<Exactly<IC2 Function(num)>>();
  IC2.x.expectStaticType<Exactly<IC2<T> Function<T extends num>(T)>>();
}
