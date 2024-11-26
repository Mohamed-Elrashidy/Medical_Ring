import 'package:flutter/material.dart';
import 'package:medical_ring_app/features/ring/domain/entity/ring_data_entity.dart';
import 'package:medical_ring_app/features/ring/utils/dummy_data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../domain/enum/header_type.dart';
import '../../../utils/constants.dart';

class RingReadingsTable extends StatelessWidget {
  const RingReadingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      headerGridLinesVisibility: GridLinesVisibility.horizontal,
       gridLinesVisibility: GridLinesVisibility.horizontal,
     // allowColumnsResizing: true,
      source: RingDataSource(ringDataEntity: DummyData.ringDataEntity),
      columns: [
        for (var item in Constants.ringTableHeaderData)
          GridColumn(
              width: 45,
              columnName: item.id,
              label:
                  item.type == HeaderType.text ? Text(item.text!) : Text("--"))
      ],
    );
  }
}

class RingDataSource extends DataGridSource {
  List<RingDataEntity> ringDataEntity;
  List<DataGridRow> rows = [];
  RingDataSource({required this.ringDataEntity}) {
    rows = ringDataEntity
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell(
                  columnName: Constants.ringTableHeaderData[0].id,
                  value: e.number),
              DataGridCell(
                  columnName: Constants.ringTableHeaderData[1].id,
                  value: e.oxygen),
              DataGridCell(
                  columnName: Constants.ringTableHeaderData[2].id,
                  value: e.hasSomePoint),
              DataGridCell(
                  columnName: Constants.ringTableHeaderData[3].id,
                  value: e.heartRate),
              DataGridCell(
                  columnName: Constants.ringTableHeaderData[4].id,
                  value: e.temperature),
              DataGridCell(
                  columnName: Constants.ringTableHeaderData[5].id,
                  value: e.hasBlood),
              DataGridCell(
                  columnName: Constants.ringTableHeaderData[6].id,
                  value: e.steps),
              DataGridCell(
                  columnName: Constants.ringTableHeaderData[7].id,
                  value: e.hasCovid),
            ]))
        .toList();
  }

  @override
  List<RingDataEntity> get dataSource => ringDataEntity;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(8),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
