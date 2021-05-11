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
/// @note That's an error with null-safety to assign Set<num> to Set<int>, see
/// https://github.com/dart-lang/language/blob/471a98ca0dd5b02d194ffad0dc128065771253a0/specification/dartLangSpec.tex#L8245,
/// because `num` isn't assignable to `int`.
///
/// @description Checks that for sets it's possible to have the spread
/// expression which is not assignable to the result collection type, no static
/// error in this case.
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

main() {
  var numbers = <dynamic>[1, 2, 3];
  Expect.setEquals(<int>{1, 2, 3}, <int>{...numbers});

  var a;
  Expect.throws(() => a = <String>{...numbers});

  var numbers1 = <dynamic>[1.1, 2, 3];
  Expect.throws(() => a = <int>{...numbers1});

  var numbers2 = <dynamic>[1, 2, 3] as List<dynamic>?;
  Expect.setEquals(<int>{1, 2, 3}, <int>{...?numbers2});

  Expect.throws(() => a = <String>{...?numbers2});

  var numbers3 = [1.1, 2, 3] as List<dynamic>?;
  Expect.throws(() => a = <int>{...?numbers3});
}
