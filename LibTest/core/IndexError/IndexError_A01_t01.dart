/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IndexError(int invalidValue,  indexable,
 *                                    [String name, String message, int length])
 * Creates a new IndexError stating that invalidValue is not a valid index into
 * indexable.
 * The length is the length of indexable at the time of the error. If length is
 * omitted, it defaults to indexable.length.
 * The message is used as part of the string representation of the error.
 * @description Checks that this constructor can be called without any issues
 * with invalidValue and indexable arguments
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var indexable = "indexable";
  IndexError e = new IndexError(12, indexable);
  Expect.equals(indexable, e.indexable);
  Expect.equals(12, e.invalidValue);
}
