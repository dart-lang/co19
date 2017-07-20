/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests the a few differences between WebGL and GLES2
 * @compile-error
 */
import "dart:web_gl" as wgl;
import "../../../testcommon.dart";

main() {
  debug("Verify that *LENGTH are undefined");
  shouldThrow(() => wgl.INFO_LOG_LENGTH);
  shouldThrow(() => wgl.SHADER_SOURCE_LENGTH);
  shouldThrow(() => wgl.ACTIVE_UNIFORM_MAX_LENGTH);
  shouldThrow(() => wgl.ACTIVE_ATTRIB_MAX_LENGTH);
}
