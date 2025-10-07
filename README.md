# Flutter

## How to device priview 

### command in your flutter project
```bash
flutter pub add device_preview
```

### add syntax

```bash
import 'package:device_preview/device_preview.dart';
```

```bash
useInheritedMediaQuery: true,
builder: DevicePreview.appBuilder,
locale: DevicePreview.locale(context),
```
