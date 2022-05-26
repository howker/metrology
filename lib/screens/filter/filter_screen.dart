import 'package:flutter/material.dart';
import 'package:infopoverka/providers/visibility_provider.dart';
import 'package:infopoverka/screens/filter/actual_data_switcher.dart';
import 'package:infopoverka/screens/filter/clear_all_filters_elevated_button.dart';
import 'package:infopoverka/screens/filter/invalid_data_switcher.dart';
import 'package:infopoverka/screens/filter/mit_notation_form_field.dart';
import 'package:infopoverka/screens/filter/mit_title_form_field.dart';
import 'package:infopoverka/screens/filter/org_title_form_field.dart';
import 'package:infopoverka/screens/filter/show_floating_button.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: false,
        floatingActionButton: const ShowFloatingButton(),
        appBar: context.watch<VisibilityProvider>().showFilterAppBar
            ? AppBar()
            : null,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: ClearAllFiltersTextButton(),
              ),
              const MitTitleFormField(),
              const SizedBox(height: 6),
              const MitNotationFormField(),
              const SizedBox(height: 6),
              const OrgTitleFormField(),
              const Spacer(),
              const ActualDataSwitcher(),
              Text(
                'с актуальной поверкой',
                style: Theme.of(context).textTheme.headline2,
              ),
              const Divider(thickness: 1),
              const InvalidDataSwitcher(),
              Text(
                'с просроченной поверкой',
                style: Theme.of(context).textTheme.headline2,
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
