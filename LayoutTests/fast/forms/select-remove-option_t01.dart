/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for HTMLSelectElement.remove() on an Options object
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <form>
      <select id="theSelect">
          <option value="ALL" selected >hello</option>
      </select>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  var zipselect = document.getElementById("theSelect");
  var before = zipselect.options.length;
  zipselect.options[0].remove();
  var after = zipselect.options.length;
  shouldBeTrue(before > after);
}
