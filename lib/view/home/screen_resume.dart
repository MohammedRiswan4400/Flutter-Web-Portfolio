// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class ScreenResume extends StatelessWidget {
//   ScreenResume({super.key});
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     log('message');
//     return Scaffold(body: LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth > 715) {
//           return desktopView(context);
//         } else {
//           return mobilePhoneView(context);
//           // MobilePhoneView(
//           //   screenWidth: kWidth,
//           //   childrenTabs: contentview.map((e) => e.tab).toList(),
//           // );
//         }
//       },
//     ));
//   }

//   Widget desktopView(BuildContext context) {
//     return SfPdfViewer.asset(
//       // 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
//       'assets/Mohammed Riswan.pdf',
//       // key: _pdfViewerKey,
//     );
//   }

//   Widget mobilePhoneView(BuildContext context) {
//     return SfPdfViewer.network(
//       'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
//       key: _pdfViewerKey,
//     );
//   }
// }
