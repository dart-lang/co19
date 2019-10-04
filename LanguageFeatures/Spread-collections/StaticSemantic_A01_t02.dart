/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Since the spread is unpacked and its individual elements added to
 * the containing collection, we don't require the spread expression itself to
 * be assignable to the collection's type. For example, this is allowed:
 *
 *    var numbers = <num>[1, 2, 3];
 *    var ints = <int>[...numbers];
 *
 * This works because the individual elements in numbers do happen to have the
 * right type even though the list that contains them does not. As long as the
 * spread object is "spreadable" — it implements [Iterable] — there is no
 * static error.
 * @description Checks that static error is thrown if spread element and
 * list type arguments are incompatible.
 * @compile-error
 * @author iarkh@unipro.ru
 */

main() {
  List<num> numbers = <num>[1, 2, 3];
  List<String> list = <String>[...numbers];
 }
