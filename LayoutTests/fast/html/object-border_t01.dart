/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for border attribute with Object tag
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var body = document.body;

  var path1 = '$root/resources/images/blue.png';
  var path2 = '$root/resources/images/blue-border.png';

  body.setInnerHtml('''
    <table border="">
    <thead>
    <tr>
    <th> Title </th>
    <th> Actual Image </th>
    <th> Expected Image </th>
    </tr>
    </thead>
    <tr><td><div  valing="center"> Object Tag with border="50" px </div></td>
        <td><object id="objID" data="$path1" type="image/png" border="50"></object></td>
        <td><img src="$path2" /></td>
    </tr>
    </table>
    ''', treeSanitizer: new NullTreeSanitizer());

  getStyle(el,styleProp)
  {
    var x = document.getElementById(el);
    /*
    if (x.currentStyle)
      var y = x.currentStyle[styleProp];
    else if (window.getComputedStyle)
      var y = document.defaultView.getComputedStyle(x,null).getPropertyValue(styleProp);
    */  
    var y = x.getComputedStyle().getPropertyValue(styleProp);
    return y;
  }

  startTests(prop)
  {
    var value = getStyle('objID', prop);

    Expect.equals("50px", value);
  }

  startTests("border-top-width");
  startTests("border-left-width");
  startTests("border-bottom-width");
  startTests("border-right-width");
}
