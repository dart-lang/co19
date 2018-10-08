/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test case for HTMLButtonElement.click()
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <h3>Test case for HTMLButtonElement.click()</h3>
      Successful if it reads "test passed" below <span style="color: red">upon loading the page</span> <br>
      <BUTTON id=thebutton>No need to click me. In fact, don't.</BUTTON>
      ''', treeSanitizer: new NullTreeSanitizer());

  var button = document.getElementById("thebutton");
  button.onClick.listen((_) => asyncEnd());
  asyncStart();
  button.click();
}
