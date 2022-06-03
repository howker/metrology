import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/screens/search/favorite_button.dart';
import 'package:infopoverka/utils/valid_data_check.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  static final tween = Tween<double>(begin: 0, end: 1);
  final Items item;

  const ItemCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    item.isSelected = context.watch<SelectProvider>().isSelected(item);
    return Material(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 2,
        child: InkWell(
          onLongPress: () {
            !item.isSelected
                ? context
                    .read<SelectProvider>()
                    .addItemToSelectedList(item: item)
                : context
                    .read<SelectProvider>()
                    .removeItemFromSelectedList(item: item);
            context.read<SelectProvider>().toggleItemSelected(item);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: item.isSelected ? Colors.blue.shade100 : Colors.white,
            ),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(seconds: 1),
              tween: tween,
              builder: (_, value, __) {
                return Opacity(
                  opacity: value,
                  child: ExpansionTile(
                    collapsedIconColor: Colors.black,
                    leading: FavoriteButton(item: item),
                    title: Text(
                      item.mitTitle ?? '',
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: AbsorbPointer(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: ValidDataCheck.validStatus(
                              item.validDate ?? '',
                            )
                                ? Colors.green
                                : Colors.red,
                          ),
                          Icon(
                            Icons.assignment_turned_in_outlined,
                            color:
                                item.applicability! ? Colors.green : Colors.red,
                          ),
                        ],
                      ),
                    ),
                    children: [
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Организация - поверитель'),
                        subtitle: Text(item.orgTitle ?? ''),
                        dense: true,
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Рег № типа СИ'),
                        subtitle: Text(item.mitNumber ?? ''),
                        dense: true,
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Наименование типа СИ'),
                        subtitle: Text(item.mitTitle ?? ''),
                        dense: true,
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Обозначение типа СИ'),
                        subtitle: Text(item.mitNotation ?? ''),
                        dense: true,
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Модификация СИ'),
                        subtitle: Text(item.miModification ?? ''),
                        dense: true,
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Заводской/серийный номер'),
                        subtitle: Text(item.miNumber ?? ''),
                        dense: true,
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Дата поверки'),
                        subtitle: Text(
                          item.verificationDate ?? '',
                        ),
                        dense: true,
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Действительна до'),
                        subtitle: Text(
                          item.validDate ?? '',
                          style: TextStyle(
                            color: ValidDataCheck.validStatus(
                              item.validDate ?? '',
                            )
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        dense: true,
                        trailing: Icon(
                          Icons.access_time_outlined,
                          color:
                              ValidDataCheck.validStatus(item.validDate ?? '')
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Номер свидетельства'),
                        subtitle: Text(item.resultDocnum ?? ''),
                        dense: true,
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -4),
                        title: const Text('Пригодность'),
                        subtitle: item.applicability!
                            ? const Text(
                                'Пригодно',
                                style: TextStyle(color: Colors.green),
                              )
                            : const Text(
                                'Непригодно',
                                style: TextStyle(color: Colors.red),
                              ),
                        dense: true,
                        trailing: Icon(
                          Icons.assignment_turned_in_outlined,
                          color:
                              item.applicability! ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
