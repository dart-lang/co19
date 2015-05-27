/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The test asserts that elements within template contents are 
 * "inert", e.g. script does not run.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <template>
      <script>
        document.body.appendChild(document.createElement('div'));
      </script>
    </template>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBeNull(document.body.querySelector('div'));

  var templateContent = document.querySelector('template').content;
  document.body.append(templateContent);

  shouldBeNonNull(document.body.querySelector('div'));
}
