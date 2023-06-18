import 'package:flutter/material.dart';

class DietarySchedules extends StatelessWidget {
  const DietarySchedules({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          const Text(
            'Simple Dietary Schedules',
            textScaleFactor: 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          const ListTile(
            leading: Text(
              'Day 1',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            title: Text(
              'Total Calories',
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            subtitle: Text(
              '17mg-Iron 45gm-Fat 1000mg-Calcium 100mg- Sodium 110gm-Protein = 2100/Cal',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          const ListTile(
            leading: Text(
              'Day 2',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            title: Text(
              'Total Calories',
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            subtitle: Text(
              '18mg-Iron 48gm-Fat 1000mg-Calcium 100mg- Sodium 130gm-Protein = 2200/Cal',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          const ListTile(
            leading: Text(
              'Day 3',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            title: Text(
              'Total Calories',
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            subtitle: Text(
              '19mg-Iron 51gm-Fat 1000mg-Calcium 100mg- Sodium 150gm-Protein = 2300/Cal',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          const ListTile(
            leading: Text(
              'Day 4',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            title: Text(
              'Total Calories',
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            subtitle: Text(
              '20mg-Iron 54gm-Fat 1000mg-Calcium 100mg- Sodium 180gm-Protein = 2400/Cal',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          const ListTile(
            leading: Text(
              'Day 5',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            title: Text(
              'Total Calories',
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            subtitle: Text(
              '21mg-Iron 57gm-Fat 1000mg-Calcium 100mg- Sodium 200gm-Protein = 2500/Cal',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          const ListTile(
            leading: Text(
              'Day 6',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            title: Text(
              'Free Day',
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            subtitle: Text(
              'Reach At least 5k to 10k Calories',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          const ListTile(
            leading: Text(
              'Day 7',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
            title: Text(
              'Total Calories',
              style: TextStyle(
                color: Colors.indigoAccent,
              ),
            ),
            subtitle: Text(
              '22mg-Iron 60gm-Fat 1000mg-Calcium 100mg- Sodium 200gm-Protein = 2600/Cal',
            ),
          ),
        ],
      ),
    );
  }
}
