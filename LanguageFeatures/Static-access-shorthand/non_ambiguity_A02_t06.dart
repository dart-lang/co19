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
/// @description Checks that spread collections  `...?.id` is treated as
/// `...? Iterable.id`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

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
    ...?.one, // `...` has type `Iterable<C>` but it has no static member `one`
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ...?.two,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ...?.three()
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  ];

  var s = <M>{
    ...?.one,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ...?.two,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ...?.three()
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var m = <String, E?>{
    ...?.one,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ...?.two,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ...?.three()
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  };

  var l2 = <ET> [
    ...?.one,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ...?.two,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ...?.three()
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  ];
}
