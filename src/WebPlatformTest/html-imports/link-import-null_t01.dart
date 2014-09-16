/**
 * after web-platform-tests/html-imports/link-import-null.html
 * @assertion https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/imports/index.html#loading-imports
 * @description  
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

const String resources = '${testSuiteRoot}/html-imports/resources';

const String htmlEL = '''
<link id="linkNotImport" rel="style" href="$resources/fake.css">
<link id="linkNotFound" rel="import" href="$resources/IntentionallyMissingFile.html">
<link id="linkToBeRemoved" rel="import" href="$resources/hello.html">
''';

void main() {
    document.body.appendHtml(htmlEL);
    test(() {
      var linkNotImport = document.getElementById("linkNotImport");
      assert_equals(linkNotImport.import, null);
    }, 
    "Check on style link. It should be null if the resource refers style thus doesn't represent any import."
    );
    
    test(() {
      var linkNotFound = document.getElementById("linkNotFound");
      assert_equals(linkNotFound.import, null);
    }, 
    "Check on non existing resource. It should be null if the resource isn't found thus doesn't represent any import."
    );
    
    // FIXME: should have "the resource is CORS-cross-origin" case.
    
    test(() {
      var linkOutOfTree = document.createElement("link");
      linkOutOfTree.setAttribute("rel", "import");
      linkOutOfTree.setAttribute("href", "$resources/hello.html");
      assert_equals(linkOutOfTree.import, null);
      // FIXME: test if the import is available after tree insertion.
    }, 
    "Check on out of document element. It should be null when the element is out of document"
    );
    
    test(() {
      var linkToBeRemoved = document.getElementById("linkToBeRemoved");
      // FIXME: test if the import is available before removal.
      linkToBeRemoved.remove();
      assert_equals(linkToBeRemoved.import, null);
    }, 
    "Check on  removed element. It should be null when it is removed from the document and becomes out of document."
    );
    
    checkTestFailures();
}
