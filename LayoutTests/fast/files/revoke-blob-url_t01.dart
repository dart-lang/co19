/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  debug("Test calling revokeObjectUrl with no argument.");
  shouldThrow(() => (Url as dynamic).revokeObjectUrl());

  debug("Test calling revokeObjectUrl with empty Url.");
  Url.revokeObjectUrl("");

  debug("Test calling revokeObjectUrl with invalid Url.");
  Url.revokeObjectUrl("[foo bar]");

  debug("Test calling revokeObjectUrl with non-existent Url.");
  Url.revokeObjectUrl("blob:non-existent");
}
