import 'package:first_app/services/values.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool gender = true;
  bool isVisible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  var result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                ),
                const Text(
                  'Enter Your Height in cm:',
                  textScaleFactor: 1.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                TextFormField(
                  controller: height,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Height in cm',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .035,
                ),
                const Text(
                  'Enter Your Weight in kg:',
                  textScaleFactor: 1.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                TextFormField(
                  controller: weight,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Weight in kg',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                ),
                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      final convert = (double.parse(height.text) * 0.01);
                      result = double.parse(weight.text) / (convert * convert);

                      setState(() {
                        isVisible = !isVisible;
                      });
                    }
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        'Calculate',
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                // Visibility(
                //   visible: isVisible,
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Text(
                //         '${checkBMI(result)} ${result.toStringAsFixed(1)}',
                //         textAlign: TextAlign.center,
                //       ),
                //       SizedBox(
                //         height: 250,
                //         width: 200,
                //         child: SfCartesianChart(
                //           annotations: <CartesianChartAnnotation>[
                //             CartesianChartAnnotation(
                //               widget: const CircleAvatar(
                //                 radius: 5,
                //                 backgroundColor: Colors.red,
                //               ),
                //               coordinateUnit: CoordinateUnit.point,
                //               region: AnnotationRegion.chart,
                //               x: double.tryParse(weight.text) ?? 0,
                //               y: double.tryParse(height.text) ?? 0,
                //             ),
                //           ],
                //           series: <ChartSeries>[
                //             LineSeries<ChartModel, double>(
                //               dataSource: data,
                //               xValueMapper: (datum, _) => datum.weight,
                //               yValueMapper: (datum, _) => datum.height,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Visibility(
                  visible: isVisible,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: SfCartesianChart(
                      title: ChartTitle(
                        text:
                            '${checkBMI(result)} (${result.toStringAsFixed(1)})',
                      ),
                      legend: Legend(isVisible: true),
                      primaryYAxis: CategoryAxis(
                        maximum: 500,
                        minimum: 40,
                      ),
                      annotations: [
                        CartesianChartAnnotation(
                          widget: const CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.white,
                          ),
                          coordinateUnit: CoordinateUnit.point,
                          region: AnnotationRegion.chart,
                          x: double.tryParse(height.text),
                          y: double.tryParse(weight.text),
                        ),
                      ],
                      series: [
                        StackedAreaSeries(
                          dataSource: underWeight,
                          xValueMapper: (datum, index) => datum.height,
                          yValueMapper: (datum, index) => datum.weight,
                          color: Colors.blueAccent,
                          name: 'UnderWieght',
                        ),
                        StackedAreaSeries(
                          dataSource: healthy,
                          xValueMapper: (datum, index) => datum.height,
                          yValueMapper: (datum, index) => datum.weight,
                          color: Colors.greenAccent,
                          name: 'Healthy',
                        ),
                        StackedAreaSeries(
                          dataSource: overWeight,
                          xValueMapper: (datum, index) => datum.height,
                          yValueMapper: (datum, index) => datum.weight,
                          color: Colors.deepOrangeAccent,
                          name: 'OverWeight',
                        ),
                        StackedAreaSeries(
                          dataSource: obese,
                          xValueMapper: (datum, index) => datum.height,
                          yValueMapper: (datum, index) => datum.weight,
                          color: Colors.red,
                          name: 'Obese',
                        ),
                      ],
                    ),
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

String checkBMI(double number) {
  if (number < 18.5) {
    return 'Underweight';
  } else if (number >= 18.5 && number < 25) {
    return 'Healthy';
  } else if (number >= 25 && number < 30) {
    return 'Overweight';
  }
  return 'Obese';
}
