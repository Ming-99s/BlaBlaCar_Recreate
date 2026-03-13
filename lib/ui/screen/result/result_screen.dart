import 'package:blablacarv2/ui/screen/result/widget/result_content.dart';
import 'package:blablacarv2/ui/viewmodel/result_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (create)=> ResultViewModel(),
      child: ResultContent());
  }
}
