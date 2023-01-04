// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'package:flutter/material.dart';

// class _TranslateScreenState extends State<TranslateScreen> {
//   /// text controller
//   final _txtWord = TextEditingController();

//   CompleteRes? _response;
//   StreamSubscription? subscription;

//   final api = ChatGPT.instance;

//   void _translateEngToThai() {
//     final request = CompleteReq(
//         prompt: translateEngToThai(word: _txtWord.text.toString()),
//         model: kTranslateModelV3,
//         max_tokens: 1000);
//     subscription = ChatGPT.instance
//         .builder("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")
//         .onCompleteStream(request: request)
//         .listen((res) {
//       setState(() {
//         _response = res;
//       });
//     });
//   }

//   void modelDataList() async{
//     final model = await ChatGPT.instance
//         .builder("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")
//         .listModel();

//   }

//   void engineList() async{
//     final engines = await ChatGPT.instance
//         .builder("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")
//         .listEngine();
//   }

//   @override
//   void dispose() {
//     subscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 /**
//                  * title translate
//                  */
//                 _titleCard(size),
//                 /**
//                  * input card
//                  * insert your text for translate to th.com
//                  */
//                 _inputCard(size),

//                 /**
//                  * card input translate
//                  */
//                 _resultCard(size),
//                 /**
//                  * button translate
//                  */
//                 _btnTranslate()
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: _navigation(size),
//     );
//   }
// }