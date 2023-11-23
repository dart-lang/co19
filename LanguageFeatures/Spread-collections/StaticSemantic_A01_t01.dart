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
/// @note That's an error with null-safety to assign List<num> to List<int>, see
/// https://github.com/dart-lang/language/blob/471a98ca0dd5b02d194ffad0dc128065771253a0/specification/dartLangSpec.tex#L8245,
/// because `num` isn't assignable to `int`.
/// @description Checks that for lists it's possible to have the spread
/// expression which is not assignable to the result collection type, no static
/// error in this case.
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

List<dynamic> integers = <num>[1, 2, 3];
List<dynamic?> objects = <Object>[2, 7, 9];
List<dynamic> numbers1 = <num>[1.1, 2, 3];

List<dynamic>? nullableNums = <num>[1, 2, 3];
List<dynamic>? nullableObjects = <Object>[2, 7, 9];
List<dynamic>? nullableNums1 = <num>[1.1, 2, 3];

main() {
  Expect.listEquals([1, 2, 3], <int>[...integers]);
  Expect.listEquals([2, 7, 9], <int>[...objects]);
  var a;
  Expect.throws(() => a = <String>[...objects]);

  Expect.throws(() => a = <int>[...numbers1]);

  Expect.listEquals([1, 2, 3], <int>[...?nullableNums]);

  Expect.listEquals([2, 7, 9], <int>[...?nullableObjects]);

  Expect.throws(() => a = <String>[...?nullableObjects]);

  Expect.throws(() => a = <int>[...?nullableNums1]);

}
