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
/// and `id` are bound to the value of `v`. Check the default constructor
/// introduced by representation declaration
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

extension type V1(int id) {}

extension type V2<T>(T id) {}

main() {
  int i = 42;
  var v1 = V1(i);
  Expect.identical(i, v1);

  String s = "The String";
  var v2 = V2<String>(s);
  Expect.identical(s, v2);
}
