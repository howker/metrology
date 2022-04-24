/*  Фильтры:
Только с актуальной поверкой
Только с просроченной поверкой
По типу СИ mit_title
По модификации СИ mit_notation
По поверителю org_title
 */

import 'package:flutter/material.dart';
import 'package:infopoverka/screens/filter/actual_data_switcher.dart';
import 'package:infopoverka/screens/filter/clear_all_filters_elevated_button.dart';
import 'package:infopoverka/screens/filter/invalid_data_switcher.dart';
import 'package:infopoverka/screens/filter/mit_title_form_field.dart';
import 'package:infopoverka/screens/filter/show_floating_button.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: false,
        floatingActionButton: const ShowFloatingButton(),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              Align(
                alignment: Alignment.centerRight,
                child: ClearAllFiltersTextButton(),
              ),
              ActualDataSwitcher(),
              Text('с актуальной поверкой'),
              Divider(thickness: 3),
              InvalidDataSwitcher(),
              Text('с просроченной поверкой'),
              MitTitleFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
