import 'package:clean_architecture/features/data/models/crew_detail_model.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  final List<Cast> crew;
  const ListViewWidget({super.key, required this.crew});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: widget.crew.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),

      itemBuilder: (BuildContext context, int index) {
        if (index % 2 == 0) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                widget.crew[index].name,
                      // "Item $index",
                      style:const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                       Text(
                         widget.crew[index].knownForDepartment.toString().toLowerCase()=="acting"?"Actor":"",
                      style:const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: index + 1 < widget.crew.length
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.crew[index+1].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                     Text(
                      widget.crew[index+1].knownForDepartment.toString().toLowerCase()=="acting"?"Actor":"",
                      style:const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
                    : Container(), // Empty for the last odd item
              ),
            ],
          );
        } else {
          return Container();
        }

      },
    );
  }
}
