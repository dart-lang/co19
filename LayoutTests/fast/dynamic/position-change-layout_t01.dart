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
  document.body.setInnerHtml('''
      <table border="1" id="table" style="position: absolute; top: 10"></table>
      ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    TableElement table = document.getElementById('table');
    table.offsetHeight; // Trigger layout.
    table.createCaption(); // Add a caption and mark the table as needing layout.
    table.style.cssText = ''; // Remove the absolute positioning.
    table.innerHtml = 'PASS: If there is no crash, the test passed.'; // Blow away the caption, knowing the housekeeping won't be done.
  }

  test();
}
