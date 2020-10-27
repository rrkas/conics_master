import 'package:flutter/material.dart';

class NumberedColumnWidget extends StatelessWidget {
  final List<Widget> children;
  NumberedColumnWidget({@required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: children.length,
      itemBuilder: (ctx, idx) => Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: Theme.of(context).primaryColor)),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6),
            child: Text((idx + 1).toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
          ),
          SizedBox(width: 10),
          Expanded(child: children[idx]),
        ],
      ),
      separatorBuilder: (_, __) => Divider(indent: 30, endIndent: 30, color: Colors.black12),
    );
  }
}
