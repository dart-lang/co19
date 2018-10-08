/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HeaderValue parse(
 *  String value, {
 *  String parameterSeparator: ";",
 *  String valueSeparator: null,
 *  bool preserveBackslash: false
 *  })
 * Creates a new header value object from parsing a header value string with
 * both value and optional parameters.
 * @description Checks that this method parses header value. Test
 * parameterSeparator value
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  String toParse = "value1, param1=val1, param2=val2";
  HeaderValue parsed = HeaderValue.parse(toParse, parameterSeparator: ",");
  Expect.equals("value1", parsed.value);
  Expect.mapEquals({"param1": "val1", "param2": "val2"}, parsed.parameters);

  toParse = "value1,param1=val1,param2=val2";
  parsed = HeaderValue.parse(toParse);
  Expect.equals("value1,param1=val1,param2=val2", parsed.value);
  Expect.mapEquals({}, parsed.parameters);
}
