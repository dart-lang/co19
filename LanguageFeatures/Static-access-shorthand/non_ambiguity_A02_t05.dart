// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A postfix expression expression can follow a `?` in a conditional
/// expression, as in `{e1 ? . id : e2}`. This is not ambiguous with `e1?.id`
/// since we parse `?.` as a single token, and will keep doing so. It does mean
/// that `{e1?.id:e2}` and `{e1? .id:e2}` will now both be valid and have
/// different meanings, where the existing grammar didn’t allow the `?` token to
/// be followed by `.` anywhere.
///
/// @description Checks that spread collections  `...? .id` is parsed as
/// `...? C.id`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  int value;
  C(this.value);
  static List<C>? one = [C(1)];
  static List<C>? get two => [C(2)];
  static List<C>? three() => null;

  @override
  bool operator ==(Object other) {
    if (other is C) {
      return value == other.value;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode;
}

mixin M on C {
  static Set<MC>? one = {MC(1)};
  static Set<MC>? get two => null;
  static Set<MC>? three() => {MC(3)};
}

class MC = C with M;

enum E {
  e1, e2, e3;
  static Map<String, E>? one = null;
  static Map<String, E>? get two => {"key2": E.e2};
  static Map<String, E>? three() => {"key3": E.e3};
}

extension type ET(int value) {
  static List<ET>? one = [ET(1)];
  static List<ET>? get two => [ET(2)];
  static List<ET>? three() => null;
}

main() {
  var l1 = <C>[
      ...? .one,
      ...? .two,
      ...? .three()
  ];
  Expect.listEquals([C(1), C(2)] ,l1);

  var s = <M>{
      ...? .one,
      ...? .two,
      ...? .three()
  };
  Expect.setEquals({MC(1), MC(3)} ,s);

  var m = <String, E?>{
      ...? .one,
      ...? .two,
      ...? .three()
  };
  Expect.mapEquals({"key2": E.e2, "key3":E.e3} ,m);

  var l2 = <ET> [
      ...? .one,
      ...? .two,
      ...? .three()
  ];
  Expect.listEquals([ET(1), ET(2)] ,l2);
}
