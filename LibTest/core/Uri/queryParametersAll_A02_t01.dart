/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, List<String>> queryParametersAll
 * ...
 * If there is no query the empty map is returned.
 * @description Checks that if there is no query the empty map is returned.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.mapEquals({}, new Uri.http('host', 'path').queryParametersAll);
  Expect.mapEquals({}, new Uri(host: 'host').queryParametersAll);
  Expect.mapEquals({}, Uri.parse('http://host/path').queryParametersAll);
  Expect.mapEquals({}, Uri.parse('http://host/path?').queryParametersAll);
}
