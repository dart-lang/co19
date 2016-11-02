/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTML5 Input Types for Text Controls
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  document.head.append(new Element.html('''
    <style>
        body {font-size: 60%;}
    </style>
    ''', treeSanitizer: new NullTreeSanitizer()));

  document.body.setInnerHtml('''
    A<input type="email" id="email">
    B<input type="number" id="number">
    C<input type="password" id="password">
    D<input type="tel" id="tel">
    E<input type="text" id="text">
    F<input type="url" id="url">
    <div id="result"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    List<String> items = [ "email", "password", "tel", "text" , "url" ];

    String result = "";
    bool success = true;
    for (int i = 0; i < items.length; ++i)
    {
      String expectedTypeName = items[i];
      String actualTypeName = (document.getElementById(expectedTypeName) as InputElement).type;
      success = (actualTypeName == expectedTypeName);
      if (!success)
        result += "Expected: \"" + expectedTypeName + "\" for \"" + actualTypeName + "\"<br>";
    }
    if (success)
      result = "Success.";

    document.getElementById('result').innerHtml = result;
  }

  test();

  Expect.equals('Success.', document.getElementById('result').innerHtml);
}
