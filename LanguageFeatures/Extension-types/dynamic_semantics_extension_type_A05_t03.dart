// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an extension type declaration DV named Name with
/// representation name id and representation type R. Invocation of a
/// non-redirecting generative extension type constructor proceeds as follows:
/// A fresh, non-late, final variable v is created. An initializing formal
/// this.id has the side-effect that it initializes v to the actual argument
/// passed to this formal. An initializer list element of the form id = e or
/// this.id = e is evaluated by evaluating e to an object o and binding v to o.
/// During the execution of the constructor body, this and id are bound to the
/// value of v. The value of the instance creation expression that gave rise to
/// this constructor execution is the value of this.
///
/// @description Check that during the execution of the constructor body, `this`
/// and `id` are bound to the value of `v`. Check constant constructors
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

extension type const V1(int id) {
  const V1.c1(this.id);
  const V1.c2() : id = 0;
  const V1.c3() : this.c1(0);
}

extension type const V2<T>(T id) {
  const V2.c1(this.id);
  const V2.c2(T t) : id = t;
  const V2.c3(T t) : this.c1(t);
}

main() {
  const c0 = 0;
  const v1_0 = V1(c0);
  Expect.identical(c0, v1_0);
  const c1 = 1;
  const v1_1 = V1.c1(c1);
  Expect.identical(c1, v1_1);
  const v1_2 = V1.c2();
  Expect.identical(0, v1_2);
  const v1_3 = V1.c3();
  Expect.identical(0, v1_3);

  const s0 = "0";
  var v2_0 = V2<String>(s0);
  Expect.identical(s0, v2_0);
  const s1 = "1";
  var v2_1 = V2<String>.c1(s1);
  Expect.identical(s1, v2_1);
  const s2 = "2";
  var v2_2 = V2<String>.c2(s2);
  Expect.identical(s2, v2_2);
  const s3 = "3";
  var v2_3 = V2<String>.c3(s3);
  Expect.identical(s3, v2_3);
}
