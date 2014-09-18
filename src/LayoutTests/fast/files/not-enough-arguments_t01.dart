/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test tries calling various FileAPI functions with too few
 * arguments.
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <input type="file">
      ''', treeSanitizer: new NullTreeSanitizer());

  var reader = new FileReader();

  shouldThrow(() => reader.readAsArrayBuffer());
  shouldThrow(() => reader.readAsText());
  shouldThrow(() => reader.readAsDataUrl());

  var fileInput = document.querySelector('input');
  shouldThrow(() => fileInput.files.item());
}
