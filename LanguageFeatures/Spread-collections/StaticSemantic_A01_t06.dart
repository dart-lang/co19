// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Since the spread is unpacked and its individual elements added to
/// the containing collection, we don't require the spread expression itself to
/// be assignable to the collection's type. For example, this is allowed:
///
///    var numbers = <num>[1, 2, 3];
///    var ints = <int>[...numbers];
///
/// This works because the individual elements in numbers do happen to have the
/// right type even though the list that contains them does not. As long as the
/// spread object is "spreadable" — it implements [Iterable] — there is no
/// static error.
/// @note That's an error with null-safety to assign Map<num, num> to
/// Map<int, int>, see
/// https://github.com/dart-lang/language/blob/471a98ca0dd5b02d194ffad0dc128065771253a0/specification/dartLangSpec.tex#L8245,
/// because `num` isn't assignable to `int`.
/// @description Checks that static error is thrown if spread element and
/// map type arguments are incompatible.
/// @author iarkh@unipro.ru


main() {
  Map<num, num> numbers = <num, num>{};
  <String, num>{...numbers};
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  var numbers1 = <num, num>{1: 1, 2: 2, 3: 3};
  <int, int>{...numbers};
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  var objects = <Object, Object>{2: 22, 7: 77, 9: 99};
  <int, int>{...objects};
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  <String, int>{...objects};
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  Map<num, num>? numbers2 = <num, num>{1: 1, 2: 2, 3: 3};
  <int, int>{...?numbers2};
//               ^
// [analyzer] unspecified
// [cfe] unspecified

  Map<Object?, Object?>? objects1 = <Object?, Object?>{2: 22, 7: 77, 9: 99};
  <int, int>{...?objects1};
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}
