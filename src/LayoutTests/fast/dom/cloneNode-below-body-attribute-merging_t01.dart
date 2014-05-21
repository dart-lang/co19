/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that cloning the body node in response to a
 * DOMSubtreeModified event doesn't crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.id = "some_random_id_so_body_creates_attribute_data";
  document.body.className = "another_random_attribute_to_increase_crash_surface_area";

  document.addEventListener("DOMSubtreeModified", (_) {
    if (document.body != null) {
      document.body.clone(false);
    }
  }, false);
}
