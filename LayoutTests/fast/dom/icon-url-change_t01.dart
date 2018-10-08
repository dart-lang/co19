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
  var index;

  setFavIcon(iconURL) {
    HeadElement docHead = document.getElementsByTagName("head")[0];
    //var links = docHead.getElementsByTagName("link"); // no such in dart
    List links = docHead.querySelectorAll("link");
    for (var i = index; i < links.length; ++i) {
      var link = links[i];
      if (link.type == "image/x-icon" && link.rel == "shortcut icon") {
        link.remove();
        break; // Assuming only one match at most.
      }
    }
    LinkElement link = document.createElement("link");
    link.type = "image/x-icon";
    link.rel = "shortcut icon";
    link.href = iconURL;
    docHead.append(link);
  }

  // test framefork may have some links
  index = (document.getElementsByTagName("head")[0] as HeadElement).
      querySelectorAll("link").length;

  document.head.append(new Element.html('''
        <link rel="shortcut icon" type="image/x-icon" href="http://test.com/oldfavicon.ico"/>,
    ''', treeSanitizer: new NullTreeSanitizer()));

  asyncStart();
  window.onLoad.first.then((_) {
    HeadElement aHead = document.getElementsByTagName("head")[0];
    var iconURL = (aHead.querySelectorAll("link")[index] as LinkElement).href;
    debug('Original iconURL is: ' + iconURL);
    shouldBe(iconURL, 'http://test.com/oldfavicon.ico');

    // change icon to new icon
    var newURL = 'http://test.com/newfavicon.ico';
    debug('Setting new icon URL to: ' + newURL);
    setFavIcon(newURL);
    iconURL =(document.getElementsByTagName("link")[index] as LinkElement).href;
    debug('New iconURL is: ' + iconURL);
    shouldBe(iconURL, 'http://test.com/newfavicon.ico');

    // change icon back to old icon and ensure it changes properly
    var oldURL = 'http://test.com/oldfavicon.ico';
    debug('Setting icon URL back to: ' + oldURL);
    setFavIcon(oldURL);
    iconURL = (document.getElementsByTagName("link")[index] as LinkElement).href;
    debug('Original iconURL is still: ' + iconURL);
    shouldBe(iconURL, 'http://test.com/oldfavicon.ico');

    asyncEnd();
  });
}
