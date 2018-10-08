/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for .valueAsDate with <input type=datetimelocal>.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;
  input.type = 'datetime-local';

  DateTime valueAsDateFor(String stringValue) {
    input.value = stringValue;
    return input.valueAsDate;
  }

  shouldBe(valueAsDateFor(""), null);
  shouldBe(valueAsDateFor("1969-12-31T12:34:56.789"), null);
  shouldBe(valueAsDateFor("1970-01-01T00:00:00.000"), null);
  shouldBe(valueAsDateFor("2009-12-22T11:32:11"), null);
}
