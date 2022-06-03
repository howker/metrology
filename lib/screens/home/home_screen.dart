import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infopoverka/providers/connectivity_provider.dart';
import 'package:infopoverka/providers/data_range_provider.dart';
import 'package:infopoverka/providers/item_list_provider.dart';
import 'package:infopoverka/screens/home/accurate_on_off_switcher.dart';
import 'package:infopoverka/screens/home/animated_arrow.dart';
import 'package:infopoverka/screens/home/change_range_button.dart';
import 'package:infopoverka/screens/home/no_internet.dart';
import 'package:infopoverka/screens/home/qr_floating_button.dart';
import 'package:infopoverka/screens/home/search_elevated_button.dart';
import 'package:infopoverka/screens/settings/settings_screen.dart';
import 'package:infopoverka/utils/input_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeBackPressed = DateTime.now();
    final textEditingController = TextEditingController();
    var searchRequest = '';
    InputUtils.hideKeyboard();

    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= const Duration(seconds: 2);

        timeBackPressed = DateTime.now();

        if (isExitWarning) {
          const message = 'Для выхода нажмите назад ещё раз';
          await Fluttertoast.showToast(msg: message, fontSize: 14);
          return false;
        } else {
          await Fluttertoast.cancel();
          return true;
        }
      },
      child: context.watch<ConnectivityProvider>().isOnline
          ? Scaffold(
              drawer: const SizedBox(
                width: 200,
                child: Drawer(
                  child: SettingsScreen(),
                ),
              ),
              floatingActionButton: const QrFloatingButton(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'Поиск сведений о результатах\nповерки СИ',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 55,
                            width: double.infinity,
                            child: TextFormField(
                              style: Theme.of(context).textTheme.headline1,
                              decoration: InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                prefixIcon: const AnimatedArrow(),
                                label: Text(
                                  '     Введите номер СИ',
                                  style: Theme.of(context).textTheme.overline,
                                ),
                              ),
                              controller: textEditingController,
                              onFieldSubmitted: (text) {
                                InputUtils.hideKeyboard();
                                searchRequest = text;
                                context
                                    .read<ItemListProvider>()
                                    .setSearchRequest(searchRequest);
                              },
                              onEditingComplete: () {
                                InputUtils.hideKeyboard();
                                searchRequest = textEditingController.text;
                                context
                                    .read<ItemListProvider>()
                                    .setSearchRequest(searchRequest);
                              },
                              onChanged: (text) {
                                searchRequest = text;
                                context
                                    .read<ItemListProvider>()
                                    .setSearchRequest(searchRequest);
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Искать с ${context.watch<DataRangeProvider>().startDateValue} по ${context.watch<DataRangeProvider>().finishDateValue} год',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          ChangeRangeButton(),
                          const SearchElevatedButton(),
                          const AccurateOnOffSwitcher(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const NoInternet(),
    );
  }
}
