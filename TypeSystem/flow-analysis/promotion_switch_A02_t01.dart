// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For now (May, 2025) promotion in switch statement and
/// expressions are not specified yet.
/// TODO (sgrekhov): update when specified
///
/// @description Checks that pattern match in switch statement and expression
/// doesn't promotes the variable if it is captured in `when` part.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1(Object? x) {
  switch (x) {
    case int _
        when () {
          x = 42;
          return true;
        }(): // no promotion
      x.expectStaticType<Exactly<Object?>>();
    case null:
      x.expectStaticType<Exactly<Object?>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
}

test2(Object? x) {
  switch (x) {
    case int _:
      x.expectStaticType<Exactly<int>>();
    case null
        when () {
          x = 42;
          return true;
        }():
      x.expectStaticType<Exactly<Object?>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
}

test3(Object? x) {
  switch (x) {
    case int _:
      x.expectStaticType<Exactly<int>>();
    case null:
      x.expectStaticType<Exactly<Object?>>();
    case _
        when () {
          x = 42;
          return true;
        }(): // nothing changed
      x.expectStaticType<Exactly<Object?>>();
  }
}

test4(Object? x) {
  var v = switch (x) {
    int _
        when (() {
          x = 42;
          return true;
        }()) =>
      x.expectStaticType<Exactly<Object?>>(),
    null => x.expectStaticType<Exactly<Object?>>(),
    _ => x.expectStaticType<Exactly<Object?>>(),
  };
}

test5(Object? x) {
  var v = switch (x) {
    int _ => x.expectStaticType<Exactly<int>>(),
    null
        when (() {
          x = 42;
          return true;
        }()) =>
      x.expectStaticType<Exactly<Object?>>(),
    _ => x.expectStaticType<Exactly<Object?>>(),
  };
}

test6(Object? x) {
  var v = switch (x) {
    int _ => x.expectStaticType<Exactly<int>>(),
    null => x.expectStaticType<Exactly<Object?>>(),
    _
        when (() {
          x = 42;
          return true;
        }()) =>
      x.expectStaticType<Exactly<Object?>>(),
    _ => x.expectStaticType<Exactly<Object?>>(),
  };
}

main() {
  test1(1);
  test1("one");
  test1(null);
  test2(1);
  test2("one");
  test2(null);
  test3(1);
  test3("one");
  test3(null);
  test4(1);
  test4("one");
  test4(null);
  test5(1);
  test5("one");
  test5(null);
  test6(1);
  test6("one");
  test6(null);
}
