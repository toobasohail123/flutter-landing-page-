import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
testWidgets('MindByte quiz app opens', (WidgetTester tester) async {
await tester.pumpWidget(const MindByteApp());

```
expect(find.text('MindByte'), findsWidgets);
```

});
}
