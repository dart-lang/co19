/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String fragment
 * Returns the fragment identifier component.
 * Returns the empty string if there is no fragment identifier component.
 * @description Checks expected fragment settings
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

main() {
  var x = new Uri(fragment: '-._~ frag');
  Expect.equals('-._~ frag', x.fragment);

  x = new Uri.http('host', 'path');
  Expect.equals('', x.fragment);
}

