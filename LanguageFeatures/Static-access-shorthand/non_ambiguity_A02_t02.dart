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
/// @description Checks that `?.id` is parsed like `? .id`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  int value;
  C(this.value);
  C.id(this.value);
  static C? one = C(1);
  static C? get two => C(2);
  static C? three() => C(3);

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
  static M? one = MC(1);
  static M? get two => MC(2);
  static M? three() => MC(3);
}

class MC = C with M;

enum E {
  e1, e2, e3;
  static E? one = E.e1;
  static E? get two => E.e2;
  static E? three() => E.e3;
}

extension type ET(int value) {
  ET.id(this.value);
  static ET? one = ET(1);
  static ET? get two => ET(2);
  static ET? three() => ET(3);
}

main() {
  var l1 = <C>[
    ?.id(0),   // ignore: invalid_null_aware_operator
    ?.new(0),  // ignore: invalid_null_aware_operator
    ?.one,
    ?.two,
    ?.three()
  ];
  Expect.listEquals([C(0), C(0), C(1), C(2), C(3)], l1);

  var s = <M>{
    ?.one,
    ?.two,
    ?.three()
  };
  Expect.setEquals({MC(1), MC(2), MC(3)}, s);

  var m1 = <String, E>{
    "key0": ?.e1,  // ignore: invalid_null_aware_operator
    "key1": ?.one,
    "key2": ?.two,
    "key3": ?.three()
  };
  Expect.mapEquals({"key0": E.e1, "key1": E.e1, "key2": E.e2, "key3":E.e3}, m1);

  var m2 = <ET, String> {
    ?.id(-1): "value0",
    ?.new(0): "value1",
    ?.one: "value2",
    ?.two: "value3",
    ?.three(): "value4"
  };
  Expect.mapEquals({
    ET(-1): "value0",
    ET(0): "value1",
    ET(1): "value2",
    ET(2): "value3",
    ET(3): "value4"
  }, m2);
}
