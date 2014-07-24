/**
 * after web-platform-tests/html-imports/link-import.html
 * @assertion
 * @description  
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

const String resources = '${testSuiteRoot}/html-imports/resources';
const String htmlEL = '''
<link id="linkImport" rel="import" href="$resources/hello.html">
<link id="linkImportBlockingParent" rel="import" href="$resources/another.html" />
''';

void main() {
    document.body.appendHtml(htmlEL);
    
    test(() {
      var import = document.getElementById("linkImport").import;
      assert_true(import is DocumentFragment, "import is ${import.runtimeType}");
      var target=import.querySelector("#target");
      assert_true(target is DocumentFragment, "target is ${target.runtimeType}");
    }, 
    "Check on loaded import. It must return the imported fragment for the import, represented by the link element."
    );
    
    test(() {
      var linkImport = document.getElementById("linkImport");
      assert_equals(linkImport.import, linkImport.import);
    }, 
    "Check on object identity. The same object must be returned each time."
    );
       
    checkTestFailures();
}
