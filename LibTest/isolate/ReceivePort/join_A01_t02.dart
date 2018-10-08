/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * Collects string of data events' string representations.
 * If separator is provided, it is inserted between any two elements.
 * @description Checks that it joins string representations correctly if
 * separator is provided.
 * @author ilya
 */

import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

main() {
  var iter = [1,null,false,true,'string',2.78];
  var separator='---qwe---';
  iter.add(iter); // add self reference
  var s = IsolateStream.fromIterable(iter);

  asyncStart();
  s.join(separator).then((x) {
    Expect.equals(iter.join(separator), x);
    asyncEnd();
  });
}

