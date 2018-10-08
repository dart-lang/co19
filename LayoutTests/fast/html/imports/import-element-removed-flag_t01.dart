/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests 'element removed flag' behavior defined in 
 * https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/imports/index.html#dfn-element-removed-flag.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.head.append(new Element.html('''
    <link id="staticImportLink" rel="import" href="$root/resources/hello.html">
    ''', treeSanitizer: new NullTreeSanitizer()));

  testStaticImport()
  {
    // element-removed flag is not set at start
    //staticImport = window.staticImportLink;
    LinkElement staticImport = document.getElementById('staticImportLink') as LinkElement;
    //Expect.isNotNull(staticImport.import);

    // element-removed flag is set when the element removed.
    staticImport.remove();
    Expect.isNull(staticImport.import);

    // And never comes back even after re-insertion.
    document.head.append(staticImport);
    Expect.isNull(staticImport.import);
  }

  LinkElement dynamicImport, dynamicImportEager;

  testDynamicImportRemovingEagerly()
  {
    var checkEvent = (Event event) => null;

    check()
    {
      checkEvent(null);
    }

    checkEvent = (Event event)
    {
      if (document.getElementById('greet') == null) {
        setTimeout(check, 0);
        return;
      }

      Expect.isNull(dynamicImportEager.import);
      document.head.append(dynamicImportEager);
      Expect.isNull(dynamicImportEager.import);
      asyncEnd();
    };

    dynamicImportEager = document.createElement("link");
    dynamicImportEager.setAttribute("rel", "import");
    dynamicImportEager.setAttribute("href", "$root/resources/setting-greet-var.html");
    dynamicImportEager.addEventListener("load", checkEvent);
    asyncStart();
    document.head.append(dynamicImportEager);

    // Removing <link> just after appending it.
    // This should start import loading, but shouldn't make .import visible.
    dynamicImportEager.remove();
  }

  testDynamicImport()
  {
    check(event)
    {
      Expect.isNotNull(dynamicImport.import);
      dynamicImport.remove();
      Expect.isNull(dynamicImport.import);
      document.head.append(dynamicImport);
      Expect.isNull(dynamicImport.import);

      testDynamicImportRemovingEagerly();
      asyncEnd();
    };

    dynamicImport = document.createElement("link") as LinkElement;
    dynamicImport.setAttribute("rel", "import");
    dynamicImport.setAttribute("href", "$root/resources/bye.html");
    dynamicImport.addEventListener("load", check);
    asyncStart();
    document.head.append(dynamicImport);
  }

  testStaticImport();
  testDynamicImport();
}
