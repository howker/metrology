import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';
import 'package:infopoverka/providers/select_provider.dart';
import 'package:infopoverka/utils/valid_data_check.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  final Items item;

  const ItemCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  void setState(VoidCallback fn) {
    widget.item.isSelected = !widget.item.isSelected;

    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 2,
        child: InkWell(
          onLongPress: () {
            !widget.item.isSelected
                ? context
                    .read<SelectProvider>()
                    .addItemToSelectedList(item: widget.item)
                : context
                    .read<SelectProvider>()
                    .removeItemFromSelectedList(item: widget.item);

            setState(() {});
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: widget.item.isSelected ? Colors.blueGrey : Colors.white,
            ),
            child: ExpansionTile(
              title: Text(widget.item.mitTitle ?? ''),
              subtitle: AbsorbPointer(
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: ValidDataCheck.validStatus(
                        widget.item.validDate ?? '',
                      )
                          ? Colors.green
                          : Colors.red,
                    ),
                    Icon(
                      Icons.assignment_turned_in_outlined,
                      color: widget.item.applicability!
                          ? Colors.green
                          : Colors.red,
                    ),
                  ],
                ),
              ),
              children: [
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Организация - поверитель'),
                  subtitle: Text(widget.item.orgTitle ?? ''),
                  dense: true,
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Рег № типа СИ'),
                  subtitle: Text(widget.item.mitNumber ?? ''),
                  dense: true,
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Наименование типа СИ'),
                  subtitle: Text(widget.item.mitTitle ?? ''),
                  dense: true,
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Обозначение типа СИ'),
                  subtitle: Text(widget.item.mitNotation ?? ''),
                  dense: true,
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Модификация СИ'),
                  subtitle: Text(widget.item.miModification ?? ''),
                  dense: true,
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Заводской/серийный номер'),
                  subtitle: Text(widget.item.miNumber ?? ''),
                  dense: true,
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Дата поверки'),
                  subtitle: Text(
                    widget.item.verificationDate ?? '',
                  ),
                  dense: true,
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Действительна до'),
                  subtitle: Text(
                    widget.item.validDate ?? '',
                    style: TextStyle(
                      color: ValidDataCheck.validStatus(
                        widget.item.validDate ?? '',
                      )
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  dense: true,
                  trailing: Icon(
                    Icons.access_time_outlined,
                    color:
                        ValidDataCheck.validStatus(widget.item.validDate ?? '')
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Номер свидетельства'),
                  subtitle: Text(widget.item.resultDocnum ?? ''),
                  dense: true,
                ),
                ListTile(
                  visualDensity: const VisualDensity(vertical: -4),
                  title: const Text('Пригодность'),
                  subtitle: widget.item.applicability!
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
                        widget.item.applicability! ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
