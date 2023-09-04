// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declared type of a local variable with a declaration of one
/// of the forms late? var v = e; late? final v = e; const v = e; is determined
/// as follows:
/// ...
/// • If the static type of e is of the form X & T where X is a type variable,
/// the declared type of v is X. In this case v is immediately promoted to X & T
///
/// @description Checks that the static type of a variable declared by the
/// statements `late? var v = e; late? final v = e;` is `X` if the static type
/// of `e` is `X & T` where `X` is a type variable. Also test that `v` is
/// promoted to `X & T`
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

test1<T>(T t) {
  if (t is int) {
    var v = t;
    v.isEven;
    T x = v;
    v = x;
  }
}

test2<T>(T t) {
  if (t is int) {
    late var v = t;
    v.isEven;
    T x = v;
    v = x;
  }
}

test3<T>(T t) {
  if (t is int) {
    final v = t;
    v.isEven;
    T x = v;
  }
}

test4<T>(T t) {
  if (t is int) {
    late final v = t;
    v.isEven;
    T x = v;
  }
}

main() {
  test1<int>(1);
  test2<num>(2);
  test3<int>(3);
  test4<num>(4);
}
