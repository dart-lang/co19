/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> parameters
 * A map representing the parameters of the media type.
 *
 * A data URI may contain parameters between the MIME type and the data. This
 * converts these parameters to a map from parameter name to parameter value.
 * The map only contains parameters that actually occur in the URI. The charset
 * parameter has a default value even if it doesn't occur in the URI, which is
 * reflected by the charset getter. This means that charset may return a value
 * even if parameters["charset"] is null.
 *
 * If the values contain non-ASCII values or percent escapes, they default to
 * being decoded as UTF-8.
 * @description Checks that this property returns decoded parameters map
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.mapEquals({"a": "b", "c": "d"},
      UriData.parse("data:text/plain;a=b;c=d,some data").parameters);
  Expect.mapEquals({" a ": " b "},
      UriData.parse("data:image/gif; a = b ,some data").parameters);
  Expect.mapEquals({}, UriData.parse("data:a/b,some data").parameters);
  Expect.mapEquals({" й ": " ф "},
      UriData.parse("data:;%20%D0%B9%20=%20%D1%84%20,some data").parameters);

  Expect.mapEquals({}, new UriData.fromString("some data").parameters);
  Expect.mapEquals({"a": "b"}, new UriData.fromString("some data",
      parameters: {"a": "b"}).parameters);
  Expect.mapEquals({" A ": " B "}, new UriData.fromString("some data",
      parameters: {" A ": " B "}).parameters);
  Expect.mapEquals({" Й ": " Ф "}, new UriData.fromString("some data",
      parameters: {" Й ": " Ф "}).parameters);
}
