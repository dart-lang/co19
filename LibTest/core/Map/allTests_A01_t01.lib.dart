// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Map<K, V> abstract class 
/// @description Checks that all members of [Map] are implemented.
/// @author kaigorodov

import "compKeysTests.lib.dart" as compKeysTests;
import "compKeysWarnTests.lib.dart" as compKeysWarnTests;
import "nonCompKeysTests.lib.dart" as nonCompKeysTests;

test(Map create([Map? content])) {
  compKeysTests.test(create);
  compKeysWarnTests.test(create);
  nonCompKeysTests.test(create);  
}
