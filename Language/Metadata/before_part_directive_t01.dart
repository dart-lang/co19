/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Metadata can appear before  ...   part directive ...
 * @description Check that metadata is allowed before part directive
 * @author a.semenov@unipro.ru
 */
import 'before_part_directive_lib1.dart';

main() {
  // Unfortunately, there is no way to obtain part directive metadata.
  // Just make sure the syntax parser allows metadata before part directive
}
