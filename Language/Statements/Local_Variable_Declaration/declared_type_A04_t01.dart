// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declared type of a local variable with a declaration of one
/// of the forms late? var v = e; late? final v = e; const v = e; is determined
/// as follows:
/// ...
/// • Otherwise, the declared type of v is the static type of e.
///
/// @description Checks that static type of a variable declared by the
/// statements `late? var v = e; late? final v = e; const v = e;` is the static
/// type of `e`
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

test4<T>(T t) {
  if (t is int) {
    late final v = t;
    v.isEven;
    v.expectStaticType<Exactly<T>>();
  }
  late final v = t;
  v.expectStaticType<Exactly<T>>();
}

main() {
  late var v1 = "1";
  v1.expectStaticType<Exactly<String>>();

  var v2 = 2;
  v2.expectStaticType<Exactly<int>>();

  late final v3 = 3 as num;
  v3.expectStaticType<Exactly<num>>();

  final v4 = 4 as int?;
  v4.expectStaticType<Exactly<int?>>();

  const v5 = 5 as num?;
  v5.expectStaticType<Exactly<num?>>();
}
